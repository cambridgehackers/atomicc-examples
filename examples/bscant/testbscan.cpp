/* Copyright (c) 2020 The Connectal Project
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
#include "BtestIndication.h"
#include "BtestRequest.h"
#include "GeneratedTypes.h"
void atomiccPrintfInit(const char *filename);

#define QUIET_FILTER //if (count % 1000 == 0)

static BtestRequestProxy *echoRequestProxy = 0;
static sem_t sem_heard2;

int sequence;
int count;

uint32_t nextData;

static void sendNext(void)
{
    nextData += 0x01010201;
    echoRequestProxy->say(nextData);
}

class BtestIndication : public BtestIndicationWrapper
{
public:
    virtual void heard(uint32_t v) {
        count++;
        QUIET_FILTER
        printf("heard an echo: %8d in %8x send %8x\n", count, v, nextData);
        sendNext();
    }
    BtestIndication(unsigned int id, PortalTransportFunctions *item, void *param) : BtestIndicationWrapper(id, item, param) {}
};

int main(int argc, const char **argv)
{
    long actualFrequency = 0;
    long requestedFrequency = 1e9 / MainClockPeriod;

    //atomiccPrintfInit("generated/rulec.generated.printf");
#if 0
    BtestIndication echoIndication(IfcNames_BtestIndicationH2S, NULL, NULL);
    echoRequestProxy = new BtestRequestProxy(IfcNames_BtestRequestS2H);
#elif 1
    Portal *mcommon = new Portal(5, 0, sizeof(uint32_t), portal_mux_handler, NULL,
#ifdef SIMULATION
        &transportSocketInit,
#else
        &transportPortal,
#endif
        NULL, 0);
    PortalMuxParam param = {};
    param.pint = &mcommon->pint;
    BtestIndication echoIndication(IfcNames_BtestIndicationH2S, &transportMux, &param);
    echoRequestProxy = new BtestRequestProxy(IfcNames_BtestRequestS2H, &transportMux, &param);
#else
    PortalSocketParam paramSocket = {};
    BtestIndication echoIndication(IfcNames_BtestIndicationH2S, &transportSocketInit, &paramSocket);
    echoRequestProxy = new BtestRequestProxy(IfcNames_BtestRequestS2H, &transportReuse, &echoIndication.pint);
#endif

    int status = setClockFrequency(0, requestedFrequency, &actualFrequency);
    fprintf(stderr, "Requested main clock frequency %5.2f, actual clock frequency %5.2f MHz status=%d errno=%d\n",
	    (double)requestedFrequency * 1.0e-6,
	    (double)actualFrequency * 1.0e-6,
	    status, (status != 0) ? errno : 0);
    sendNext();
    printf("Now, wait\n");
    sem_wait(&sem_heard2);
    sem_wait(&sem_heard2);
    return 0;
}
