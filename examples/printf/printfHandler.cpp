/*
   Copyright (C) 2018, The Connectal Project

    This program is free software; you can redistribute it and/or modify
    it under the terms of version 2 of the GNU General Public License as
    published by the Free Software Foundation.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/
#include <stdio.h>
#include <assert.h>
#include "portal.h"
#include "readElfSection.h"
#define MAX_READ_LINE 1024

#ifndef ANDROID
#include <string>
#include <list>
#include <map>
typedef struct {
    char *format;
    std::list<int> width;
} PrintfInfo;
std::map<int, PrintfInfo> printfFormat;
#endif

static void memdump(unsigned char *p, int len, const char *title)
{
int i;

    i = 0;
    while (len > 0) {
        if (!(i & 0xf)) {
            if (i > 0)
                fprintf(stderr, "\n");
            fprintf(stderr, "%s: ",title);
        }
        fprintf(stderr, "%02x ", *p++);
        i++;
        len--;
    }
    fprintf(stderr, "\n");
}

static void atomiccPrintfHandler(struct PortalInternal *p, unsigned int header)
{
    int len = header & 0xffff;
    int tmpfd;
    p->transport->recv(p, &p->map_base[1], len - 1, &tmpfd);
    unsigned short *data = ((unsigned short *)p->map_base) + 2;
    int printfNumber = *data++;
    assert(printfNumber >= 0);
    char format[MAX_READ_LINE];
    sprintf(format, "RUNTIME: %s",
#ifdef ANDROID
"ZZZ"
#else
 printfFormat[printfNumber].format
#endif
        );
    printf("[%s:%d] len %x header %x format %d = '%s'\n", __FUNCTION__, __LINE__, len, header, printfNumber, format);
memdump((unsigned char *)p->map_base, len * sizeof(p->map_base[0]), "PRINTIND");
#ifndef ANDROID
    int params[100], *pparam = params, *pdata = (int *)data;
    for (auto item: printfFormat[printfNumber].width) {
        (void) item;
        (void) memdump;
        memcpy(pparam, pdata, sizeof(*pparam));
        pparam++;
        pdata++;
    }
    printf(format, params[0], params[1], params[2], params[3],
        params[4], params[5], params[6]);
#endif
}

#ifdef ANDROID
extern "C"
#endif
char *getExecutionFilename(char *buf, int buflen);
void atomiccPrintfInit(const char *filename)
{
    connectalPrintfHandler = atomiccPrintfHandler;
    char buf[MAX_READ_LINE];
    char *bufp;
    uint8_t *currentp, *bufend;
    int lineNumber = 0;
    int printfNumber = 1;
    unsigned long buflen = 0;
    char fbuffer[MAX_READ_LINE];
    char *fname = getExecutionFilename(fbuffer, sizeof(fbuffer)-1);
printf("[%s:%d] %s fn %s\n", __FUNCTION__, __LINE__, filename, fname);
    if (readElfSection(fname, "printfdata", &currentp, &buflen)) {
        printf("atomiccPrintfInit: unable to open '%s'\n", fname);
        exit(-1);
    }
    bufend = currentp + buflen;
    while (1) {
        bufp = buf;
        do {
            while (*currentp && *currentp != '\n' && currentp < bufend)
                *bufp++ = *currentp++;
            *bufp = 0;
            currentp++;
printf("[%s:%d] read '%s'\n", __FUNCTION__, __LINE__, buf);
        } while (currentp < bufend && !buf[0]);
        bufp = buf;
        lineNumber++;
        if (currentp >= bufend)
            break;
        if (*bufp++ != '"') {
            printf("[%s:%d] formaterror '%s' current %p end %p\n", __FUNCTION__, __LINE__, buf, currentp, bufend);
            exit(-1);
        }
        while (*bufp && *bufp != '"') {
            bufp++;
            if (*bufp == '\\')
                bufp += 2;
        }
        if (*bufp != '"') {
            printf("[%s:%d] formaterror '%s'\n", __FUNCTION__, __LINE__, buf);
            exit(-1);
        }
        *bufp++ = 0;
#ifndef ANDROID
        char *format = &buf[1];
        printfFormat[printfNumber] = PrintfInfo{strdup(format)};
        while (*bufp) {
            while (*bufp == ' ')
                bufp++;
            if (isdigit(*bufp))
                printfFormat[printfNumber].width.push_back(atoi(bufp));
            while(isdigit(*bufp))
                bufp++;
        }
        printf("[%s:%d] format %d = '%s'", __FUNCTION__, __LINE__, printfNumber, printfFormat[printfNumber].format);
        for (auto item: printfFormat[printfNumber].width)
             printf(" width=%d", item);
#endif
        printf("\n");
        printfNumber++;
    }
}
