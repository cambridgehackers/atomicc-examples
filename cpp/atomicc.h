#ifndef _ATOMICC_H_
#define _ATOMICC_H_

class Rule {
public:
  virtual bool guard() { return true; };
  virtual void body() = 0;
};

endif
