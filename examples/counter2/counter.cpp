#include <stdio.h>
#include <stdlib.h>

#include "functional_simple"

typedef bool (*BFUN)();
typedef void (*VFUN)();
#define BF(A) std::function<bool()>(A).func2
#define VF(A) std::function<void()>(A).func2

extern "C" void rule(BFUN guard, VFUN body, VFUN cleanup);

class Count {
protected:
  int x;
  int y;
  int temp_x;
  int temp_y;
public:
  Count()
{
  x = 0;
  rule(BF([this] () { return x < 30;}),
  VF([this] ()
  {
      int localy = x;
      temp_x = y + 1;
      temp_y = x;
      temp_x = y + 1;
      printf("x=%d, y=%d", x, y);
  }),
  VF([this] ()
  {
      x = temp_x;
      y = temp_y;
  }));
  rule(BF([this] () { return x >= 30;}),
  VF([this] ()
  {
      exit(0);
  }), VF([this](){}));
}

};

Count countTest;

int main()
{
}
