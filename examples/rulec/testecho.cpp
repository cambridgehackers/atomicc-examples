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

#include <errno.h>
#include <stdio.h>
#include "sock_utils.h"
#include "EchoIndication.h"
#include "EchoRequest.h"
#include "GeneratedTypes.h"
void atomiccPrintfInit(const char *filename);

static EchoRequestProxy *echoRequestProxy = 0;
static sem_t sem_heard2;
static int limitSay2 = 5;

class EchoIndication : public EchoIndicationWrapper
{
public:
    virtual void heard(uint32_t v) {
        printf("heard an echo: %d\n", v);
        if (limitSay2-- > 0)
	echoRequestProxy->say2(v, 2*v);
    }
    virtual void heard2(uint16_t a, uint16_t b) {
        sem_post(&sem_heard2);
        printf("heard an echo2: %d %d\n", a, b);
    }
    virtual void heard3(uint16_t a, uint32_t b, uint32_t c, uint16_t d) {
        printf("heard an echo3: %d %d\n", a, b);
    }
    EchoIndication(unsigned int id, PortalTransportFunctions *item, void *param) : EchoIndicationWrapper(id, item, param) {}
};

static void call_say(int v)
{
    printf("[%s:%d] %d\n", __FUNCTION__, __LINE__, v);
    echoRequestProxy->say(v);
    sem_wait(&sem_heard2);
}

static void call_say2(int v, int v2)
{
    printf("[%s:%d] %d\n", __FUNCTION__, __LINE__, v);
    echoRequestProxy->say2(v, v2);
    sem_wait(&sem_heard2);
}

int main(int argc, const char **argv)
{
    long actualFrequency = 0;
    long requestedFrequency = 1e9 / MainClockPeriod;

    //atomiccPrintfInit("generated/rulec.generated.printf");
#if 0
    EchoIndication echoIndication(IfcNames_EchoIndicationH2S, NULL, NULL);
    echoRequestProxy = new EchoRequestProxy(IfcNames_EchoRequestS2H);
#elif 1
    Portal *mcommon = new Portal(5, 0, sizeof(uint32_t), portal_mux_handler, NULL, &transportSocketInit, NULL, 0);
    PortalMuxParam param = {};
    param.pint = &mcommon->pint;
    EchoIndication echoIndication(IfcNames_EchoIndicationH2S, &transportMux, &param);
    echoRequestProxy = new EchoRequestProxy(IfcNames_EchoRequestS2H, &transportMux, &param);
#else
    PortalSocketParam paramSocket = {};
    EchoIndication echoIndication(IfcNames_EchoIndicationH2S, &transportSocketInit, &paramSocket);
    echoRequestProxy = new EchoRequestProxy(IfcNames_EchoRequestS2H, &transportReuse, &echoIndication.pint);
#endif

    int status = setClockFrequency(0, requestedFrequency, &actualFrequency);
    fprintf(stderr, "Requested main clock frequency %5.2f, actual clock frequency %5.2f MHz status=%d errno=%d\n",
	    (double)requestedFrequency * 1.0e-6,
	    (double)actualFrequency * 1.0e-6,
	    status, (status != 0) ? errno : 0);

    int v = 42;
    printf("Saying %d\n", v);
    call_say(v);
    call_say(v*5);
    call_say(v*17);
    call_say(v*93);
    call_say2(v, v*3);
    printf("TEST TYPE: SEM\n");
    echoRequestProxy->setLeds(9);
sleep(2);
    return 0;
}
