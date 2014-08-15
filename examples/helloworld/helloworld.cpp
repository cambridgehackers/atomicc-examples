#include <stdio.h>
#include <stdlib.h>
#include <atomicc.h>

class HelloWorld {
  class Greet : public Rule {
    void body() {
      printf("Hello World");
      exit(0);
    }
  } greet;
};

HelloWorld helloWorldTest;

