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
  sleep(2);
  printf("[%s:%d] ending\n", __FUNCTION__, __LINE__);
  return 0;
}

