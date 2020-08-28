`ifndef __pastassert_GENERATED__VH__
`define __pastassert_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __PastAssertIfc_DEF__
`define __PastAssertIfc_DEF__
interface PastAssertIfc#(F_TESTID = 9999, MAX_AMOUNT = 22);
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
//METASTART; PastAssert
//METAEXCLUSIVE; startSignal__ENA; RULE$decRule__ENA
//METAGUARD; startSignal; counter == 0;
//METAGUARD; busy; 1;
//METAGUARD; RULE$decRule; counter != 0;
//METABEFORE; RULE$verifyRule__ENA; :RULE$decRule__ENA; :startSignal__ENA
//METAGUARD; RULE$verifyRule; 1;
//METARULES; RULE$decRule; RULE$verifyRule
`endif
