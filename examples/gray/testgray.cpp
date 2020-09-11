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
void atomiccPrintfInit(const char *filename);

extern "C" int global_sim_fd;
//0   0000
//1   0001
//2   0011
//3   0010
//4   0110
//5   0111
//6   0101
//7   0100
//8   1100
//9   1101
//10  1111
//11  1110
//12  1010
//13  1011
//14  1001
//15  1000

int main(int argc, const char **argv)
{
    //atomiccPrintfInit("generated/rulec.generated.printf");
    Portal *mcommon = new Portal(5, 0, sizeof(uint32_t), portal_mux_handler, NULL,
#ifdef SIMULATION
        &transportSocketInit,
#else
        &transportPortal,
#endif
        NULL, 0);
    PortalMuxParam param = {};
    param.pint = &mcommon->pint;
    GrayCounterIfc_IC_width_ND_4_JC_Proxy *request = new GrayCounterIfc_IC_width_ND_4_JC_Proxy(
        IfcNames_GrayCounterIfc_IC_width_ND_4_JC_S2H, &transportMux, &param);
    request->writeGray(1);
    for (int i = 0; i < 20; i++) {
        int gray = request->readGray();
        int bin = request->readBin();
printf("[%s:%d] bin %x gray %x\n", __FUNCTION__, __LINE__, bin, gray);
        request->increment();
    }
    request->writeBin(0x8);
    for (int i = 0; i < 20; i++) {
        int gray = request->readGray();
        int bin = request->readBin();
printf("[%s:%d] dec bin %x gray %x\n", __FUNCTION__, __LINE__, bin, gray);
        request->decrement();
    }
    return 0;
}
