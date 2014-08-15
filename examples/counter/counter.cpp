#include <stdio.h>
#include <stdlib.h>
#include <atomicc.h>

class Count {
  Reg<int> *x;
  class Countup : public Rule {
    bool guard() {
      return x.read() < 30;
    }
    void body() {
      int y = x->read();
      x->write(y + 1);
      printf("x=%d, y=%d", x.read(), y);
    }
  } countup;

  class Done : public Rule {
    bool guard() {
      return x.read() >= 30;
    }
    void body() {
      exit(0);
    }
  } done;
public:
  Count();
};

Count::Count()
  : x(new Reg<int>(0)) {
}

Count countTest;
