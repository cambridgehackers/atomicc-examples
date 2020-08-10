`ifndef __funnel_GENERATED__VH__
`define __funnel_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __PipeIn_OC_8_DEF__
`define __PipeIn_OC_8_DEF__
interface PipeIn_OC_8#(width = 32);
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
`ifndef __PipeIn_OC_5_DEF__
`define __PipeIn_OC_5_DEF__
interface PipeIn_OC_5#(dataWidth = 32, funnelWidth = 4);
    logic enq__ENA;
    logic [dataWidth - 1:0] enq$v;
    logic enq__RDY;
    modport server (input  enq__ENA, enq$v,
                    output enq__RDY);
    modport client (output enq__ENA, enq$v,
                    input  enq__RDY);
endinterface
`endif
`ifndef __PipeIn_OC_6_DEF__
`define __PipeIn_OC_6_DEF__
interface PipeIn_OC_6#(dataWidth = 32, funnelWidth = 4);
    logic enq__ENA;
    logic [dataWidth - 1:0] enq$v;
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
`ifndef __FunnelIndication_DEF__
`define __FunnelIndication_DEF__
interface FunnelIndication;
    logic heard__ENA;
    logic [32 - 1:0] heard$v;
    logic heard__RDY;
    modport server (input  heard__ENA, heard$v,
                    output heard__RDY);
    modport client (output heard__ENA, heard$v,
                    input  heard__RDY);
endinterface
`endif
`ifndef __FunnelRequest_DEF__
`define __FunnelRequest_DEF__
interface FunnelRequest;
    logic say__ENA;
    logic [32 - 1:0] say$v;
    logic say__RDY;
    modport server (input  say__ENA, say$v,
                    output say__RDY);
    modport client (output say__ENA, say$v,
                    input  say__RDY);
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
//METASTART; FunnelTest
//METAINTERNAL; fifo0; FifoPBase(width=32);
//METAINTERNAL; fifo1; FifoPBase(width=32);
//METAINTERNAL; fifo2; FifoPBase(width=32);
//METAINTERNAL; fifo3; FifoPBase(width=32);
//METAINTERNAL; funnel; FunnelBufferedBase(funnelWidth=4,dataWidth=32);
//METAINTERNAL; result; Fifo1Base(width=32);
//METAINVOKE; request$say__ENA; :fifo$in$enq__ENA;
//METAGUARD; request$say; fifo$in$enq__RDY_or1;
//METAINVOKE; RULE$respond_rule__ENA; :indication$heard__ENA;:result$out$deq__ENA;:result$out$first;
//METAGUARD; RULE$respond_rule; result$out$first__RDY && indication$heard__RDY && result$out$deq__RDY;
//METAGUARD; RULE$init; 1;
//METARULES; RULE$respond_rule; RULE$init
//METACONNECT; funnel$out$enq__ENA; result$in$enq__ENA
//METACONNECT; funnel$out$enq__RDY; result$in$enq__RDY
//METASTART; l_top
//METAINTERNAL; DUT__FunnelTest; FunnelTest;
//METAINTERNAL; M2P__indication; ___M2PFunnelIndication;
//METAINTERNAL; P2M__request; ___P2MFunnelRequest;
//METACONNECT; DUT__FunnelTest$indication$heard__ENA; M2P__indication$method$heard__ENA
//METACONNECT; DUT__FunnelTest$indication$heard__RDY; M2P__indication$method$heard__RDY
//METACONNECT; DUT__FunnelTest$request$say__ENA; P2M__request$method$say__ENA
//METACONNECT; DUT__FunnelTest$request$say__RDY; P2M__request$method$say__RDY
//METACONNECT; request$enq__ENA; P2M__request$pipe$enq__ENA
//METACONNECT; request$enq__RDY; P2M__request$pipe$enq__RDY
//METACONNECT; indication$enq__ENA; M2P__indication$pipe$enq__ENA
//METACONNECT; indication$enq__RDY; M2P__indication$pipe$enq__RDY
//METASTART; ___M2PFunnelIndication
//METAINVOKE; method$heard__ENA; :pipe$enq__ENA;
//METAGUARD; method$heard; pipe$enq__RDY;
//METASTART; ___P2MFunnelRequest
//METAINVOKE; pipe$enq__ENA; pipe$enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0:method$say__ENA;
//METAGUARD; pipe$enq; method$say__RDY;
`endif
