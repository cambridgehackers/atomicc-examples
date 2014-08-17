#include <stdio.h>
#include <stdlib.h>
//#include <functional>
#include "functional_simple"

extern "C" void append(std::function<bool ()> guard, std::function<void ()> body, std::function<void ()> cleanup);

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
  append([this](){ return x < 30;}, [this]()
  {
      int localy = x;
      temp_x = y + 1;
      temp_y = x;
      temp_x = y + 1;
      printf("x=%d, y=%d", x, y);
  }, [this]()
  {
      x = temp_x;
      y = temp_y;
  });
  append([this](){ return x >= 30;}, [this]()
  {
      exit(0);
  }, [this](){});
}

};

Count countTest;
