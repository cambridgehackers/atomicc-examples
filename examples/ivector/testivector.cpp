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
#include <string.h>
#include <stdlib.h>
#include <unistd.h> //sleep
//#include "fifo.generated.cpp"

unsigned int stop_main_program;
int testCount;
extern void l_module_OC_IVectorIndication__heard(void *thisarg, unsigned int heard_meth, unsigned int heard_v);
extern bool l_module_OC_IVectorIndication__heard__RDY(void *thisarg);
class l_module_OC_IVectorIndication {
public:
  void heard(unsigned int heard_meth, unsigned int heard_v) { l_module_OC_IVectorIndication__heard(this, heard_meth, heard_v); }
  bool heard__RDY(void) { return l_module_OC_IVectorIndication__heard__RDY(this); }
};
void l_module_OC_IVectorIndication__heard(void *thisarg, unsigned int heard_meth, unsigned int heard_v) {
        l_module_OC_IVectorIndication * thisp = (l_module_OC_IVectorIndication *)thisarg;
        testCount = testCount + (-1);
        if ((testCount + (-1)) <= 0) {
            stop_main_program = 1;
        }
    }
bool l_module_OC_IVectorIndication__heard__RDY(void *thisarg) {
        l_module_OC_IVectorIndication * thisp = (l_module_OC_IVectorIndication *)thisarg;
        return 1;
}


#include "ivector.generated.cpp"
class l_module_OC_IVectorIndication zIVectorIndication;
class l_module_OC_IVector zIVector;

int main(int argc, const char *argv[])
{
  printf("[%s:%d] starting %d\n", __FUNCTION__, __LINE__, argc);
    zIVector.setind(&zIVectorIndication);
    for (int i = 0; i < 10; i++) {
        zIVector.in.say(i, 44 * i); testCount++;
    }
    while (!stop_main_program) {
        zIVector.run();
    }
  printf("[%s:%d] ending\n", __FUNCTION__, __LINE__);
  return 0;
}

