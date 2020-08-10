`ifndef __pastassert_GENERATED__VH__
`define __pastassert_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __PipeIn_OC_0_DEF__
`define __PipeIn_OC_0_DEF__
interface PipeIn_OC_0#(dataWidth = 32, funnelWidth = 99);
    logic enq__ENA;
    logic [dataWidth - 1:0] enq$v;
    logic enq__RDY;
    modport server (input  enq__ENA, enq$v,
                    output enq__RDY);
    modport client (output enq__ENA, enq$v,
                    input  enq__RDY);
endinterface
`endif
`ifndef __PipeIn_OC_1_DEF__
`define __PipeIn_OC_1_DEF__
interface PipeIn_OC_1#(dataWidth = 32, funnelWidth = 99);
    logic enq__ENA;
    logic [dataWidth - 1:0] enq$v;
    logic enq__RDY;
    modport server (input  enq__ENA, enq$v,
                    output enq__RDY);
    modport client (output enq__ENA, enq$v,
                    input  enq__RDY);
endinterface
`endif
`ifndef __PastAssertIfc_DEF__
`define __PastAssertIfc_DEF__
interface PastAssertIfc#(F_TESTID = 9999, MAX_AMOUNT = 22);
    logic startSignal__ENA;
    logic startSignal__RDY;
    logic busy;
    logic busy__RDY;
    modport server (input  startSignal__ENA, busy,
                    output startSignal__RDY, busy__RDY);
    modport client (output startSignal__ENA, busy,
                    input  startSignal__RDY, busy__RDY);
endinterface
`endif
`ifndef __PipeIn_DEF__
`define __PipeIn_DEF__
interface PipeIn;
    logic enq__ENA;
    logic [(16 + 128) - 1:0] enq$v;
    logic enq__RDY;
    modport server (input  enq__ENA, enq$v,
                    output enq__RDY);
    modport client (output enq__ENA, enq$v,
                    input  enq__RDY);
endinterface
`endif
//METASTART; PastAssert
//METAEXCLUSIVE; startSignal__ENA; RULE$decRule__ENA
//METAGUARD; startSignal; counter == 0;
//METAGUARD; busy; 1;
//METAGUARD; RULE$decRule; counter != 0;
//METABEFORE; RULE$verifyRule__ENA; :RULE$decRule__ENA; :startSignal__ENA
//METAGUARD; RULE$verifyRule; 1;
//METARULES; RULE$decRule; RULE$verifyRule
`endif
