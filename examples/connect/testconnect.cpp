// Copyright (c) 2015 The Connectal Project

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
#include <string.h>
#include <stdlib.h>
#include <stdint.h>

//#define l_module_OC_PipeIn l_module_OC_EchoRequestInput 
//#define l_module_OC_PipeIn_OC_0 l_module_OC_EchoIndicationInput 
//#define l_module_OC_foo l_module_OC_EchoIndication
#define request0 request
#include "connect.generated.cpp"
//#include "l_module_OC_Echo.cpp"
//#include "l_module_OC_EchoIndicationOutput.cpp"
//#include "l_module_OC_EchoRequestInput.cpp"
//#include "l_module_OC_EchoRequestOutput.cpp"
//#include "l_module_OC_EchoIndicationInput.cpp"

unsigned int stop_main_program;
int testCount;
l_module_OC_Connect zConnect;

void respheard(void *thisp, unsigned int heard_meth, unsigned int heard_v) {
    printf("Heard an echo: %d %d\n", heard_meth, heard_v);
    if (--testCount <= 0)
        stop_main_program = 1;
};
bool respheard__RDY(void *thisp) { return true;}

int main(int argc, const char *argv[])
{
    printf("[%s:%d] starting %d\n", __FUNCTION__, __LINE__, argc);
#if 0
    l_module_OC_EchoRequest er(&zConnect.lEcho,
        (unsigned long)&l_module_OC_Echo__say__RDY,
        (unsigned long)&l_module_OC_Echo__say);
    zConnect.lEchoRequestInput.setrequest(&er);
    l_module_OC_EchoIndication ei(&zConnect.lEchoIndicationOutput,
        (unsigned long)&l_module_OC_EchoIndicationOutput__heard__RDY,
        (unsigned long)&l_module_OC_EchoIndicationOutput__heard);
    zConnect.lEcho.setindication(&ei);
    zConnect.lEchoIndicationOutput.setpipe(&zConnect.lEchoIndicationInput_test);

    zConnect.lEchoRequestOutput_test.setpipe(&zConnect.lEchoRequestInput);
#endif
    l_ainterface_OC_EchoIndication zConnectresp(NULL, &respheard__RDY, &respheard);
    zConnect.lEII_test.setindication(&zConnectresp);

    zConnect.lERO_test.request.say(1, 44 * 1); testCount++;
    testCount++;
    testCount++;
    zConnect.run(); zConnect.lERO_test.request.say(2, 44 * 2);
    zConnect.run(); zConnect.lERO_test.request.say(3, 44 * 3);
    while (!stop_main_program) {
        zConnect.run();
    }
    printf("[%s:%d] ending\n", __FUNCTION__, __LINE__);
    return 0;
}


