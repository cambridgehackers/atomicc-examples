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
#include <stdio.h>
#include "sock_utils.h"
#include "OinIndication.h"
#include "OinRequest.h"
#include "GeneratedTypes.h"

static OinRequestProxy *echoRequestProxy = 0;
static sem_t sem_heard2;

int sequence;
int count;

static void call_say(int v)
{
    printf("[%s:%d] v %x\n", __FUNCTION__, __LINE__, v);
    echoRequestProxy->say(v);
    sem_wait(&sem_heard2);
}

class OinIndication : public OinIndicationWrapper
{
public:
    virtual void heard(uint32_t v) {
        printf("heard an echo: %x\n", v);
        sem_post(&sem_heard2);
    }
    OinIndication(unsigned int id, PortalTransportFunctions *item, void *param) : OinIndicationWrapper(id, item, param) {}
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
    OinIndication echoIndication(IfcNames_OinIndicationH2S, &transportMux, &param);
    echoRequestProxy = new OinRequestProxy(IfcNames_OinRequestS2H, &transportMux, &param);

    int v = 0xbeefaa55; //42;
    for (int i = 0; i < 20; i++) {
        call_say(v);
        v += 0x04030201;
    }
    return 0;
}
