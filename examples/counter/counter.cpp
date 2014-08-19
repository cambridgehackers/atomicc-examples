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
  : x(0)
{
}

Count countTest;
