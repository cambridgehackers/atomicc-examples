`ifndef __lfsrequiv_GENERATED__VH__
`define __lfsrequiv_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __NOCDataH_DEF__
`define __NOCDataH_DEF__
typedef struct packed {
    logic [128 - 1:0] data;
    logic [16 - 1:0] length;
} NOCDataH;
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
`ifndef __LfsrEquivIfc_DEF__
`define __LfsrEquivIfc_DEF__
interface LfsrEquivIfc;
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
`ifndef __LfsrGalIfc_DEF__
`define __LfsrGalIfc_DEF__
interface LfsrGalIfc#(LN = 8, TAPS = 45);
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
//METASTART; LfsrEquiv
//METAINTERNAL; fib; LfsrFib(LN=8,TAPS=45);
//METAINTERNAL; gal; LfsrGal(LN=8,TAPS=45);
//METAINVOKE; shiftBit__ENA; :fib$shiftBit__ENA;:gal$shiftBit__ENA;
//METAGUARD; shiftBit; fib$shiftBit__RDY && gal$shiftBit__RDY;
//METAGUARD; outBit; 1;
//METAINVOKE; RULE$updateRule__ENA; :fib$outBit;:gal$outBit;
//METAGUARD; RULE$updateRule; fib$outBit__RDY && gal$outBit__RDY;
//METARULES; RULE$updateRule
//METASTART; LfsrFib
//METAGUARD; shiftBit; 1;
//METAGUARD; outBit; 1;
//METASTART; LfsrGal
//METAGUARD; shiftBit; 1;
//METAGUARD; outBit; 1;
`endif
