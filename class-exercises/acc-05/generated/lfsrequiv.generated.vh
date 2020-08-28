`ifndef __lfsrequiv_GENERATED__VH__
`define __lfsrequiv_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __LfsrEquivIfc_DEF__
`define __LfsrEquivIfc_DEF__
interface LfsrEquivIfc;
    logic shiftBit__ENA;
    logic  shiftBit$v;
    logic shiftBit__RDY;
    logic  outBit;
    logic outBit__RDY;
    modport server (input  shiftBit__ENA, shiftBit$v,
                    output shiftBit__RDY, outBit, outBit__RDY);
    modport client (output shiftBit__ENA, shiftBit$v,
                    input  shiftBit__RDY, outBit, outBit__RDY);
endinterface
`endif
`ifndef __LfsrFibIfc_DEF__
`define __LfsrFibIfc_DEF__
interface LfsrFibIfc#(LN = 8, TAPS = 45);
    logic shiftBit__ENA;
    logic  shiftBit$v;
    logic shiftBit__RDY;
    logic  outBit;
    logic outBit__RDY;
    modport server (input  shiftBit__ENA, shiftBit$v,
                    output shiftBit__RDY, outBit, outBit__RDY);
    modport client (output shiftBit__ENA, shiftBit$v,
                    input  shiftBit__RDY, outBit, outBit__RDY);
endinterface
`endif
`ifndef __LfsrGalIfc_DEF__
`define __LfsrGalIfc_DEF__
interface LfsrGalIfc#(LN = 8, TAPS = 45);
    logic shiftBit__ENA;
    logic  shiftBit$v;
    logic shiftBit__RDY;
    logic  outBit;
    logic outBit__RDY;
    modport server (input  shiftBit__ENA, shiftBit$v,
                    output shiftBit__RDY, outBit, outBit__RDY);
    modport client (output shiftBit__ENA, shiftBit$v,
                    input  shiftBit__RDY, outBit, outBit__RDY);
endinterface
`endif
//METASTART; LfsrEquiv
//METAINTERNAL; fib; LfsrFib(LN=8,TAPS=45);
//METAINTERNAL; gal; LfsrGal(LN=8,TAPS=45);
//METAINVOKE; shiftBit__ENA; :fib$shiftBit__ENA;:gal$shiftBit__ENA;
//METAGUARD; shiftBit; fib$shiftBit__RDY && gal$shiftBit__RDY;
//METAGUARD; outBit; 1;
//METAGUARD; RULE$updateRule; fib$outBit__RDY && gal$outBit__RDY;
//METARULES; RULE$updateRule
//METASTART; LfsrFib
//METAGUARD; shiftBit; 1;
//METAGUARD; outBit; 1;
//METASTART; LfsrGal
//METAGUARD; shiftBit; 1;
//METAGUARD; outBit; 1;
`endif
