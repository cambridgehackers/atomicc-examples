`ifndef __adapter_GENERATED__VH__
`define __adapter_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __NOCDataH_DEF__
`define __NOCDataH_DEF__
typedef struct packed {
    logic [128 - 1:0] data;
    logic [16 - 1:0] length;
} NOCDataH;
`endif
`ifndef __PipeInB_DEF__
`define __PipeInB_DEF__
interface PipeInB#(width = 32);
    logic enq__ENA;
    logic [width - 1:0] enq$v;
    logic  enq$last;
    logic enq__RDY;
    modport server (input  enq__ENA, enq$v, enq$last,
                    output enq__RDY);
    modport client (output enq__ENA, enq$v, enq$last,
                    input  enq__RDY);
endinterface
`endif
`ifndef __PipeIn_DEF__
`define __PipeIn_DEF__
interface PipeIn#(width = 32);
    logic enq__ENA;
    logic [width - 1:0] enq$v;
    logic enq__RDY;
    modport server (input  enq__ENA, enq$v,
                    output enq__RDY);
    modport client (output enq__ENA, enq$v,
                    input  enq__RDY);
endinterface
`endif
//METASTART; AdapterFromBus
//METAEXCLUSIVE; in.enq__ENA; RULE$pushValue__ENA
//METAGUARD; in.enq; 0 != ( waitForEnq ^ 1 );
//METAINVOKE; RULE$pushValue__ENA; :out.enq__ENA;
//METABEFORE; RULE$pushValue__ENA; :in.enq__ENA
//METAGUARD; RULE$pushValue; !( ( 0 == waitForEnq ) || ( !out.enq__RDY ) );
//METARULES; RULE$pushValue
//METASTART; AdapterToBus
//METAEXCLUSIVE; in.enq__ENA; RULE$copyRule__ENA
//METAGUARD; in.enq; remain == 0;
//METAINVOKE; RULE$copyRule__ENA; :out.enq__ENA;
//METABEFORE; RULE$copyRule__ENA; :in.enq__ENA
//METAGUARD; RULE$copyRule; !( ( remain == 0 ) || ( !out.enq__RDY ) );
//METARULES; RULE$copyRule
`endif
