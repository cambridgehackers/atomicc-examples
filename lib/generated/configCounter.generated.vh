`ifndef __configCounter_GENERATED__VH__
`define __configCounter_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __ConfigCounterIfc_DEF__
`define __ConfigCounterIfc_DEF__
interface ConfigCounterIfc#(count_sz = 10);
    logic decrement__ENA;
    logic [count_sz - 1:0] decrement$v;
    logic decrement__RDY;
    logic  maybeDecrement;
    logic [10 - 1:0] maybeDecrement$v;
    logic maybeDecrement__RDY;
    logic increment__ENA;
    logic [count_sz - 1:0] increment$v;
    logic increment__RDY;
    logic [count_sz - 1:0] read;
    logic read__RDY;
    logic  positive;
    logic positive__RDY;
    modport server (input  decrement__ENA, decrement$v, maybeDecrement, maybeDecrement$v, increment__ENA, increment$v, read, positive,
                    output decrement__RDY, maybeDecrement__RDY, increment__RDY, read__RDY, positive__RDY);
    modport client (output decrement__ENA, decrement$v, maybeDecrement, maybeDecrement$v, increment__ENA, increment$v, read, positive,
                    input  decrement__RDY, maybeDecrement__RDY, increment__RDY, read__RDY, positive__RDY);
endinterface
`endif
//METASTART; ConfigCounter
//METAGUARD; decrement; 1;
//METAGUARD; maybeDecrement; 1;
//METAGUARD; increment; 1;
//METAGUARD; read; 1;
//METAGUARD; positive; 1;
//METAGUARD; RULE$react; 1;
//METARULES; RULE$react
`endif
