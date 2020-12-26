`include "atomicclib.vh"

`ifndef __IVectorTest_DEF__
`define __IVectorTest_DEF__
typedef struct packed {
    IVector ivector;
} IVectorTest;
`endif
`ifndef __ValueType_DEF__
`define __ValueType_DEF__
typedef struct packed {
    logic [4 - 1:0] b;
    logic [6 - 1:0] a;
} ValueType;
`endif
//METASTART; IVector
//METAINTERNAL; fifo; Fifo1Base(width=10);
//METAINVOKE; request.say__ENA; :fifo$in.enq__ENA;
//METAGUARD; request.say; fifo$in.enq__RDY;
//METAINVOKE; RULE$respond__ENA; :fifo$out.deq__ENA;:ind.heard__ENA;
//METAGUARD; RULE$respond; fifo$out.first__RDY && fifo$out.deq__RDY && ind.heard__RDY;
//METARULES; RULE$respond
