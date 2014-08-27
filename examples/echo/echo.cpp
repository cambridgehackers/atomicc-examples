
#include <atomicc.h>
#include <fifo.h>
#include <stdio.h>
#include <stdlib.h>

////////////////////////////////////////////////////////////
// Echo
////////////////////////////////////////////////////////////

class EchoIndication {
public:
  void echo(int v);
};

class Echo : public Module {
  Fifo<int> *fifo;
  EchoIndication *ind;
  int response;
  RULE(Echo,respond,
       {
	 return module->fifo->deq()->guard()
	   && module->fifo->first()->guard();
       },
       { 
	 module->response = module->fifo->first()->value();
       },
       {
	 module->ind->echo(module->response);
	 module->fifo->deq()->update();
       });
public:
  Echo(EchoIndication *ind)
    : fifo(new Fifo1<int>()), ind(ind), respondRule(this)
  {
  };
  ~Echo();
  Action<int> *echo() {
    return fifo->enq();
  }
};

////////////////////////////////////////////////////////////
// Test Bench
////////////////////////////////////////////////////////////

class EchoIndicationTest : public EchoIndication {
public:
  void echo(int v) {
    printf("Heard an echo: %d\n", v);
    exit(0);
  }
};

class EchoTest : public Module {
  Echo *echo;
  RULE(EchoTest,drive,
       {
	 return module->echo->echo()->guard();
       },
       {
	 module->echo->echo()->body(22);
       },
       {
	 module->echo->echo()->update();
       });

public:
  EchoTest()
    : echo(new Echo(new EchoIndicationTest())), driveRule(this) {
  }
  ~EchoTest();
};

EchoTest echoTest;

int main(int argc, const char *argv[])
{
  printf("[%s:%d] starting\n", __FUNCTION__, __LINE__);
  return 0;
}

