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
uint8_t inbuf[BUFFER_SIZE];
const char header[] = "Xilinx_Design_Exchange_Format";
const char placerHeader[] = "Xilinx Placer Database, Copyright 2014 All rights reserved.";
const char deviceCacheHeader[] = "Xilinx Device Cache, Copyright 2014 All rights reserved.";
int trace = 0;
int mtrace = 0;
int readMessage();
void memdump(unsigned char *p, int len, const char *title)
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

uint8_t *bufp = inbuf;

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

uint32_t read32()
{
uint32_t ret = 0;
   memcpy(&ret, bufp, 4);
if (trace)
printf("[%s:%d] word %x\n", __FUNCTION__, __LINE__, ret);
   bufp += 4;
   return ret;
}
uint64_t read64()
{
uint64_t ret = 0;
   memcpy(&ret, bufp, 8);
   bufp += 8;
   return ret;
}
int readInteger()
{
    int ret = 0;
    if (*bufp == ' ')
        bufp++;
    uint8_t *start = bufp;
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
long readVarint()
{
    uint8_t *start = bufp;
    while (*bufp & 0x80)
        bufp++;
    uint8_t *p = bufp++;
    long ret = 0;
    while (p >= start)
        ret = ret << 7 | (*p-- & 0x7f);
    return ret;
}

std::string tagStringValue;
int readTag()
{
    tagStringValue = "";
    long ch = readVarint();
    int line = ch & 0x7;
    int tag = ch >> 3;
    //printf("[%s:%d] buf %x line %x tag %d=0x%x\n", __FUNCTION__, __LINE__, ch, line, tag, tag);
    switch (line) {
    case 0: { // varint
        long ret = readVarint();
        if (trace)
            printf("[%s:%d] tag %d varint %lx\n", __FUNCTION__, __LINE__, tag, ret);
        return ret;
        }
    case 1: {// 64 bit
        long ret = read64();
        if (trace)
            printf("[%s:%d] tag %d 64bit %lx\n", __FUNCTION__, __LINE__, tag, ret);
        return ret;
        }
    case 2: { // length delim
        long len = readVarint();
        tagStringValue = std::string(bufp, bufp + len);
        if (trace) {
            printf("[%s:%d] tag %d delim %s", __FUNCTION__, __LINE__, tag, tagStringValue.c_str());
            memdump(bufp, len, "");
        }
        bufp += len;
        break;
        }
    case 5: { // 32 bit
        long ret = read32();
        if (trace)
            printf("[%s:%d] tag %d 32bit %lx\n", __FUNCTION__, __LINE__, tag, ret);
        return ret;
        }
    default:
        //if (trace)
            printf("[%s:%d] ERRORTAG: line %d tag 0x%x\n", __FUNCTION__, __LINE__, line, tag);
        //exit(-1);
    }
    return 0;
}

int deviceColumns = 0x1000000;
void readNodeList(int count)
{
    int param = readInteger();
    //printf("[%s:%d] count  %d param %d\n", __FUNCTION__, __LINE__, count, param);
    for (int i = 0; i < count; i++) {
        int tile = readInteger();
        int sitePin = readInteger();
        int pinType = (sitePin >> 16) & 0xffff;
        sitePin &= 0xffff;
        int row = tile/deviceColumns;
        int column = tile % deviceColumns;
        //printf("[%s:%d] row %x column %x pin %x type %x\n", __FUNCTION__, __LINE__, row, column, sitePin, pinType);
    }
}

#define MAX_MESSAGE 200
struct {
    int val;
    std::string str;
} messageData[MAX_MESSAGE];
int messageDataIndex;

int readMessage()
{
    messageDataIndex = 0;
    int messageLen = *bufp++;
    const char *sep = "";
    uint8_t *endp = bufp + messageLen;
    if (mtrace)
        printf("message: ");
    while (bufp < endp) {
        int val = readTag();
        messageData[messageDataIndex].val = val;
        messageData[messageDataIndex].str = tagStringValue;
        if (mtrace)
            printf("%s%x%s", sep, val, tagStringValue != "" ? (" '" + tagStringValue + "'").c_str() : "");
        messageDataIndex++;
        sep = ", ";
    }
    if (mtrace)
        printf("\n");
    assert(bufp == endp);
    return messageDataIndex;
}

int main(int argc, char *argv[])
{
    static uint8_t tag11[] = {0x11, 0x11, 0xad, 0xde};
    static uint8_t tag33[] = {0x33, 0x33, 0xad, 0xde};
    printf("[%s:%d] start\n", __FUNCTION__, __LINE__);
    int fdin = open("xx.xdef", O_RDONLY);
    if (fdin < 0) {
        printf("[%s:%d] can't open input file\n", __FUNCTION__, __LINE__);
    }
    long inlen = read(fdin, inbuf, sizeof(inbuf));
    close(fdin);
    printf("Parse header, total length %ld\n", inlen);
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
printf("[%s:%d] device '%s' package '%s' limit %d str1 '%s': %x %x\n", __FUNCTION__, __LINE__, device.c_str(), package.c_str(), nLimit, str1.c_str(), head6, head7);
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
    checkId(messageData[0].val, 0);
    readMessage();
    checkId(messageData[0].val, 0xdeadeeee);
    readMessage();
    checkId(messageData[0].val, 0);
    readMessage();
    checkId(messageData[0].val, 0);
    readMessage();
    checkId(messageData[0].val, 0xdeadcccc);
    readMessage();
    checkId(messageData[0].val, 1);

    printf("Parse design Q\n");
    checkId(readInteger(), 3); // routing version
    int desIndex = 0;
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
       uint8_t *start = bufp;
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
loop2over:
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
    printf("[%s:%d] done, unread length %ld\n", __FUNCTION__, __LINE__, bufp - inbuf - inlen);
    return 0;
}
