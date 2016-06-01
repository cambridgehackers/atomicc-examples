
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
//#include "fifo.generated.h"
#include "fifo.generated.cpp"
#include "echo.generated.cpp"
//#include "l_class_OC_FifoPong.cpp"

unsigned int stop_main_program;
class l_class_OC_EchoIndication zEchoIndication;
class l_class_OC_Echo zEcho;

bool l_class_OC_EchoIndication__heard__RDY(void *thisp) {
        return true;
}
void l_class_OC_EchoIndication__heard(void *thisp, unsigned int v) {
        printf((("Heard an echo: %d\n")), v);
        stop_main_program = 1;
}

int main(int argc, const char *argv[])
{
  printf("[%s:%d] starting %d\n", __FUNCTION__, __LINE__, argc);
    zEcho.setind(&zEchoIndication);
    zEcho.say(22);
    while (!stop_main_program) {
        zEcho.run();
    }
  printf("[%s:%d] ending\n", __FUNCTION__, __LINE__);
  return 0;
}

