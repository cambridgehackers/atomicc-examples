#include <stdio.h>
#include <stdlib.h>
#include <atomicc.h>

class Count : public Module {
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
  : x(0), countRule(this), doneRule(this)
{
}

Module::Module()
{
printf("[%s:%d]\n", __FUNCTION__, __LINE__);
}
Count countTest;

int main(int argc, const char *argv[])
{
  printf("[%s:%d] starting\n", __FUNCTION__, __LINE__);
  return 0;
}
