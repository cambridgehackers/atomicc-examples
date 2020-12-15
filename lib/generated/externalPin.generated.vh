`ifndef __externalPin_GENERATED__VH__
`define __externalPin_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __ExternalPinIFC_DEF__
`define __ExternalPinIFC_DEF__
interface ExternalPinIFC#(width = 32);
    logic [width - 1:0] in;
    logic [width - 1:0] out;
    modport server (input  in,
                    output out);
    modport client (output in,
                    input  out);
endinterface
`endif
//METASTART; ExternalPin
//METAGUARD; RULE$init; 1'd1;
//METARULES; RULE$init
`endif
