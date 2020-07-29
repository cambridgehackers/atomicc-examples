`ifndef __reqarb_GENERATED__VH__
`define __reqarb_GENERATED__VH__

//METASTART; ReqArb
//METAINVOKE; a__ENA; :out$a__ENA;
//METAEXCLUSIVE; a__ENA; b__ENA
//METAGUARD; a; !( ( 0 == ( ( b__ENA != 0 ) ^ 1 ) ) || ( !out$a__RDY ) );
//METAINVOKE; b__ENA; :out$a__ENA;
//METAGUARD; b; !( ( 0 == ( ( a__ENA != 0 ) ^ 1 ) ) || ( !out$a__RDY ) );
`endif
