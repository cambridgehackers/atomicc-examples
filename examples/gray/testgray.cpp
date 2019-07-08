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
#include "GrayCounterIfc_IC_width_ND_4_JC_.h"
void atomiccPrintfInit(const char *filename);

int main(int argc, const char **argv)
{
    //atomiccPrintfInit("generated/rulec.generated.printf");
    Portal *mcommon = new Portal(5, 0, sizeof(uint32_t), portal_mux_handler, NULL,
        &transportSocketInit,
        NULL, 0);
    PortalMuxParam param = {};
    param.pint = &mcommon->pint;
    GrayCounterIfc_IC_width_ND_4_JC_Proxy *request = new GrayCounterIfc_IC_width_ND_4_JC_Proxy(
        IfcNames_GrayCounterIfc_IC_width_ND_4_JC_S2H, &transportMux, &param);
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
