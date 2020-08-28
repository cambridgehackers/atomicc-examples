`ifndef __reqarb_GENERATED__VH__
`define __reqarb_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __ReqCallout_DEF__
`define __ReqCallout_DEF__
interface ReqCallout;
    logic a__ENA;
    logic  a$v;
    logic a__RDY;
    modport server (input  a__ENA, a$v,
                    output a__RDY);
    modport client (output a__ENA, a$v,
                    input  a__RDY);
endinterface
`endif
`ifndef __ReqArbIfc_DEF__
`define __ReqArbIfc_DEF__
interface ReqArbIfc;
    logic a__ENA;
    logic  a$v;
    logic a__RDY;
    logic b__ENA;
    logic  b$v;
    logic b__RDY;
    modport server (input  a__ENA, a$v, b__ENA, b$v,
                    output a__RDY, b__RDY);
    modport client (output a__ENA, a$v, b__ENA, b$v,
                    input  a__RDY, b__RDY);
endinterface
`endif
//METASTART; ReqArb
//METAINVOKE; a__ENA; :out.a__ENA;
//METAEXCLUSIVE; a__ENA; b__ENA
//METAGUARD; a; !( ( 0 == ( ( b__ENA != 0 ) ^ 1 ) ) || ( !out.a__RDY ) );
//METAINVOKE; b__ENA; :out.a__ENA;
//METAGUARD; b; !( ( 0 == ( ( a__ENA != 0 ) ^ 1 ) ) || ( !out.a__RDY ) );
`endif
