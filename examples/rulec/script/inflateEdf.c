
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
const char *header = "XlxV37EB    fa00    ";
const char *eeader = "XlxV37EB    734d    ";
const char *feader = "XlxV37EB    7abd    ";
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
        if (!memcmp(header, strm.next_in, strlen(header))) {
            printf("[%s:%d]found header\n", __FUNCTION__, __LINE__);
            strm.avail_in -= 24;
            strm.next_in += 24;
        }
        else if (!memcmp(eeader, strm.next_in, strlen(eeader))) {
            printf("[%s:%d]found eeader\n", __FUNCTION__, __LINE__);
            strm.avail_in -= 24;
            strm.next_in += 24;
        }
        else if (!memcmp(feader, strm.next_in, strlen(feader))) {
            printf("[%s:%d]found feader\n", __FUNCTION__, __LINE__);
            strm.avail_in -= 24;
            strm.next_in += 24;
        }
        long before = strm.avail_in;
        rc = inflateInit(&strm);
        if (rc != Z_OK) {
            printf("[%s:%d] error %d\n", __FUNCTION__, __LINE__, rc);
            return -1;
        }
        rc = inflate(&strm, Z_FINISH); //Z_NO_FLUSH);
        before -= strm.avail_in;
        memdump(strm.next_in, 32, "after");
        printf("[%s:%d] return %d END %d availin %d availout %d processed %ld./0x%lx\n", __FUNCTION__, __LINE__, rc, Z_STREAM_END, strm.avail_in, strm.avail_out, before, before);
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
