#include "atomicc.h"
class  ClockDivIFC {
    __input  __uint(1)        CLK;
    __output __uint(1)        CLK_OUT;
    __parameter __uint(32)       lower;
    __input  __uint(1)        nRST;
    __parameter __uint(32)       offset;
    __parameter __uint(32)       upper;
    __parameter __uint(32)       width;
};
class ClockDiv __implements  ClockDivIFC;
