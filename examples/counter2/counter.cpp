#include <stdio.h>
#include <stdlib.h>
#include <functional>

#include <atomicc2.h>

extern void append(std::function<bool ()> f1, std::function<void ()> f2);

void foo()
{
  int x;
  x = 0;
  append([&](){ return x < 30;}, [&]()
  {
      int temp_x;
      int y = x;
      x = y + 1;
      temp_x = y + 1;
      printf("x=%d, y=%d", x, y);
      x = temp_x;
  });
  append([&](){ return x >= 30;}, [&]()
  {
      exit(0);
  });
}

