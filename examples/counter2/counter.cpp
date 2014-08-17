#include <stdio.h>
#include <stdlib.h>
#include <functional>

#include <atomicc2.h>

extern "C" void append(std::function<bool ()> guard, std::function<void ()> body, std::function<void ()> cleanup);

void foo()
{
  int x;
  int y;
  int temp_x;
  int temp_y;
  x = 0;
  append([&](){ return x < 30;}, [&]()
  {
      int localy = x;
      temp_x = y + 1;
      temp_y = x;
      temp_x = y + 1;
      printf("x=%d, y=%d", x, y);
  }, [&]()
  {
      x = temp_x;
      y = temp_y;
  });
  append([&](){ return x >= 30;}, [&]()
  {
      exit(0);
  }, [&](){});
}

