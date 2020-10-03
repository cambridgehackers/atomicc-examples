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
#include "BtestIndication.h"
#include "BtestRequest.h"

static sem_t sem_heard2;
static BtestRequestProxy *echoRequestProxy;
static uint32_t userData;

class BtestIndication : public BtestIndicationWrapper
{
public:
    virtual void heard(uint32_t v) {
        printf("heard an echo: %8x\n", v);
        userData = v;
        sem_post(&sem_heard2);
    }
    BtestIndication(unsigned int id, PortalTransportFunctions *item, void *param) : BtestIndicationWrapper(id, item, param) {}
};

uint32_t readData(uint32_t addr)
{
    echoRequestProxy->read(addr);
    sem_wait(&sem_heard2);
    return userData;
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
    BtestIndication echoIndication(IfcNames_BtestIndicationH2S, &transportMux, &param);
    echoRequestProxy = new BtestRequestProxy(IfcNames_BtestRequestS2H, &transportMux, &param);

    for (int i = 0; i < 1024; i++)
        echoRequestProxy->write(i, i*3);
printf("[%s:%d]now read\n", __FUNCTION__, __LINE__);
    for (int i = 0; i < 1024; i++) {
         uint32_t data = readData(i);
printf("[%s:%d] data %d\n", __FUNCTION__, __LINE__, data);
    }
    printf("Now, wait\n");
    sleep(3);
    return 0;
}
