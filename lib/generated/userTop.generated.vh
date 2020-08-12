`ifndef __userTop_GENERATED__VH__
`define __userTop_GENERATED__VH__
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
    logic [(16 + 128) - 1:0] enq$v;
    logic enq__RDY;
    modport server (input  enq__ENA, enq$v,
                    output enq__RDY);
    modport client (output enq__ENA, enq$v,
                    input  enq__RDY);
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
//METASTART; UserTop
//METAINTERNAL; radapter_0; AdapterToBus(width=32);
//METAINTERNAL; wadapter_0; AdapterFromBus(width=32);
//METAINTERNAL; ctop; l_top;
//METACONNECT; wadapter_0$in.enq__ENA; write.enq__ENA
//METACONNECT; wadapter_0$in.enq__RDY; write.enq__RDY
//METACONNECT; read.enq__ENA; radapter_0$out.enq__ENA
//METACONNECT; read.enq__RDY; radapter_0$out.enq__RDY
//METACONNECT; ctop$request.enq__ENA; wadapter_0$out.enq__ENA
//METACONNECT; ctop$request.enq__RDY; wadapter_0$out.enq__RDY
//METACONNECT; ctop$indication.enq__ENA; radapter_0$in.enq__ENA
//METACONNECT; ctop$indication.enq__RDY; radapter_0$in.enq__RDY
`endif
