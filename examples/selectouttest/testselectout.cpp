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
#include "SelectOutIndication.h"
#include "SelectOutRequest.h"
#include "GeneratedTypes.h"
void atomiccPrintfInit(const char *filename);

#define TEST_LENGTH 20
static SelectOutRequestProxy *echoRequestProxy = 0;
static sem_t sem_heard2;
int counter;

class SelectOutIndication : public SelectOutIndicationWrapper
{
public:
    virtual void heard(uint8_t rindex, uint32_t v) {
        printf("heard an echo: index %d val %d\n", rindex, v);
        sem_post(&sem_heard2);
    }
    SelectOutIndication(unsigned int id, PortalTransportFunctions *item, void *param) : SelectOutIndicationWrapper(id, item, param) {}
};

static void call_say(int v)
{
    printf("[%s:%d] %d: %d\n", __FUNCTION__, __LINE__, counter++, v);
    echoRequestProxy->say(v);
    sem_wait(&sem_heard2);
}

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
    SelectOutIndication echoIndication(IfcNames_SelectOutIndicationH2S, &transportMux, &param);
    echoRequestProxy = new SelectOutRequestProxy(IfcNames_SelectOutRequestS2H, &transportMux, &param);

    int v = 42;
    printf("Saying %d\n", v);
    call_say(v);
#if 1
    call_say(v*5);
    call_say(v*17);
printf("[%s:%d] third\n", __FUNCTION__, __LINE__);
    call_say(v*93);
printf("[%s:%d] fourth\n", __FUNCTION__, __LINE__);
    for (int i = 0; i < TEST_LENGTH; i++)
        call_say(v*93 + i);
printf("[%s:%d]testover, now SLEEEEEEEEEEEEEEEEEEEP\n", __FUNCTION__, __LINE__);
//sleep(2);
#endif
    return 0;
}
