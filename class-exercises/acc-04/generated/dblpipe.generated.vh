`ifndef __dblpipe_GENERATED__VH__
`define __dblpipe_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __DblPipeIfc_DEF__
`define __DblPipeIfc_DEF__
interface DblPipeIfc;
    logic shiftBit__ENA;
    logic  shiftBit$v;
    logic shiftBit__RDY;
    logic outBit;
    logic outBit__RDY;
    modport server (input  shiftBit__ENA, shiftBit$v, outBit,
                    output shiftBit__RDY, outBit__RDY);
    modport client (output shiftBit__ENA, shiftBit$v, outBit,
                    input  shiftBit__RDY, outBit__RDY);
endinterface
`endif
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
`ifndef __LfsrFibIfc_DEF__
`define __LfsrFibIfc_DEF__
interface LfsrFibIfc#(LN = 8, TAPS = 45);
    logic shiftBit__ENA;
    logic  shiftBit$v;
    logic shiftBit__RDY;
    logic outBit;
    logic outBit__RDY;
    modport server (input  shiftBit__ENA, shiftBit$v, outBit,
                    output shiftBit__RDY, outBit__RDY);
    modport client (output shiftBit__ENA, shiftBit$v, outBit,
                    input  shiftBit__RDY, outBit__RDY);
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
//METASTART; DblPipe
//METAINTERNAL; one; LfsrFib(LN=8,TAPS=45);
//METAINTERNAL; two; LfsrFib(LN=8,TAPS=45);
//METAINVOKE; shiftBit__ENA; :one$shiftBit__ENA;:two$shiftBit__ENA;
//METAGUARD; shiftBit; one$shiftBit__RDY && two$shiftBit__RDY;
//METAGUARD; outBit; 1;
//METAINVOKE; RULE$updateRule__ENA; :one$outBit;:two$outBit;
//METAGUARD; RULE$updateRule; one$outBit__RDY && two$outBit__RDY;
//METARULES; RULE$updateRule
//METASTART; LfsrFib
//METAGUARD; shiftBit; 1;
//METAGUARD; outBit; 1;
`endif
