/* Copyright (c) 2019 The Connectal Project
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
#include <stdio.h>
#include "sock_utils.h"
#include <semaphore.h>
uint64_t waitReturn(int method, int size);
#include "GrayCounterIfc_IC_width_ND_4_JC_.h"
void atomiccPrintfInit(const char *filename);

static sem_t *waitSemaphore;
static uint64_t waitResult;
static int waitMethod, waitSize;
int EchoIndication_handleMessage(struct PortalInternal *p, unsigned int channel, int messageFd)
{
    volatile unsigned int* temp_working_addr = &p->map_base[1];
    uint16_t *datap = (uint16_t *)temp_working_addr;
    int messageSize = *datap++;
    if (channel != waitMethod || waitSize != messageSize)
         printf("[%s:%d] p %p channel %d/%d messFd %d waitSize %d messageSize %d ", __FUNCTION__, __LINE__, p, channel, waitMethod, messageFd, waitSize, messageSize);
    memcpy((void *)&waitResult, (void *)datap, sizeof(waitResult));
    sem_post(waitSemaphore);
    return 0;
}
uint64_t waitReturn(int method, int size)
{
    waitMethod = method;
    waitSize = size;
    sem_wait(waitSemaphore);
    return waitResult;
}

int main(int argc, const char **argv)
{
    //atomiccPrintfInit("generated/rulec.generated.printf");
    if ((waitSemaphore = sem_open("/semaphore", O_CREAT, 0644, 0)) == SEM_FAILED) {
        perror("sem_open failed");
        exit(-1);
    }
    Portal *mcommon = new Portal(5, 0, sizeof(uint32_t), portal_mux_handler, NULL,
        &transportSocketInit,
        NULL, 0);
    PortalMuxParam param = {};
    param.pint = &mcommon->pint;
    GrayCounterIfc_IC_width_ND_4_JC_Proxy *request = new GrayCounterIfc_IC_width_ND_4_JC_Proxy(IfcNames_GrayCounterIfc_IC_width_ND_4_JC_S2H, &transportMux, &param);
    request->pint.handler = EchoIndication_handleMessage;
    request->writeGray(4);
    request->writeBin(3);
    request->decrement();
    for (int i = 0; i < 18; i++) {
        request->increment();
        int ret = request->readGray();
printf("[%s:%d]readGray %d\n", __FUNCTION__, __LINE__, ret);
        ret = request->readBin();
printf("[%s:%d]readBin %d\n", __FUNCTION__, __LINE__, ret);
    }
sleep(2);
    return 0;
}
