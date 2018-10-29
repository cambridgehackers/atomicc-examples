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
#include <string.h>
#include <assert.h>
#include "zlib.h"
#include <sys/types.h>
#include <sys/uio.h>
#include <unistd.h>
#include <fcntl.h>

#define BUFFER_SIZE 16384000
uint8_t inbuf[BUFFER_SIZE], outbuf[BUFFER_SIZE];
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

int main(int argc, char *argv[])
{
    printf("[%s:%d] start\n", __FUNCTION__, __LINE__);
    int fdin = open("xx.input", O_RDONLY);
    if (fdin < 0) {
        printf("[%s:%d] can't open input file\n", __FUNCTION__, __LINE__);
    }
    long inlen = read(fdin, inbuf, sizeof(inbuf));
    close(fdin);
    int rc;
    z_stream strm;
    strm.zalloc = Z_NULL;
    strm.zfree = Z_NULL;
    strm.opaque = Z_NULL;
    strm.avail_in = 0;
    strm.next_in = Z_NULL;
    strm.avail_in = inlen;
    strm.next_in = inbuf;
    strm.avail_out = sizeof(outbuf);
    strm.next_out = outbuf;
    while(strm.avail_in > 0) {
        memdump(strm.next_in, 32, "before");
        Bytef *buf = strm.next_in;
        if (buf[0] == 'X' && buf[1] == 'l' && buf[2] == (buf[0] | 0x20) && buf[3] == 'V') {
            printf("[%s:%d]found header\n", __FUNCTION__, __LINE__);
            strm.avail_in -= 24;
            strm.next_in += 24;
        memdump(strm.next_in, 32, "before1");
        }
        long before = strm.avail_in;
        rc = inflateInit(&strm);
        if (rc != Z_OK) {
            printf("[%s:%d] error %d\n", __FUNCTION__, __LINE__, rc);
            return -1;
        }
        rc = inflate(&strm, Z_FINISH);
        before -= strm.avail_in;
        memdump(strm.next_in, 32, "after");
        printf("[%s:%d] return %d END %d availin %d availout %d processed %ld./0x%lx offset %lx\n", __FUNCTION__, __LINE__, rc, Z_STREAM_END, strm.avail_in, strm.avail_out, before, before, inlen - strm.avail_in);
if (rc != Z_STREAM_END) {
memdump(strm.next_in, strm.avail_in < 128 ? strm.avail_in : 128, "resid");
}
        assert(rc == Z_STREAM_END);
        (void)inflateEnd(&strm);
    }
    long olen = sizeof(outbuf) - strm.avail_out;
    if (olen > 0) {
        int fdout = creat("xx.output", 0666);
        write(fdout, outbuf, olen);
        close(fdout);
    }
    printf("[%s:%d] end in %ld out %ld\n", __FUNCTION__, __LINE__, inlen, olen);
    return 0;
}
