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
//#include "fifo.generated.cpp"
#include "ivector.generated.cpp"

unsigned int stop_main_program;
int testCount;
class l_class_OC_IVectorIndication zIVectorIndication;
class l_class_OC_IVector zIVector;

bool l_class_OC_IVectorIndication__heard__RDY(void *thisp) {
        return true;
}
void l_class_OC_IVectorIndication__heard(void *thisp, unsigned int meth, unsigned int v) {
        printf("Heard an echo: %d %d\n", meth, v);
        if (--testCount <= 0)
            stop_main_program = 1;
}

int main(int argc, const char *argv[])
{
  printf("[%s:%d] starting %d\n", __FUNCTION__, __LINE__, argc);
    zIVector.setind(&zIVectorIndication);
    for (int i = 0; i < 10; i++) {
        zIVector.say(i, 44 * i); testCount++;
    }
    while (!stop_main_program) {
        zIVector.run();
    }
  printf("[%s:%d] ending\n", __FUNCTION__, __LINE__);
  return 0;
}

