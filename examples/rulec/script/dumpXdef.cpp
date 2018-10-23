/* Copyright (c) 2018 The Connectal Project
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included
 * in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/uio.h>
#include <unistd.h>
#include <string>
#include <map>

#define BUFFER_SIZE 16384000
#define MAX_MESSAGE 40000
#define STRING -2
struct {
    int val, tag;
    std::string str;
} messageData[MAX_MESSAGE];
int messageDataIndex;
uint8_t inbuf[BUFFER_SIZE];
const char header[] = "Xilinx_Design_Exchange_Format";
const char placerHeader[] = "Xilinx Placer Database, Copyright 2014 All rights reserved.";
const char deviceCacheHeader[] = "Xilinx Device Cache, Copyright 2014 All rights reserved.";
const char xnHeader[] = "XLNX:NTLP";
int ttrace = 0;
int trace = 0;
int mtrace = 0;
int messageLen;
std::string tagStringValue;
int tagLength;
int tagLine;
int tagValue;
const char *stripPrefix;
void traceString(std::string str);

inline std::string autostr(uint64_t X, bool isNeg = false)
{
  char Buffer[21];
  char *BufPtr = std::end(Buffer);

  if (X == 0) *--BufPtr = '0';  // Handle special case...

  while (X) {
    *--BufPtr = '0' + char(X % 10);
    X /= 10;
  }

  if (isNeg) *--BufPtr = '-';   // Add negative sign...
  return std::string(BufPtr, std::end(Buffer));
}

std::string translateName(const char *prefix, int index)
{
    char buffer[1000];
    static struct {
        const char *key;
        const char *val;
    } lookupMap[] = {
#include "cacheData.h"
        { nullptr, nullptr } };
    int lookupIndex = 0;

    sprintf(buffer, "%s_%03x", prefix, index);
    while (lookupMap[lookupIndex].key)
        if (!strcmp(lookupMap[lookupIndex].key, buffer))
            return lookupMap[lookupIndex].val;
        else
            lookupIndex++;
    return buffer;
}

void memdump(const unsigned char *p, int len, const char *title)
{
int i;

    i = 0;
    while (len > 0) {
        if (!(i & 0xf)) {
            if (i > 0)
                fprintf(stdout, "\n");
            fprintf(stdout, "%s: ",title);
        }
        fprintf(stdout, "%02x ", *p++);
        i++;
        len--;
    }
    fprintf(stdout, "\n");
}

uint8_t const *bufp = inbuf;

void skipBuf(int len)
{
    if (trace || len > 1)
        memdump(bufp, len, "fill");
    bufp += len;
}

void checkByte(int byte)
{
    assert(*bufp == byte);
    bufp++;
}

void checkId(int val, int expected)
{
    if (val != expected)
        printf("[%s:%d] value was %x, expected %x\n", __FUNCTION__, __LINE__, val, expected);
assert (val == expected);
}

void checkStr(std::string val, std::string expected)
{
assert (val == expected);
}

int readInteger()
{
    int ret = 0;
    if (*bufp == ' ')
        bufp++;
    uint8_t const *start = bufp;
    bool isNeg = false;
    while(1) {
        if (*bufp == '-')
            isNeg = true;
        else if (isdigit(*bufp))
            ret = ret * 10 + *bufp - '0';
        else
            break;
        bufp++;
    }
if (start == bufp)
     memdump(bufp-16, 64, "BADREADINT");
    assert(start != bufp);
    std::string temp(start, bufp);
//printf("[%s:%d] readint %s start %p bufp %p isneg %d\n", __FUNCTION__, __LINE__, temp.c_str(), start, bufp, isNeg);
    if (isNeg)
        ret = -ret;
if (trace)
printf("[%s:%d] readint %d=%x\n", __FUNCTION__, __LINE__, ret, ret);
    return ret;
}

std::string readString()
{
    int len = readInteger();
    assert(*bufp == ' ');
    bufp++;
    assert(len < 1000);
    std::string temp(bufp, bufp + len);
    bufp += len;
if (trace)
printf("[%s:%d] readstring '%s'\n", __FUNCTION__, __LINE__, temp.c_str());
    return temp;
}

std::string readStrn()
{
    int len = *bufp++;
    assert(len < 50);
    std::string temp(bufp, bufp + len);
    bufp += len;
if (trace)
printf("[%s:%d] len %d '%s'\n", __FUNCTION__, __LINE__, len, temp.c_str());
    return temp;
}

long readVarint(uint8_t const **ptr = &bufp, bool internal = false)
{
    uint8_t const *start = (*ptr);
    while (*(*ptr) & 0x80)
        (*ptr)++;
    uint8_t const *p = (*ptr)++;
    long ret = 0;
    while (p >= start)
        ret = ret << 7 | (*p-- & 0x7f);
    if ((trace || mtrace) && !internal)
        printf("%s: word %lx\n", __FUNCTION__, ret);
    return ret;
}

int tagError;
int readTag(uint8_t const **ptr = &bufp, bool internal = false)
{
    tagStringValue = "";
    tagLength = 0;
    tagError = 0;
    uint8_t const *start = (*ptr); (void) start;
    long ch = readVarint(ptr, true);
    int line = ch & 0x7;
    int tag = ch >> 3;
    //printf("[%s:%d] buf %x line %x tag %d=0x%x\n", __FUNCTION__, __LINE__, ch, line, tag, tag);
    tagLine = line;
    tagValue = tag;
    switch (line) {
    case 0: { // varint
        long ret = readVarint(ptr, true);
        if (trace)
            printf("[%s:%d] tag %d varint %lx\n", __FUNCTION__, __LINE__, tag, ret);
        return ret;
        }
    case 1: {// 64 bit
        uint64_t ret = 0;
        memcpy(&ret, (*ptr), 8);
        (*ptr) += 8;
        if (trace)
            printf("[%s:%d] tag %d 64bit %llx\n", __FUNCTION__, __LINE__, tag, (unsigned long long)ret);
        return ret;
        }
    case 2: { // length delim
        long len = readVarint(ptr, true);
        tagLength = len;
        tagStringValue = std::string((*ptr), (*ptr) + len);
        if (trace) {
            printf("%s: tag %d len %ld", __FUNCTION__, tag, len);
            traceString(tagStringValue);
        }
        (*ptr) += tagLength;
        return STRING;
        break;
        }
    case 3: { // start group -- deprecated
        tagError = 1;
        if (!internal)
        if (1 || trace) {
            printf("[%s:%d] STARTGROUP ", __FUNCTION__, __LINE__);
            memdump(start, 16, "");
        }
        return -1;
        }
    case 4: { // end group -- deprecated
        tagError = 1;
        if (!internal)
        if (1 || trace) {
            printf("[%s:%d] ENDGROUP ", __FUNCTION__, __LINE__);
            memdump(start, 16, "");
        }
        return -1;
        }
    case 5: { // 32 bit
        uint32_t ret = 0;
        memcpy(&ret, (*ptr), 4);
        (*ptr) += 4;
        if (trace)
            printf("[%s:%d] tag %d 32bit %x\n", __FUNCTION__, __LINE__, tag, ret);
        return ret;
        }
    default:
        tagError = 1;
        if (!internal) {
        printf("[%s:%d] ERRORTAG: line %d tag 0x%x offset %lx\n", __FUNCTION__, __LINE__, line, tag, start - inbuf);
memdump(start - 32, 128, "BUF16");
exit(-1);
        }
        return -1;
    }
    return 0;
}

void traceString(std::string str)
{
    int len = str.length();
    uint8_t const *strp = (uint8_t const *)str.c_str();
    uint8_t const *strend = strp + len;
    bool allPrintable = true;
    for (auto ch : str)
        if (!isprint(ch))
            allPrintable = false;
    if (allPrintable)
        printf(" '%s'", strp);
    else {
        const char *sep = "";
        printf("(");
        while (strp < strend) {
            printf("%s", sep);
            uint8_t const *start = strp;
            int tagVal = readTag(&strp, true);
            if (tagError) {
                strp = start;
                break;
            }
            if (tagStringValue != "") {
                std::string lstr = tagStringValue;
                if (stripPrefix && lstr.substr(0, strlen(stripPrefix)) == stripPrefix)
                    lstr = lstr.substr(strlen(stripPrefix));
                traceString(lstr);
            }
            else
                printf("%x", tagVal);
            sep = ", ";
        }
        len = strend - strp;
        if (len > 0)
            memdump(strp, len > 64 ? 64 : len, "");
        printf(")");
    }
}

int deviceColumns = 0x1000000;
void readNodeList(bool &first)
{
    int count = readInteger();
    int param = readInteger();
    if (param)
        printf("param %d: ", param);
    if (first) {
        int extra = readInteger();
        checkId(extra, 0);
        extra = readInteger();
        checkId(extra, 0);
        first = false;
    }
    int nodeWrap = 5;
    for (int i = 0; i < count; i++) {
        int tile = readInteger();
        int sitePin = readInteger();
        //int pinType = (sitePin >> 16) & 0xffff;
        //sitePin &= 0xffff;
        //int row = tile/deviceColumns;
        //int column = tile % deviceColumns;
        int t1 = (tile >> 29) & 1;
        int t2 = (tile >> 28) & 1;
        tile &= 0x3fffff;
        printf("[tile %03x %x:%x] ", tile, sitePin >> 16, sitePin & 0xffff);
        checkId(t1, 0);
        checkId(t2, 0);
        if (--nodeWrap == 0) {
            printf("\n        ");
            nodeWrap = 5;
        }
    }
}

int readMessage()
{
    messageDataIndex = 0;
    messageLen = readVarint(&bufp, true);
    const char *sep = "";
    uint8_t const *endp = bufp + messageLen;
    if (mtrace)
        printf("message[%d]: ", messageLen);
    while (bufp < endp) {
        int val = readTag();
        messageData[messageDataIndex].val = val;
        messageData[messageDataIndex].str = tagStringValue;
        messageData[messageDataIndex].tag = tagValue;
        if (mtrace) {
            printf("%s %x:", sep, tagValue);
            if (tagStringValue != "")
                traceString(tagStringValue);
            else
                printf("%x", val);
        }
        messageDataIndex++;
        sep = ", ";
    }
    if (mtrace)
        printf("\n");
    int excessRead = bufp - endp;
    if (excessRead) {
        printf("[%s:%d] excessreadofmessage %d\n", __FUNCTION__, __LINE__, excessRead);
        //assert(!excessRead);
    }
    return messageDataIndex;
}

void dumpQuad(const char *sep, const char *end)
{
    checkId(messageDataIndex, 4);
    for (int msgIndex = 0; msgIndex < 4; msgIndex++) {
        if (messageData[msgIndex].val == STRING)
            printf("%s'%s'", sep, messageData[msgIndex].str.c_str());
        else
            printf("%s%x", sep, messageData[msgIndex].val);
        sep = ", ";
    }
    printf("%s", end);
}

bool lineValid;
void belStart(int elementNumber)
{
    if (!lineValid) {
        lineValid = true;
        printf("    BEL %s", translateName("Element", elementNumber).c_str());
    }
}

void dumpXdef(void)
{
//jca
    printf("Parse header\n");
    checkStr(std::string(bufp, bufp + strlen(header)), header);
    bufp += strlen(header);
    std::string fileType = readString();
    int head1 = readInteger();
    int head2 = readInteger();
    int head3 = readInteger();
    int version = readInteger();

    std::string build = readString();
    int flag1 = readInteger();
printf("[%s:%d] filetype %s: %x, %x, %x, version %d. zero/non-zero %d build %s\n", __FUNCTION__, __LINE__, fileType.c_str(), head1, head2, head3, version, flag1, build.c_str());
    int head5 = readInteger();
    std::string str1 = readString();
    std::string device = readString();
    std::string package = readString();
    int head6 = readInteger();
    int head7 = readInteger();
    int nLimit = readInteger();
printf("[%s:%d] head5 %d device '%s' package '%s' limit %d str1 '%s': %x %x\n", __FUNCTION__, __LINE__, head5, device.c_str(), package.c_str(), nLimit, str1.c_str(), head6, head7);
    for (int i = 0; i < 3; i++) {
        checkId(readInteger(), 0);
    }
    for (int i = 0; i < nLimit; i++) {
        int val1 = readInteger();
        int val2 = readInteger();
        int val3 = readInteger();
        std::string name = readString();
        if (trace)
            printf("[%s:%d] [%d] %s %x, %x, %x\n", __FUNCTION__, __LINE__, i, name.c_str(), val1, val2, val3);
    }
    int head8 = readInteger();
    int head9 = readInteger();
    printf("Parse place %x, %x\n", head8, head9);
    int mlen = readMessage();
    checkId(mlen, 2);
    int head11 = messageData[0].val;
    int head12 = messageData[1].val;
    printf("[%s:%d] head11 %x head12 %x\n", __FUNCTION__, __LINE__, head11, head12);
//trace = 1;
    mlen = readMessage();
    checkId(mlen, 1);
    checkId(messageData[0].val, 0);
    mlen = readMessage();
    checkId(mlen, 3);
    checkId(messageData[0].val, 0xdead0000);
    checkStr(messageData[1].str, placerHeader);
    checkId(messageData[2].val, 2);
    printf("Parse QDesign\n");
    mlen = readMessage();
    int sitetypeLen = messageData[0].val;
    std::map<int, std::map<int, int>> offsetMap;
int lastSiteId = 0;
    for (int sitetypeIndex = 0; sitetypeIndex < sitetypeLen; sitetypeIndex++) {
        mlen = readMessage();
        checkId(messageData[0].val, 0xdead3333);
        checkId(mlen, 4); // site info
        int siteTypeId = messageData[1].val;
        std::string siteTypeName = messageData[2].str;
        int sitetypeInfo = messageData[3].val;
        mlen = readMessage();
        checkId(mlen, 1);
        int IOpipType = messageData[0].val;
        mlen = readMessage();
        checkId(mlen, 1);
        int pipType = messageData[0].val;
        mlen = readMessage();
        checkId(mlen, 1);
        checkId(messageData[0].val, 0xdead4444); // loop for BEL
        mlen = readMessage();
        int belCount = messageData[0].val;
        printf("sitetype %s id %x diff %x", siteTypeName.c_str(), siteTypeId, siteTypeId - lastSiteId);
        int ind = siteTypeName.find("_X");
        if (ind > 0) {
            std::string temp = siteTypeName.substr(ind+2);
            int xoff = atoi(temp.c_str());
            ind = temp.find("Y");
            if (ind > 0) {
                int yoff = atoi(temp.substr(ind+1).c_str());
                offsetMap[xoff][yoff] = siteTypeId;
            }
        }
        lastSiteId = siteTypeId;
        printf(" %s", translateName("SiteType", sitetypeInfo).c_str());
        printf(" piptype %x\n", pipType ? pipType : IOpipType);
        for (int belIndex = 0; belIndex < belCount; belIndex++) {
            mlen = readMessage();
            checkId(mlen, 1);
            int belNumber = messageData[0].val;
            mlen = readMessage();
            checkId(mlen, 1);
            int cellCount = messageData[0].val;
            int lineId = -1;
            mlen = readMessage();
            checkId(messageData[0].val, 0xdead5555);
            lineValid = false;
            bool hasCell = false;
            int cell1, cell2, cell3;
            //belStart(belNumber); // always output
            if (cellCount) {
                checkId(cellCount, 1);
                belStart(belNumber);
                for (int cellIndex = 0; cellIndex < cellCount; cellIndex++) {
                    readMessage(); // cell info
                    if (lineId == -1)
                        lineId = messageData[0].val;
                    assert(lineId == messageData[0].val);
                    cell1 = messageData[1].val;
                    cell2 = messageData[2].val;
                    cell3 = messageData[3].val;
                    hasCell = true;
                    printf(" [%x %x %x]", cell1, cell2, cell3);
                }
                printf("");
            }
            mlen = readMessage();
            checkId(mlen, 1);
            checkId(messageData[0].val, 0xdead6666);
            mlen = readMessage();
            checkId(mlen, 1);
            const char *sep = "";
            if (int nameCount = messageData[0].val) {
                belStart(belNumber);
                printf(" pins {");
                bool hasData = false;
                int save1, save3;
                int pinWrap = 4;
                for (int nameIndex = 0; nameIndex < nameCount; nameIndex++) {
                    mlen = readMessage();
                    //int pinId = messageData[0].val;
                    checkId(mlen, 1);
                    mlen = readMessage();
                    checkId(mlen, 1);
                    if (int pinCount = messageData[0].val) {
                    bool putPinId = false;
                    printf("%s", sep);
                    for (int pinIndex = 0; pinIndex < pinCount; pinIndex++) {
                        readMessage(); // pin info
                        checkId(messageDataIndex, 4);
                        if (lineId == -1)
                            lineId = messageData[0].val;
                        assert(lineId == messageData[0].val);
                        int val1 = messageData[1].val;
                        int val3 = messageData[3].val;
                        assert(!hasCell || cell1 == val1);
                        if (!hasData || save1 != val1 || save3 != val3) {
                            printf("[");
                            if (!hasCell)
                                printf("%x ", val1);
                            printf("%x] ", val3);
                        }
                        //if (!putPinId)
                            //printf("%x ", pinId);
                        putPinId = true;
                        printf("%s", messageData[2].str.c_str());
                        hasData = true;
                        save1 = val1;
                        save3 = val3;
                    }
                    sep = ", ";
                    if (--pinWrap == 0 && nameCount > 20) {
                        pinWrap = 4;
                        sep = ",\n        ";
                    }
                    }
                }
                printf("}");
            }
            if (lineValid) {
                if (lineId == -1)
                    printf("\n");
                else
                    printf(" BEL_%03x\n", lineId);
            }
        }
        mlen = readMessage();
        checkId(mlen, 1);
        checkId(messageData[0].val, 0);
        mlen = readMessage();
        int thisPip = messageData[0].val;
        checkId(mlen, 1);
        mlen = readMessage();
        checkId(mlen, 1);
        checkId(messageData[0].val, 0xdead7777); // PIP
        mlen = readMessage();
        checkId(mlen, 1);
        int pipCount = messageData[0].val;
        assert((!IOpipType && thisPip == pipType) || (!pipType && IOpipType == thisPip && !pipCount));
        if (pipCount) {
        printf("    PIP_%x ", thisPip);
        int pipWrap = 7;
        const char *sep = "";
        for (int pipIndex = 0; pipIndex < pipCount; pipIndex++) {
            readMessage();
            checkId(messageDataIndex, 4);
            int val1, val3, val;
            val1 = messageData[0].val;
            val = messageData[1].val;
            val3 = messageData[3].val;
            assert(val3 == 0 || val3 == 1);
            if (!val3)
                continue; // unused
            checkId(messageData[2].val, 0x0f); // always "OUT"
            printf("%s", sep);
            if (--pipWrap == 0) {
                printf("\n        ");
                pipWrap = 7;
            }
            printf("%s:%s", translateName("Element", val1).c_str(),
                translateName("ElementPin", val).c_str());
            sep = ", ";
        }
        printf("\n");
        }
        mlen = readMessage();
        checkId(mlen, 1);
        checkId(messageData[0].val, 0xdead8888); // net
        mlen = readMessage();
        checkId(mlen, 1);
        if (int netCount = messageData[0].val) {
            const char *sep = "";
            printf("    SITETYPENET ");
            int swWrap = 3;
            for (int netIndex = 0; netIndex < netCount; netIndex++) {
                mlen = readMessage();
                checkId(mlen, 1);
                int pinNetId = messageData[0].val;
                mlen = readMessage();
                checkId(mlen, 1);
                if (int connCount = messageData[0].val) {
                    printf("%s %s {", sep, translateName("SiteTypeNet", pinNetId).c_str());
                    const char *sep2 = "";
                    for (int connIndex = 0; connIndex < connCount; connIndex++) {
                        mlen = readMessage();
                        checkId(mlen, 1);
                        printf("%sSW_%03x", sep2, messageData[0].val);
                        sep2 = ", ";
                    }
                    printf("}");
                    sep = ",";
                    if (--swWrap == 0) {
                        sep = ",\n        ";
                        swWrap = 3;
                    }
                }
            }
            printf("\n");
        }
        mlen = readMessage();
        checkId(mlen, 1);
        checkId(messageData[0].val, 0xdead9999); // port
        checkId(mlen, 1);
        mlen = readMessage();
        if (int portCount = messageData[0].val) {
            printf("    port");
            for (int portIndex = 0; portIndex < portCount; portIndex++) {
                mlen = readMessage();
                checkId(mlen, 4);
                printf(" {%s %s}", messageData[0].str.c_str(), translateName("Element", messageData[1].val).c_str());
                checkId(messageData[2].val, 1);
                checkId(messageData[3].val, 0);
            }
            printf("\n");
        }
    }
    mlen = readMessage();
    checkId(mlen, 1);
    checkId(messageData[0].val, 0xdeaddddd); // locked
    mlen = readMessage();
    checkId(mlen, 1);
    checkId(messageData[0].val, 0);
    mlen = readMessage();
    checkId(mlen, 1);
    checkId(messageData[0].val, STRING);
    checkStr(messageData[0].str, "");
    mlen = readMessage();
    checkId(mlen, 1);
    checkId(messageData[0].val, 0xdeadeeee);
    mlen = readMessage();
    checkId(mlen, 1);
    checkId(messageData[0].val, 0);
    mlen = readMessage();
    checkId(mlen, 1);
    checkId(messageData[0].val, STRING);
    checkStr(messageData[0].str, "");
    mlen = readMessage();
    checkId(mlen, 2);
    checkId(messageData[0].val, 0xdeadcccc);
    checkId(messageData[1].val, 1);
    mlen = readMessage();
    checkId(mlen, 1);
    checkId(messageData[0].val, 1);

    printf("Parse design Q\n");
    checkId(readInteger(), 3); // routing version
    int tileCount = readInteger();
    for (int tileIndex = 0; tileIndex < tileCount; tileIndex++) {
        std::string gname = readString();
        printf("tiletype %s [%x]: \n        ", gname.c_str(), tileIndex);
        int listCount = readInteger();
        int tileWrap = 3;
        for (int listIndex = 0; listIndex < listCount; listIndex++) {
            std::string name = readString();
            printf("%s ", name.c_str());
            if (--tileWrap == 0) {
                printf("\n        ");
                tileWrap = 3;
            }
        }
        printf("\n");
    }
    checkStr(readString(), "END_HEADER");
    bool first = true;
    int nameCount = readInteger();
    int vv2 = readInteger();
    int vv3 = readInteger();
    printf("Read nets %d, %d, %d\n", nameCount, vv2, vv3);
    for (int nameIndex = 0; nameIndex < nameCount; nameIndex++) {
        std::string temp = readString();
        int desId = readInteger();
        printf("NET_%x %s: ", desId, temp.c_str());
        if (first) {
            int extra = readInteger();
            checkId(extra, 0);
        }
        int sec = readInteger();
        checkId(sec, 0);
        if (first) {
            int extra = readInteger();
            checkId(extra, 0);
            extra = readInteger();
            checkId(extra, 0);
            extra = readInteger();
            checkId(extra, 0);
        }
        int groupCount = readInteger();
        int fourth = readInteger();
        checkId(fourth, 0);
        if (first) {
            int extra = readInteger();
            checkId(extra, 0);
            extra = readInteger();
            checkId(extra, 0);
        }
        readNodeList(first);
        printf("\n");
        assert(groupCount == 1);
    }
    int netCount = readInteger();
    printf("Global nets %d\n", netCount);
    int netNumber = 0;
    while(netNumber < netCount) {
        std::string netName = readString();
        int val = readInteger();
        int val2 = readInteger();
        int groupCount = readInteger();
        printf("global %s: %x, %x\n", netName.c_str(), val, val2);
        int fourth = readInteger();
        checkId(fourth, 0);
        for (int groupIndex = 0; groupIndex < groupCount; groupIndex++) {
            printf("    list: ");
            readNodeList(first);
            printf("\n");
        }
        netNumber++;
    }
    mlen = readMessage();
    checkId(mlen, 1);
    checkId(messageData[0].val, 0xdeadaaaa);
    mlen = readMessage();
    checkId(mlen, 1);
    int lval = messageData[0].val;
    for (int lind = 0; lind < lval; lind++) {
        mlen = readMessage();
        checkId(mlen, 3);
        printf("Site2Net %s SW_%03x NET_%x\n", messageData[0].str.c_str(), messageData[1].val, messageData[2].val);
    };
    mlen = readMessage();
    checkId(mlen, 1);
    checkId(messageData[0].val, 0xdeadbbbb);
    mlen = readMessage();
    checkId(mlen, 1);
    int sval = messageData[0].val;
    for (int sind = 0; sind < sval; sind++) {
        mlen = readMessage();
        checkId(mlen, 3);
        printf("SVAL %s BEL_%03x %x\n", messageData[0].str.c_str(), messageData[1].val, messageData[2].val);
    };
    printf("Parse device cache\n");
    mlen = readMessage();
    checkId(mlen, 3);
    checkId(messageData[0].val, 0xdead1111);
    checkStr(messageData[1].str, deviceCacheHeader);
    checkId(messageData[2].val, 1);
    typedef struct {
         int         val;
         std::map<int, std::string> cacheMap;
    } CacheType;
    std::map<std::string, CacheType> cache;
    std::string sectionIndex;
    do {
        mlen = readMessage();
        if (mlen == 2) {
            std::string name = messageData[0].str;
            int val = messageData[1].val;
            for (auto ch: name)
                if (islower(ch)) {
                    sectionIndex = name;
                    cache[sectionIndex].val = val;
                    goto next;
                }
            if (cache[sectionIndex].cacheMap.find(val) != cache[sectionIndex].cacheMap.end()) {
                printf("duplicate cache %s %x\n", name.c_str(), val);
                exit(-1);
            }
            else
                cache[sectionIndex].cacheMap[val] = name;
        }
next:;
    } while(mlen == 2);
    FILE *fcache;
    fcache = fopen("cacheData.h", "w");
    for (auto citem: cache)
    for (auto item: citem.second.cacheMap)
        fprintf(fcache, "    {\"%s_%03x\", \"%s\"},\n", citem.first.c_str(), item.first, item.second.c_str());
    fclose(fcache);
#if 0
    for (auto xitem: offsetMap) {
        for (auto yitem: xitem.second) {
            int x = xitem.first, y = yitem.first;
            printf("[%s:%d] JJJ x %2d y %2d %5x", __FUNCTION__, __LINE__, x, y, offsetMap[x][y]);
            if (offsetMap.find(x+1) != offsetMap.end()
              && offsetMap[x+1].find(y) != offsetMap[x+1].end())
                printf(" deltax %5x %d", offsetMap[x+1][y], offsetMap[x+1][y] - offsetMap[x][y]);
            else
                printf("                    ");
            if (offsetMap[x].find(y+1) != offsetMap[x].end())
                printf(" deltay %5x %d", offsetMap[x][y+1], offsetMap[x][y+1] - offsetMap[x][y]);
            printf("\n");
        }
    }
#endif
}

int readCMessage(void)
{
    int vari = readVarint(&bufp, true); // dont trace, since 'assert' will check value
    int tagVal = readMessage();
    if(ttrace || vari != tagVal)
        printf("[%s:%d] var %d mes %d\n", __FUNCTION__, __LINE__, vari, tagVal);
    assert(vari == tagVal);
    if (!vari)
        checkByte(0);
    return vari;
}

void readPairList()
{
    while (messageDataIndex == 2 || messageDataIndex == 3) {
        readCMessage();
        readMessage();
    }
}

void dumpXn()
{
    printf("Parse header\n");
    checkStr(std::string(bufp, bufp + strlen(xnHeader)), xnHeader);
    bufp += strlen(xnHeader);
    skipBuf(0x52);
    int tagVal = readMessage();
    printf("[%s:%d] stringCount %d\n", __FUNCTION__, __LINE__, tagVal);
//mtrace = 1;
    tagVal = readMessage();
    int listCount = messageData[0].val;
printf("[%s:%d] %d val %d\n", __FUNCTION__, __LINE__, tagVal, listCount);
    for (int i = 0; i < listCount - 1; i++) {
        readMessage();
//printf("[%s:%d] %d index %d\n", __FUNCTION__, __LINE__, tagVal, messageDataIndex);
        assert(messageDataIndex == 6);
        int tagVal = readCMessage();
        if (tagVal) {
            readCMessage();
            readCMessage();
        }
    }
uint8_t const *zstart = bufp;
mtrace = 1;
    tagVal = readMessage(); // 6
printf("[%s:%d] %d\n", __FUNCTION__, __LINE__, tagVal);
    tagVal = readMessage(); // 0
printf("[%s:%d] %d\n", __FUNCTION__, __LINE__, tagVal);
    tagVal = readCMessage();
printf("[%s:%d] %d\n", __FUNCTION__, __LINE__, tagVal);
    tagVal = readMessage(); // 0
printf("[%s:%d] %d\n", __FUNCTION__, __LINE__, tagVal);
    tagVal = readMessage();
printf("[%s:%d] %d\n", __FUNCTION__, __LINE__, tagVal);
    assert(tagVal == 5);
printf("[%s:%d] 27914 len %ld\n", __FUNCTION__, __LINE__, bufp - zstart);
mtrace =0;
    for (int i = 0; i < 7; i++) {
        tagVal = readMessage();
printf("[%s:%d] [%d] %d\n", __FUNCTION__, __LINE__, i, tagVal);
    }
    readMessage();
    readPairList();
printf("[%s:%d] index %d\n", __FUNCTION__, __LINE__, messageDataIndex);
    do {
        readMessage();
    } while (messageDataIndex == 5);
    do {
        readPairList();
        assert(messageDataIndex == 4);
//mtrace = 1;
//memdump(bufp, 16, "EE");
        readMessage();
//mtrace = 0;
    } while (messageDataIndex == 3);
printf("[%s:%d] index %d\n", __FUNCTION__, __LINE__, messageDataIndex);
memdump(bufp-32, 128, "TT");
    while (messageDataIndex == 2) {
        if (!*bufp)
            checkByte(0);
        else
            readTag();
        tagVal = readMessage();
        //printf(" nexxx %d", tagVal);
        if (tagVal == 4) {
            tagVal = readMessage();
            //printf(" WAS4 %d", tagVal);
        }
        //printf("\n");
    }
printf("[%s:%d] overindex %d\n", __FUNCTION__, __LINE__, messageDataIndex);
    while (1) {
       readPairList();
       if (messageDataIndex == 0xc)
           break;
       assert(messageDataIndex == 4);
       readMessage();
    }
printf("[%s:%d] %d\n", __FUNCTION__, __LINE__, tagVal);
    tagVal = readMessage(); // 9
printf("[%s:%d] %d\n", __FUNCTION__, __LINE__, tagVal);
    tagVal = readMessage(); // b
printf("[%s:%d] %d\n", __FUNCTION__, __LINE__, tagVal);
    tagVal = readMessage(); // c
printf("[%s:%d] %d\n", __FUNCTION__, __LINE__, tagVal);
    tagVal = readMessage(); // d
printf("[%s:%d] %d\n", __FUNCTION__, __LINE__, tagVal);
    tagVal = readMessage(); // 32.
printf("[%s:%d] %d\n", __FUNCTION__, __LINE__, tagVal);
    do {
        readPairList();
        //printf("[%s:%d] index %d\n", __FUNCTION__, __LINE__, messageDataIndex);
        do {
            readMessage();
        } while (messageDataIndex == 5);
    } while(messageDataIndex != 4);
    printf("[%s:%d] index %d\n", __FUNCTION__, __LINE__, messageDataIndex);
    do {
        readMessage();
        //printf("[%s:%d] %d ", __FUNCTION__, __LINE__, messageDataIndex);
        //memdump(bufp, 16, "");
    } while (messageDataIndex >= 4);
    memdump(bufp, 16, "OVER");
}

int main(int argc, char *argv[])
{
    const char *filename = "xx.xdef";
    int bflag, ch;

    stripPrefix = getenv("STRIP_PREFIX");
    bflag = 0;
    while ((ch = getopt(argc, argv, "bf:")) != -1) {
        switch (ch) {
        case 'b':
            bflag = 1;
            break;
        case 'f':
            filename = optarg;
            break;
        case '?':
        default:
            printf("dumpXdef <args>\n");
            exit(-1);
        }
    }
    argc -= optind;
    argv += optind;
printf("[%s:%d] argc %d\n", __FUNCTION__, __LINE__, argc);
    int fdin = open(filename, O_RDONLY);
    if (fdin < 0) {
        printf("[%s:%d] can't open input file\n", __FUNCTION__, __LINE__);
    }
    long inlen = read(fdin, inbuf, sizeof(inbuf));
    close(fdin);
printf("[%s:%d] inlen 0x%lx\n", __FUNCTION__, __LINE__, inlen);

    if (bflag)
        dumpXn();
    else
        dumpXdef();
    printf("[%s:%d] done, unread length %ld\n", __FUNCTION__, __LINE__, (bufp - inbuf) - inlen);
    return 0;
}
