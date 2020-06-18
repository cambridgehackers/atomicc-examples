/* Copyright (c) 2014 Quanta Research Cambridge, Inc
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
#include "sock_utils.h"
#include "PackIndication.h"
#include "PackRequest.h"
#include "GeneratedTypes.h"

#define QUIET_FILTER // if (count++ % 0x20 == 0)

static PackRequestProxy *echoRequestProxy = 0;
static sem_t sem_heard2;

int sequence;
int count;

static void call_say(int v, int seq)
{
    printf("[%s:%d] v %x, seq %x\n", __FUNCTION__, __LINE__, v, seq);
    echoRequestProxy->say(v, seq);
    //sem_wait(&sem_heard2);
}

class PackIndication : public PackIndicationWrapper
{
public:
    virtual void heard(uint32_t v, uint8_t writeCount, uint8_t readCount, uint8_t seqno) {
printf("[%s:%d] v %lx\n", __FUNCTION__, __LINE__, (long)v);
        QUIET_FILTER
	uint32_t next = v << 16 | (sequence & 0xffff);
        printf("heard an echo: %x W %2x R %2x in %8x send %8x seq %x\n", seqno, writeCount, readCount, v, next, sequence & 0xff);
        if (count++ < 1) {
	call_say(next, sequence);
        }
        sequence += 0x12;
        //sem_post(&sem_heard2);
printf("[%s:%d] after v %lx\n", __FUNCTION__, __LINE__, (long)v);
    }
    PackIndication(unsigned int id, PortalTransportFunctions *item, void *param) : PackIndicationWrapper(id, item, param) {}
};

int main(int argc, const char **argv)
{
    Portal *mcommon = new Portal(5, 0, sizeof(uint32_t), portal_mux_handler, NULL,
#ifdef SIMULATION
        &transportSocketInit,
#else
        &transportPortal,
#endif
        NULL, 0);
    PortalMuxParam param = {};
    param.pint = &mcommon->pint;
    PackIndication echoIndication(IfcNames_PackIndicationH2S, &transportMux, &param);
    echoRequestProxy = new PackRequestProxy(IfcNames_PackRequestS2H, &transportMux, &param);

    int v = 0xbeefaa55; //42;
    printf("Saying %d\n", v);
    call_say(v, 0x67);
#if 0
    printf("Saying %d\n", v);
    call_say(v*5, 0x75);
    printf("Saying %d\n", v);
    call_say(v*17, 0x84);
    printf("Saying %d\n", v);
    call_say(v*93, 0x93);
    printf("Saying %d\n", v);
#endif
    sem_wait(&sem_heard2);
    sem_wait(&sem_heard2);
    sem_wait(&sem_heard2);
sleep(2);
    return 0;
}
