`ifndef __IVectorTest_DEF__
`ifndef YOSYS
`define __IVectorTest_DEF__
`endif // YOSYS
typedef struct packed {
    IVector ivector;
} IVectorTest;
typedef struct packed {
    logic [4 - 1:0] b;
    logic [6 - 1:0] a;
} ValueType;
`endif
