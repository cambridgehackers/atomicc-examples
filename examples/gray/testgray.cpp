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
#include "GrayCounterIfc_IC_width_ND_4_JC_.h"
#include "ReturnInd_IC_width_ND_4_JC_.h"
void atomiccPrintfInit(const char *filename);

static GrayCounterIfc_IC_width_ND_4_JC_Proxy *request = 0;

class ReturnInd : public ReturnInd_IC_width_ND_4_JC_Wrapper
{
public:
    void value ( const uint8_t v ) {
printf("[%s:%d]RETURNNNN %d\n", __FUNCTION__, __LINE__, v);
    }
    ReturnInd(unsigned int id, PortalTransportFunctions *item, void *param) :
         ReturnInd_IC_width_ND_4_JC_Wrapper(id, item, param) {}
};

int main(int argc, const char **argv)
{
    //atomiccPrintfInit("generated/rulec.generated.printf");
    Portal *mcommon = new Portal(5, 0, sizeof(uint32_t), portal_mux_handler, NULL,
        &transportSocketInit,
        NULL, 0);
    PortalMuxParam param = {};
    param.pint = &mcommon->pint;
    ReturnInd returnInd(IfcNames_ReturnInd_IC_width_ND_4_JC_H2S, &transportMux, &param);
    request = new GrayCounterIfc_IC_width_ND_4_JC_Proxy(IfcNames_GrayCounterIfc_IC_width_ND_4_JC_S2H, &transportMux, &param);
    request->writeGray(4);
    request->writeBin(3);
    request->increment();
    request->decrement();
    request->readGray();
    request->readBin();
sleep(2);
    return 0;
}
