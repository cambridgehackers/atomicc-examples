#include "atomicc.h"
class  SyncBitIFC {
    __input  __uint(1)        CLK;
    __input  __uint(1)        in;
    __output __uint(1)        out;
    __parameter __uint(32)       width;
};
class SyncBit __implements  SyncBitIFC;
