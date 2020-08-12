`ifndef __out2int_GENERATED__VH__
`define __out2int_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __NOCDataH_DEF__
`define __NOCDataH_DEF__
typedef struct packed {
    logic [128 - 1:0] data;
    logic [16 - 1:0] length;
} NOCDataH;
`endif
`ifndef __PipeIn_OC_2_DEF__
`define __PipeIn_OC_2_DEF__
interface PipeIn_OC_2#(width = 32);
    logic enq__ENA;
    logic [width - 1:0] enq$v;
    logic enq__RDY;
    modport server (input  enq__ENA, enq$v,
                    output enq__RDY);
    modport client (output enq__ENA, enq$v,
                    input  enq__RDY);
endinterface
`endif
`ifndef __PipeOut_DEF__
`define __PipeOut_DEF__
interface PipeOut#(width = 32);
    logic deq__ENA;
    logic deq__RDY;
    logic first;
    logic first__RDY;
    modport server (input  deq__ENA, first,
                    output deq__RDY, first__RDY);
    modport client (output deq__ENA, first,
                    input  deq__RDY, first__RDY);
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
`ifndef __OinRequest_DEF__
`define __OinRequest_DEF__
interface OinRequest;
    logic say__ENA;
    logic [32 - 1:0] say$v;
    logic say__RDY;
    modport server (input  say__ENA, say$v,
                    output say__RDY);
    modport client (output say__ENA, say$v,
                    input  say__RDY);
endinterface
`endif
`ifndef __OinIndication_DEF__
`define __OinIndication_DEF__
interface OinIndication;
    logic heard__ENA;
    logic [32 - 1:0] heard$v;
    logic heard__RDY;
    modport server (input  heard__ENA, heard$v,
                    output heard__RDY);
    modport client (output heard__ENA, heard$v,
                    input  heard__RDY);
endinterface
`endif
`ifndef __PipeOut_OC_6_DEF__
`define __PipeOut_OC_6_DEF__
interface PipeOut_OC_6#(width = 32);
    logic deq__ENA;
    logic deq__RDY;
    logic first;
    logic first__RDY;
    modport server (input  deq__ENA, first,
                    output deq__RDY, first__RDY);
    modport client (output deq__ENA, first,
                    input  deq__RDY, first__RDY);
endinterface
`endif
`ifndef __PipeIn_OC_7_DEF__
`define __PipeIn_OC_7_DEF__
interface PipeIn_OC_7#(width = 32);
    logic enq__ENA;
    logic [width - 1:0] enq$v;
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
//METASTART; Oin
//METAINTERNAL; first; Fifo1Base(width=32);
//METAINTERNAL; second; Fifo1Base(width=32);
//METAINTERNAL; pipe; Out2InBase(width=32);
//METAINVOKE; request$say__ENA; :first$in$enq__ENA;
//METAGUARD; request$say; first$in$enq__RDY;
//METAINVOKE; RULE$copyRule__ENA; :indication$heard__ENA;:second$out$deq__ENA;:second$out$first;
//METAGUARD; RULE$copyRule; second$out$first__RDY && indication$heard__RDY && second$out$deq__RDY;
//METARULES; RULE$copyRule
//METACONNECT; pipe$in$deq__ENA; first$out$deq__ENA
//METACONNECT; pipe$in$deq__RDY; first$out$deq__RDY
//METACONNECT; pipe$in$first; first$out$first
//METACONNECT; pipe$in$first__RDY; first$out$first__RDY
//METACONNECT; pipe$out$enq__ENA; second$in$enq__ENA
//METACONNECT; pipe$out$enq__RDY; second$in$enq__RDY
//METASTART; l_top
//METAINTERNAL; DUT__Oin; Oin;
//METAINTERNAL; M2P__indication; ___M2POinIndication;
//METAINTERNAL; P2M__request; ___P2MOinRequest;
//METACONNECT; DUT__Oin$indication$heard__ENA; M2P__indication$method$heard__ENA
//METACONNECT; DUT__Oin$indication$heard__RDY; M2P__indication$method$heard__RDY
//METACONNECT; DUT__Oin$request$say__ENA; P2M__request$method$say__ENA
//METACONNECT; DUT__Oin$request$say__RDY; P2M__request$method$say__RDY
//METACONNECT; request$enq__ENA; P2M__request$pipe$enq__ENA
//METACONNECT; request$enq__RDY; P2M__request$pipe$enq__RDY
//METACONNECT; indication$enq__ENA; M2P__indication$pipe$enq__ENA
//METACONNECT; indication$enq__RDY; M2P__indication$pipe$enq__RDY
//METASTART; ___M2POinIndication
//METAINVOKE; method$heard__ENA; :pipe$enq__ENA;
//METAGUARD; method$heard; pipe$enq__RDY;
//METASTART; ___P2MOinRequest
//METAINVOKE; pipe$enq__ENA; pipe$enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0:method$say__ENA;
//METAGUARD; pipe$enq; method$say__RDY;
`endif
