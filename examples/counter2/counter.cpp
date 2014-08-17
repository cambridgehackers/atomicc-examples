#include <stdio.h>
#include <stdlib.h>
#include <atomicc2.h>

class Count {
public:
  int x;
public:
  Count();
};

Count::Count()
{
  x = 0;
  class Countup : public Rule, public Count {
    int temp_x;
  public:
    Countup() {}
    bool guard() {
      return x < 30;
    }
    void body() {
      int y = x;
      temp_x = y + 1;
      printf("x=%d, y=%d", x, y);
    }
    void cleanup() {
      x = temp_x;
    }
  } countup;

  class Done : public Rule, public Count {
  public:
    Done() {}
    bool guard() {
      return x >= 30;
    }
    void body() {
      exit(0);
    }
  } done;

}

Count countTest;
