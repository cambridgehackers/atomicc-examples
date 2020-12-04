// Copyright (c) 2016 The Connectal Project

// Permission is hereby granted, free of charge, to any person
// obtaining a copy of this software and associated documentation
// files (the "Software"), to deal in the Software without
// restriction, including without limitation the rights to use, copy,
// modify, merge, publish, distribute, sublicense, and/or sell copies
// of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
// BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
// ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
#include <stdio.h>
#include "sock_utils.h"
#include "EchoIndication.h"
#include "EchoRequest.h"
#include "GeneratedTypes.h"

unsigned int stop_main_program;
class EchoRequestProxy *echoRequestProxy;

class EchoIndication : public EchoIndicationWrapper {
public:
    void heard(unsigned int v) {
        printf((("Heard an echo: %d\n")), v);
        stop_main_program = 1;
    }
    void heards(uint16_t ahEnd, uint16_t ahFrontEnd, uint8_t ahBackSync, uint8_t ahSyncWidth,
        uint16_t avEnd, uint16_t avFrontEnd, uint8_t avBackSync, uint8_t avSyncWidth) {
        printf("[%s:%d] ahEnd %d ahFrontEnd %d ahBackSync %d ahSyncWidth %d avEnd %d avFrontEnd %d avBackSync %d avSyncWidth %d\n", __FUNCTION__, __LINE__,
            ahEnd, ahFrontEnd, ahBackSync, ahSyncWidth, avEnd, avFrontEnd, avBackSync, avSyncWidth);
    }
    EchoIndication(unsigned int id, PortalTransportFunctions *item, void *param) : EchoIndicationWrapper(id, item, param) {}
};

int main(int argc, const char *argv[])
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
    EchoIndication echoIndication(IfcNames_EchoIndicationH2S, &transportMux, &param);
    echoRequestProxy = new EchoRequestProxy(IfcNames_EchoRequestS2H, &transportMux, &param);

  printf("[%s:%d] starting %d\n", __FUNCTION__, __LINE__, argc);
    //echoRequestProxy.setind(&zEchoIndication);
    echoRequestProxy->say(22);
    //while (!stop_main_program) {
        //echoRequestProxy.run();
    //}
  printf("[%s:%d] sleep\n", __FUNCTION__, __LINE__);
#define MODE_1080p /* FORMAT 16 */
//#define MODE_720p /* FORMAT 4 */
#ifdef MODE_1080p /* FORMAT 16 */
#define v_total 1125L
#define vFront 4
#define vBack 36L
#define vSyncWidth 5
#define h_total 2200L
#define hFront 88L
#define hBack 148L
#define hSyncWidth 44L
#define PATTERN_RAMP_STEP 0x0222L
#endif
#ifdef MODE_720p /* FORMAT 4 */
#define v_total 750L
#define vFront 5L
#define vBack 20L
#define vSyncWidth 5
#define h_total 1650L
#define hFront 110L
#define hBack 220L
#define hSyncWidth 40L
#define PATTERN_RAMP_STEP 0x0333L // 20'hFFFFF / 1280 act_pixels per line = 20'h0333
#endif
#define PATTERN_TYPE 4    // RAMP
//#define PATTERN_TYPE 1 // BORDER.
        printf("[%s:%d] ahEnd %ld ahFrontEnd %ld ahBackSync %ld ahSyncWidth %ld avEnd %ld avFrontEnd %ld avBackSync %ld avSyncWidth %d\n", __FUNCTION__, __LINE__,
            h_total-1, h_total-1-hFront, hBack + hSyncWidth, hSyncWidth, v_total-1, v_total-1-vFront, vBack + vSyncWidth, vSyncWidth);
    echoRequestProxy->setup(
h_total-1,
h_total-1-hFront,
hBack + hSyncWidth,
hSyncWidth,
v_total-1,
v_total-1-vFront,
vBack + vSyncWidth,
vSyncWidth);
  sleep(2);
  printf("[%s:%d] ending\n", __FUNCTION__, __LINE__);
  return 0;
}

