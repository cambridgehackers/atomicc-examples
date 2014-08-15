#include <stdio.h>
#include <stdlib.h>
#include <atomicc.h>

class Count {
protected:
  Reg<int> *x;
  class Countup : public Rule {
    Count *module;
  public:
    Countup(Count *module) : module(module) {}
    bool guard() {
      return module->x->read() < 30;
    }
    void body() {
      int y = module->x->read();
      module->x->write(y + 1);
      printf("x=%d, y=%d", module->x->read(), y);
    }
  } countup;

  class Done : public Rule {
    Count *module;
  public:
    Done(Count *module) : module(module) {}
    bool guard() {
      return module->x->read() >= 30;
    }
    void body() {
      exit(0);
    }
  } done;
  friend class Countup;
  friend class Done;
public:
  Count();
};

Count::Count()
  : x(new Reg<int>(0)), countup(this), done(this)
{
}

Count countTest;
