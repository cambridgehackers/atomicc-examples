`ifndef __IVectorTest_DEF__
`ifndef YOSYS
`define __IVectorTest_DEF__
`endif // YOSYS
typedef struct packed {
    IVector ivector;
} IVectorTest;
typedef struct packed {
    logic [32 - 1:0] c;
    logic [32 - 1:0] b;
    logic [32 - 1:0] a;
} ValuePair;
`endif
