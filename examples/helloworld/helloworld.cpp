#include <stdio.h>
#include <stdlib.h>
#include <atomicc.h>

class HelloWorld {
  class Greet : public Rule {
  public:
    void body() {
      printf("Hello World");
      exit(0);
    }
  } greet;
};

int main(int argc, const char **argv) {
  HelloWorld helloWorldTest;
  // call to runtime or compiler goes here
  while (1) {
    // pick a rule, execute the rule
  }
}
