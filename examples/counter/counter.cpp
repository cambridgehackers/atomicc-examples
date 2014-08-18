#include <stdio.h>
#include <stdlib.h>
#include <atomicc.h>

class Count {
protected:
  Reg<int> x;
  int new_x;
  class Countup : public Rule {
    Count *module;
  public:
    Countup(Count *module) : module(module) {}
    bool guard() {
      return module->x < 30;
    }
    void body() {
      int y = module->x;
      module->new_x  = y + 1;
      printf("x=%d, y=%d", (int)module->x, y);
    }
    void update() {
      module->x = module->new_x;
    }
  } countup;

  class Done : public Rule {
    Count *module;
  public:
    Done(Count *module) : module(module) {}
    bool guard() {
      return module->x >= 30;
    }
    void body() {
    }
    void update() {
      exit(0);
    }
  } done;
  friend class Countup;
  friend class Done;
public:
  Count();
};

Count::Count()
  : x(0), countup(this), done(this)
{
}

Count countTest;
