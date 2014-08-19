
#include <atomicc.h>
#include <fifo.h>
#include <stdio.h>

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
       { return module->fifo->notEmpty(); },
       { 
	 module->response = module->fifo->first();
       },
       {
	 module->ind->echo(module->response);
       });
public:
  Echo(EchoIndication *ind) : fifo(new Fifo1<int>()), ind(ind)
  {
  };
  ~Echo();
  Action *echo(int &v) {
    return fifo->enq(v);
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
  int msg;
  bool valid;
  RULE(EchoTest,drive,
       { return true; },
       {
	 module->msg = 22;
	 module->valid = true;
       },
       {
       });

public:
  EchoTest()
    : echo(new Echo(new EchoIndicationTest())), msg(0), valid(false) {
    // append the echo() action to driveRule
    driveRule.append(echo->echo(msg));
  }
  ~EchoTest();
};

EchoTest echoTest;

