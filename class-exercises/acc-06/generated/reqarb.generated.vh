`ifndef __reqarb_GENERATED__VH__
`define __reqarb_GENERATED__VH__

//METASTART; ReqArb
//METAINVOKE; a__ENA; :out$a__ENA;
//METAEXCLUSIVE; a__ENA; b__ENA
//METAGUARD; a; ( b__ENA == 0 ) && out$a__RDY;
//METAINVOKE; b__ENA; :out$a__ENA;
//METAGUARD; b; ( a__ENA == 0 ) && out$a__RDY;
`endif
