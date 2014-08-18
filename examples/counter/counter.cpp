#include <stdio.h>
#include <stdlib.h>
#include <atomicc.h>

#define RULE(moduletype,name,guardbody,bodybody,updatebody) \
  class name : public Rule {moduletype *module; public: name(moduletype *module=0) : module(module) {} virtual bool guard() guardbody; virtual void body() bodybody; void update() updatebody } name ## Instance;

class Count {
protected:
  Reg<int> x;
  int new_x;
  RULE(Count,count,
       {
	 return module->x < 30;
       },
       {
	 int y = module->x;
	 module->new_x  = y + 1;
	 printf("x=%d, y=%d", (int)module->x, y);
       },
       {
	 module->x = module->new_x;
       })

  RULE(Count,done,
       {
	 return module->x >= 30;
       },
       {
	 // no body
       },
       {
	 exit(0);
       })
public:
  Count();
};

Count::Count()
  : x(0), countInstance(this), doneInstance(this)
{
}

Count countTest;
