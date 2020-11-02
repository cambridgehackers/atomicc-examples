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
//#include <stdio.h>
//#include "sock_utils.h"
#include "LpmIndication.h"
#include "LpmRequest.h"
//#include "GeneratedTypes.h"

static LpmRequestProxy *lpmRequestProxy = 0;
static sem_t sem_enter;

class LpmIndication : public LpmIndicationWrapper
{
public:
    virtual void out(uint32_t v) {
        printf("heard an lpm: %d\n", v);
        sem_post(&sem_enter);
    }
    LpmIndication(unsigned int id, PortalTransportFunctions *item, void *param) : LpmIndicationWrapper(id, item, param) {}
};

static void call_enter(int v)
{
    printf("[%s:%d] %d\n", __FUNCTION__, __LINE__, v);
    lpmRequestProxy->enter(v);
    sem_wait(&sem_enter);
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
    LpmIndication lpmIndication(IfcNames_LpmIndicationH2S, &transportMux, &param);
    lpmRequestProxy = new LpmRequestProxy(IfcNames_LpmRequestS2H, &transportMux, &param);

    for (int i = 0; i < 1024; i++)
        lpmRequestProxy->write(i, (i<<16) | 1);
    int v = 42;
    printf("Saying %d\n", v);
    call_enter(v);
    return 0;
}
