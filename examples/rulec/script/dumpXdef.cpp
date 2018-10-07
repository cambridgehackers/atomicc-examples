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

#define BUFFER_SIZE 16384000
#define MAX_MESSAGE 40000
struct {
    int val;
    std::string str;
} messageData[MAX_MESSAGE];
int messageDataIndex;
uint8_t inbuf[BUFFER_SIZE];
const char header[] = "Xilinx_Design_Exchange_Format";
const char placerHeader[] = "Xilinx Placer Database, Copyright 2014 All rights reserved.";
const char deviceCacheHeader[] = "Xilinx Device Cache, Copyright 2014 All rights reserved.";
int ttrace = 0;
int trace = 0;
int mtrace = 0;
int messageLen;
std::string tagStringValue;
int tagLength;
int tagLine;
void traceString(std::string str);

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
        return -2;
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
memdump(start - 16, 128, "BUF16");
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
                bool allPrintable = true;
                uint8_t const *lstrp = (uint8_t const *)tagStringValue.c_str();
                for (auto ch : tagStringValue)
                    if (!isprint(ch))
                        allPrintable = false;
                if (allPrintable)
                    printf(" '%s'", lstrp);
                else {
                    int llen = tagStringValue.length();
                    memdump(lstrp, llen > 64 ? 64 : llen, "");
                }
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
void readNodeList(int count)
{
    int param = readInteger();
    if (trace)
        printf("[%s:%d] count  %d param %d\n", __FUNCTION__, __LINE__, count, param);
    for (int i = 0; i < count; i++) {
        int tile = readInteger();
        int sitePin = readInteger();
        int pinType = (sitePin >> 16) & 0xffff;
        sitePin &= 0xffff;
        int row = tile/deviceColumns;
        int column = tile % deviceColumns;
        if (trace)
            printf("[%s:%d] row %x column %x pin %x type %x\n", __FUNCTION__, __LINE__, row, column, sitePin, pinType);
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
        if (mtrace) {
            printf("%s", sep);
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

void dumpXdef(void)
{
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
printf("[%s:%d] mlen %d\n", __FUNCTION__, __LINE__, mlen);
memdump(bufp, 64, "PLACE");
//trace = 1;
    mlen = readMessage();
    mlen = readMessage();
    checkId(mlen, 3);
    checkId(messageData[0].val, 0xdead0000);
    printf("Parse QDesign\n");
    checkStr(messageData[1].str, placerHeader);
    mlen = readMessage();
    int designLen = messageData[0].val;
printf("[%s:%d] designLen %x offset %ld\n", __FUNCTION__, __LINE__, designLen, bufp - inbuf);
    for (int designIndex = 0; designIndex < designLen; designIndex++) {
        mlen = readMessage();
        checkId(messageData[0].val, 0xdead3333);
        checkId(mlen, 4); // site info
        mlen = readMessage();
        mlen = readMessage();
        mlen = readMessage();
        checkId(messageData[0].val, 0xdead4444); // details
        mlen = readMessage();
        int count44 = messageData[0].val;
        for (int kk = 0; kk < count44; kk++) {
            mlen = readMessage();
            mlen = readMessage();
            int count55 = messageData[0].val;
            mlen = readMessage();
            checkId(messageData[0].val, 0xdead5555);
            for (int mm = 0; mm < count55; mm++) {
                mlen = readMessage(); // reference
            }
            mlen = readMessage();
            checkId(messageData[0].val, 0xdead6666);
            mlen = readMessage();
            int count66 = messageData[0].val;
            for (int mm = 0; mm < count66; mm++) {
                mlen = readMessage();
                mlen = readMessage();
                int val = messageData[0].val;
                for (int mopt = 0; mopt < val; mopt++)
                    mlen = readMessage(); // pin info
            }
        }
        mlen = readMessage();
        mlen = readMessage();
        mlen = readMessage();
        checkId(messageData[0].val, 0xdead7777); // PIP
        mlen = readMessage();
        int count7777 = messageData[0].val;
        for (int mm = 0; mm < count7777; mm++) {
            mlen = readMessage();
        }
        mlen = readMessage();
        checkId(messageData[0].val, 0xdead8888); // net
        mlen = readMessage();
        int count8888 = messageData[0].val;
        for (int mm = 0; mm < count8888; mm++) {
            mlen = readMessage();
            mlen = readMessage();
            int inner88 = messageData[0].val;
            for (int rr = 0; rr < inner88; rr++) {
                mlen = readMessage();
            }
        }
        mlen = readMessage();
        checkId(messageData[0].val, 0xdead9999); // port
        mlen = readMessage();
        int count9999 = messageData[0].val;
        for (int mm = 0; mm < count9999; mm++) {
            mlen = readMessage();
        }
    }
    readMessage();
    checkId(messageData[0].val, 0xdeaddddd); // site instance
    readMessage();
    checkId(messageData[0].val, 0);
    readMessage();
#define STRING -2
printf("[%s:%d] '%s'\n", __FUNCTION__, __LINE__, tagStringValue.c_str());
    checkId(messageData[0].val, STRING);
    readMessage();
    checkId(messageData[0].val, 0xdeadeeee);
    readMessage();
    checkId(messageData[0].val, 0);
    readMessage();
printf("[%s:%d] '%s'\n", __FUNCTION__, __LINE__, tagStringValue.c_str());
    checkId(messageData[0].val, STRING);
    readMessage();
    checkId(messageData[0].val, 0xdeadcccc);
    readMessage();
    checkId(messageData[0].val, 1);

    printf("Parse design Q\n");
    checkId(readInteger(), 3); // routing version
    int groupCount = readInteger();
    for (int groupIndex = 0; groupIndex < groupCount; groupIndex++) {
        std::string gname = readString();
        int listCount = readInteger();
        //printf("[%s:%d] [%d] group %s\n", __FUNCTION__, __LINE__, groupIndex, gname.c_str());
        for (int listIndex = 0; listIndex < listCount; listIndex++) {
            std::string name = readString();
            //printf("[%s:%d] [%d:%d] %s\n", __FUNCTION__, __LINE__, groupIndex, listIndex, name.c_str());
        }
    }
    checkStr(readString(), "END_HEADER");
    int nameCount = readInteger();
    int vv2 = readInteger();
    int vv3 = readInteger();
    printf("Parse design2 %d, %d, %d\n", nameCount, vv2, vv3);
    int nameIndex = 0;
    while(nameIndex++ < nameCount + 1) {
       std::string temp = readString();
       int first = readInteger();
       int sec = readInteger();
       int third = readInteger();
       int fourth = readInteger();
       int count = readInteger();
int origc = count;
if (count == 0) count = third;
       readNodeList(count);
       if (count != origc || trace)
           printf("[%s:%d] [%d] count %d '%s' param %x, %x, %x, %x, origc %d\n", __FUNCTION__, __LINE__,
               nameIndex, count, temp.c_str(), first, sec, third, fourth, origc);
    }
    int netCount = readInteger();
    printf("Global nets %d\n", netCount);
    int netNumber = 0;
    while(netNumber < netCount) {
        std::string netName = readString();
        int val = readInteger();
        int val2 = readInteger();
        int nodeCount = readInteger();
        printf("[%s:%d] %s [%d] nodeCount %x %x, %x\n", __FUNCTION__, __LINE__, netName.c_str(), netNumber, nodeCount, val, val2);
        checkId(readInteger(), 0);
        int nodeIndex = 0;
        while(nodeIndex++ < nodeCount) {
            int count = readInteger();
            readNodeList(count);
        }
        netNumber++;
    }
    mlen = readMessage();
    checkId(messageData[0].val, 0xdeadaaaa);
    mlen = readMessage();
    int lval = messageData[0].val;
    printf("[%s:%d] lval %d\n", __FUNCTION__, __LINE__, lval);
    for (int lind = 0; lind < lval; lind++) {
        mlen = readMessage();
    };
    mlen = readMessage();
    checkId(messageData[0].val, 0xdeadbbbb);
    mlen = readMessage();
    int sval = messageData[0].val;
    printf("[%s:%d] sval %d\n", __FUNCTION__, __LINE__, sval);
    for (int sind = 0; sind < sval; sind++) {
        mlen = readMessage();
    };
mtrace = 1;
    printf("Parse device cache\n");
    mlen = readMessage();
    checkId(messageData[0].val, 0xdead1111);
    checkStr(messageData[1].str, deviceCacheHeader);
    int cval = 7698;
printf("[%s:%d] cval %d\n", __FUNCTION__, __LINE__, cval);
mtrace = 0;
    for (int cind = 0; cind < cval; cind++) {
//printf("[%s:%d] %d/%d\n", __FUNCTION__, __LINE__, cind, cval);
if (cind > cval - 5) mtrace = 1;
        mlen = readMessage();
    }
}

void readCMessage(void)
{
    int vari = readVarint();
    int tagVal = readMessage();
    if(ttrace || vari != tagVal)
        printf("[%s:%d] var %d mes %d\n", __FUNCTION__, __LINE__, vari, tagVal);
    assert(vari == tagVal);
}

void readCPair(void)
{
    int tagVal = readMessage();
    if (ttrace)
        printf("[%s:%d] %d ", __FUNCTION__, __LINE__, tagVal);
    readCMessage();
}

void readMlist(int prefix, int limit)
{
    for (int i = 0; i < prefix; i++) {
        readCPair();
        readCMessage();
        readCMessage();
    }
    for (int i = 0; i < limit; i++)
        for (int j = 0; j < 4; j++) { // 6, 0, 0, 0
            int tagVal = readMessage();
            if (ttrace)
                printf("%s: [%d:%d] %d\n", __FUNCTION__, i, j, tagVal);
        }
}

void readPairList(int len)
{
    for (int i = 0; i < len; i++)
        readCPair(); // 3, 1
    int tagVal = readMessage(); // 4
    if (tagVal != 4)
        printf("[%s:%d] %d\n", __FUNCTION__, __LINE__, tagVal);
    assert(tagVal == 4);
}

void readFive(int pairLen, int returnLen, int fiveLen)
{
    for (int i = 0; i < pairLen; i++)
        readCPair();
    int tagVal = readMessage(); // == 'returnLen'
//printf("[%s:%d] FIVETAG %d\n", __FUNCTION__, __LINE__, tagVal);
    for (int i = 0; i < fiveLen; i++) {
        tagVal = readMessage();
        assert(tagVal == 5);
    }
}

const char xnHeader[] = "XLNX:NTLP";
uint8_t nullstr[100];
void dumpXn()
{
//jca
    printf("Parse header\n");
    checkStr(std::string(bufp, bufp + strlen(xnHeader)), xnHeader);
    bufp += strlen(xnHeader);
#if 0
int count = 0, ncount = 10000000;
uint8_t *next = bufp + 0x100000;
int off1, off2;
trace = 1;
    while (memcmp(bufp, nullstr, sizeof(nullstr))) {
        if (bufp[0] == 0x86 //|| count >= ncount// || bufp >= next 
        || (bufp[0] & 0x7) == 0x4
        || (bufp[0] & 0x7) == 0x6
        || (bufp[0] & 0x7) == 0x7
           ) {
int off = bufp - inbuf;
printf("[%s:%d] count %d=0x%x ncount %d OFF %lx next %ld %p\n", __FUNCTION__, __LINE__, count, count, ncount, bufp - inbuf, bufp - next, next);
memdump(bufp - 16, 64, "BREAK");
if (bufp[0] == 0x1e
        //|| (bufp[0] & 0x7) == 0x4
   ) {
    bufp++;
    off1 = 1000000;
    off2 = 0;
}
else {
    off1 = readVarint();
    off2 = readVarint();
    printf("[%s:%d] off1 %x %p off2 %x %p sum %x\n", __FUNCTION__, __LINE__, off1, bufp + off1, off2, bufp + off2, off2 + off);
    //memdump(bufp + off1 - 16, 32, "OFF1");
    //memdump(bufp + off2 - 16, 32, "OFF2");
}
if (off2)
    next = bufp + off2;
else
    next = bufp + 0x100000;
ncount = off1;
count = 0;
        }
        else {
            count++;
            readTag();
        }
    }
return;
    exit(-1);
#endif
    skipBuf(0x52);
memdump(bufp, 32, "START");
    int tagVal = readMessage();
printf("[%s:%d] %d\n", __FUNCTION__, __LINE__, tagVal);
    printf("[%s:%d] count %d=0x%x\n", __FUNCTION__, __LINE__, messageDataIndex, messageDataIndex);
    //mtrace = 1;
    int vari = readVarint();
printf("[%s:%d] %d\n", __FUNCTION__, __LINE__, vari);
    vari = readVarint();
printf("[%s:%d] %d\n", __FUNCTION__, __LINE__, vari);
    vari = readVarint();
printf("[%s:%d] %d\n", __FUNCTION__, __LINE__, vari);
    readMlist(0, 1);
    readMlist(1, 2);
    readMlist(1, 5);
    readMlist(1, 4);
    readMlist(3, 1);
    readMlist(5, 1);
    readMlist(4, 13);
    tagVal = readMessage(); // 6
printf("[%s:%d] %d\n", __FUNCTION__, __LINE__, tagVal);
    readCPair();
    for (int i = 0; i < 9; i++) {
        tagVal = readMessage();
printf("[%s:%d] [%d] %d\n", __FUNCTION__, __LINE__, i, tagVal);
    }
    readFive(0, 63, 10);
    readPairList(34);
    readPairList(11);
    readPairList(15);
    readPairList(3);
    readPairList(4);
    readPairList(32);
    readPairList(4);
    readPairList(4);
    for (int i = 0; i < 5; i++)
        readPairList(1);
    for (int i = 0; i < 2; i++)
        readPairList(4);
    for (int j = 0; j < 2; j++) {
        for (int i = 0; i < 7; i++)
            readCPair(); // 2, 2
        for (int i = 0; i < 19 + j; i++) {
            tagVal = readMessage(); // 2
            tagVal = readMessage(); // 0
        }
        tagVal = readMessage(); // 4
    }
    readPairList(54);
    readPairList(6);
    readPairList(1);
    readPairList(1);
    readPairList(11);
    readPairList(32);
    for (int i = 0; i < 38; i++)
        readCPair(); // 3, 1
    tagVal = readMessage(); // c
printf("[%s:%d] %d\n", __FUNCTION__, __LINE__, tagVal);
    tagVal = readMessage(); // 9
printf("[%s:%d] %d\n", __FUNCTION__, __LINE__, tagVal);
    tagVal = readMessage(); // b
printf("[%s:%d] %d\n", __FUNCTION__, __LINE__, tagVal);
    tagVal = readMessage(); // c
printf("[%s:%d] %d\n", __FUNCTION__, __LINE__, tagVal);
    tagVal = readMessage(); // d
printf("[%s:%d] %d\n", __FUNCTION__, __LINE__, tagVal);
    readFive(0, 0x20, 38);
    readPairList(23);
    readPairList(3);
    readPairList(1);
    readPairList(3);
    readPairList(1);
    readPairList(8);
    readPairList(3);
    readPairList(1);
    readPairList(15);
    readPairList(3);
    readPairList(4);
    readFive(4, 0x22, 39);
    readPairList(28);
    readPairList(3);
    readPairList(1);
    readPairList(3);
    readPairList(1);
    readPairList(2);
    readPairList(10);
    readPairList(1);
    readPairList(15);
    readPairList(4);
    readFive(4, 0x22, 60);
    readPairList(27);
    readPairList(9);
    readPairList(1);
    readPairList(32);
    readPairList(5);
    readPairList(1);
    readPairList(2);
    readPairList(38);
    readPairList(1);
    readPairList(2);
    readFive(14, 0x21, 23);
    readPairList(21);
    readPairList(10);
    readPairList(1);
    readPairList(1);
    readPairList(5);
    readPairList(1);
    readPairList(1);
    readPairList(2);
    readPairList(1);
    readFive(6, 0x19, 45);
    readPairList(12);
    readPairList(38);
    readPairList(1);
    readPairList(2);
    tagVal = readMessage(); // 3
printf("[%s:%d] %d\n", __FUNCTION__, __LINE__, tagVal);
    tagVal = readMessage(); // 7
printf("[%s:%d] %d\n", __FUNCTION__, __LINE__, tagVal);
    for (int i = 0; i < 35; i++) {
        int vari = readVarint();
        int tagVal = readMessage();
        if (mtrace)
            printf("[%s:%d] [%d] vari %d tag %d\n", __FUNCTION__, __LINE__, i, vari, tagVal);
    }
    tagVal = readMessage(); // 4
    readFive(38, 0x15, 37);
    readPairList(9);
    readPairList(32);
    readPairList(1);
    readPairList(1);
    readFive(32, 0x11, 9);
    readPairList(5);
    readPairList(6);
    readPairList(1);
    readPairList(1);
    readFive(6, 0x1e, 75);
    readPairList(34);
    readPairList(1);
    readPairList(33);
    readPairList(1);
    readPairList(32);
    readPairList(15);
    readPairList(1);
    for (int i = 0; i < 1; i++)
        readCPair();
    tagVal = readMessage(); // d
printf("[%s:%d] %d\n", __FUNCTION__, __LINE__, tagVal);
    readFive(0, 0x1a, 160);
printf("[%s:%d]\n", __FUNCTION__, __LINE__);
    readPairList(86);
    readPairList(16);
    readPairList(1);
    readPairList(32);
    readPairList(32);
    readPairList(32);
    readPairList(16);
    readFive(4, 0x1b, 171);
    readPairList(17);
    readPairList(32);
    readPairList(1);
    readPairList(33);
    readPairList(1);
    readPairList(16);
    readPairList(16);
    readPairList(16);
    readPairList(16);
    readPairList(1);
    readPairList(32);
    for (int i = 0; i < 32; i++)
        readCPair();
    tagVal = readMessage(); // 1b
printf("[%s:%d] %d\n", __FUNCTION__, __LINE__, tagVal);
    tagVal = readMessage(); // 5
printf("[%s:%d] %d\n", __FUNCTION__, __LINE__, tagVal);
    readPairList(12);
    readPairList(32);
    readPairList(1);
    readPairList(33);
    readFive(1, 0x1f, 3);
    readPairList(56);
    readPairList(16);
    readPairList(1);
    readPairList(32);
    readPairList(1);
    readPairList(32);
    readPairList(1);
    readPairList(32);
    readPairList(4);
    readFive(1, 0x29, 92);
    readPairList(141);
    readPairList(6);
    readPairList(1);
    readPairList(1);
    readPairList(4);
    readPairList(4);
    readPairList(38);
    readPairList(1);
    readPairList(32);
    readPairList(6);
    readPairList(1);
    readPairList(11);
    readPairList(1);
    readPairList(32);
    readPairList(4);
    readPairList(3);
    readPairList(2);
    readPairList(3);
    readPairList(16);
    readPairList(32);
    readPairList(3);
    readPairList(6);
    readPairList(3);
    readPairList(3);
    readPairList(4);
    readPairList(32);
    readPairList(3);
    readPairList(3);
    readFive(4, 0x1f, 134);
    readPairList(167);
    readPairList(15);
    readPairList(3);
    readPairList(4);
    readPairList(32);
    readPairList(4);
    readPairList(4);
    readPairList(54);
    readPairList(6);
    readPairList(6);
    readPairList(4);
    readPairList(5);
    readPairList(6);
    readPairList(4);
    readPairList(32);
    readPairList(6);
    readPairList(32);
    for (int i = 0; i < 6; i++)
        readCPair();
    printf("[%s:%d]\n", __FUNCTION__, __LINE__);
    tagVal = readMessage();
    tagVal = readMessage();
    do {
        tagVal = readMessage();
        //if (mtrace)
            //printf("[%s:%d] %d\n", __FUNCTION__, __LINE__, tagVal);
    } while (tagVal >= 4);
    memdump(bufp, 16, "OVER");
}

int main(int argc, char *argv[])
{
    const char *filename = "xx.xdef";
    int bflag, ch;

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