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
#include <errno.h>
#include <sys/ioctl.h>      // FIONBIO

#include <XsimTop.h>
#include "sock_utils.h"

#define MAX_REQUEST_LENGTH 1000
void memdump(unsigned char *p, int len, const char *title);

static int trace_xsimtop = 1;
static int masterfpga_fd = -1, clientfd = -1, masterfpga_number = 5;
static unsigned int mastermap_base[MAX_REQUEST_LENGTH];
static uint32_t txBuffer[1000];
static int txBufIndex;

static int finish = 0;
long cycleCount;

extern "C" int dpi_cycle()
{
  cycleCount++;
  return finish;
}

double sc_time_stamp()
{
  return (double)cycleCount;
}

extern "C" void dpi_init()
{
    char buff[100];
    sprintf(buff, "SWSOCK%d", masterfpga_number);
    masterfpga_fd = init_listening(buff, NULL);
    int on = 1;
    ioctl(masterfpga_fd, FIONBIO, &on);
    if (trace_xsimtop) fprintf(stdout, "%s: end\n", __FUNCTION__);
}

extern "C" long long dpi_msgSink_beat(int portal)
{
  long long result = 0xbadad7a;
  {
      if (clientfd != -1) {
         int event_socket_fd;
         int len = portalRecvFd(clientfd, (void *)mastermap_base, sizeof(uint32_t), &event_socket_fd);
         if (len == 0) { /* EOF */
             printf("XsimMsgRequestWrapper.disconnect called %d\n", clientfd);
             close(clientfd);
             clientfd = -1;
             exit(-1);
         }
         else if (len == -1) {
             if (errno != EAGAIN) {
                 printf( "%s[%d]: read error %d\n",__FUNCTION__, clientfd, errno);
                 exit(1);
             }
         }
         else if (len == sizeof(uint32_t)) {
             int len = mastermap_base[0] & 0xffff;
             int rc = portalRecvFd(clientfd, (void *)&mastermap_base[1], (len-1) * sizeof(uint32_t), &event_socket_fd);
             if (rc > 0) {
                 char bname[100];
                 sprintf(bname,"RECV%d.%d", getpid(), clientfd);
                 memdump((uint8_t*)mastermap_base, len * sizeof(uint32_t), bname);
                 const uint32_t *pdata = (uint32_t *)mastermap_base;
                 uint32_t beat = pdata[1];
                 printf("XsimRX: portal %d beat=%08x pdata %x\n", portal, beat, pdata[0]);
                 result = (1ll << 32) | beat;
             }
         }
      }
      else if (masterfpga_fd != -1) {
          int sockfd = accept_socket(masterfpga_fd);
          if (sockfd != -1) {
              printf("[%s:%d]afteracc accfd %d fd %d\n", __FUNCTION__, __LINE__, masterfpga_fd, sockfd);
              clientfd = sockfd;
          }
      }
  }
  return result;
}

extern "C" void dpi_msgSource_beat(int portal, int beat)
{
    //if (trace_xsimtop)
        //fprintf(stdout, "dpi_msgSource_beat: portal %d beat=%08x\n", portal, beat);
printf("[%s:%d] index %x txBuffer[0] %x beat %x\n", __FUNCTION__, __LINE__, txBufIndex, txBuffer[0], beat);
    txBuffer[txBufIndex++] = beat;
    if (txBufIndex == (txBuffer[0] & 0xffff)) {
        char bname[100];
        sprintf(bname,"SEND%d.%d", getpid(), masterfpga_fd);
        memdump((uint8_t*)txBuffer, (txBuffer[0] & 0xffff) * sizeof(uint32_t), bname);
        portalSendFd(clientfd, (void *)txBuffer, (txBuffer[0] & 0xffff) * sizeof(uint32_t), -1);
        txBufIndex = 0;
    }
}
