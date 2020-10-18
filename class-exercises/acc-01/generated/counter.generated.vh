`ifndef __counter_GENERATED__VH__
`define __counter_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __CounterIfc_DEF__
`define __CounterIfc_DEF__
interface CounterIfc#(MAX_AMOUNT = 22);
    logic startSignal__ENA;
    logic startSignal__RDY;
    logic  busy;
    logic busy__RDY;
    modport server (input  startSignal__ENA,
                    output startSignal__RDY, busy, busy__RDY);
    modport client (output startSignal__ENA,
                    input  startSignal__RDY, busy, busy__RDY);
endinterface
`endif
//METASTART; Counter
//METAEXCLUSIVE; startSignal__ENA; RULE$decRule__ENA
//METAGUARD; startSignal; counter == 0;
//METAGUARD; busy; 1'd1;
//METAGUARD; RULE$decRule; counter != 0;
//METAGUARD; RULE$init; 1'd1;
//METARULES; RULE$decRule; RULE$init
`endif
