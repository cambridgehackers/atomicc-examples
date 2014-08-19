
// reg_pipeline example from Bluespec by Example 5.5

#include <atomicc.h>

class Pipe : public Module {
  Reg<int> x1;
  Reg<int> x2;
  Reg<int> x3;
  Reg<int> x4;

  int next_x2, next_x3, next_x4;

  RULE(Pipe,r1,
       { return true; },
       {
	 module->next_x2 = module->x1 + 1;
	 module->next_x3 = module->x2 + 1;
	 module->next_x4 = module->x3 + 1;
       },
       {
	 module->x2 = module->next_x2;
	 module->x3 = module->next_x3;
	 module->x4 = module->next_x4;
       })
public:
  Pipe();
  ~Pipe();
  void send(int a) {
    x1 = a;
  }
  int receive() {
    return x4;
  }
};
