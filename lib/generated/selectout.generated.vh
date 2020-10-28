`ifndef __selectout_GENERATED__VH__
`define __selectout_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __SelectOutIfc_DEF__
`define __SelectOutIfc_DEF__
interface SelectOutIfc#(funnelWidth = 8, width = 16);
    logic select__ENA;
    logic [32 - 1:0] select$v;
    logic select__RDY;
    modport server (input  select__ENA, select$v,
                    output select__RDY);
    modport client (output select__ENA, select$v,
                    input  select__RDY);
endinterface
`endif
//METASTART; SelectOut
//METAINTERNAL; in__deq__RDY_orCC; SelectIndex(funnelWidth=20,width=14);
//METAINTERNAL; in__first_orCC; SelectIndex(funnelWidth=20,width=14);
//METAINTERNAL; in__first__RDY_orCC; SelectIndex(funnelWidth=20,width=14);
//METAGUARD; select; 1'd1;
//METAINVOKE; out.deq__ENA; :in[__inst$Genvar1].deq__ENA;
//METAGUARD; out.deq; in__deq__RDY_or1;
//METAGUARD; out.first; in__first__RDY_or1;
`endif
