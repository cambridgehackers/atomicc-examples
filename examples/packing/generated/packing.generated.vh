`ifndef __packing_GENERATED__VH__
`define __packing_GENERATED__VH__
`include "atomicclib.vh"

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
`ifndef __PackRequest_DEF__
`define __PackRequest_DEF__
interface PackRequest;
    logic say__ENA;
    logic [32 - 1:0] say$v;
    logic [8 - 1:0] say$seqno;
    logic say__RDY;
    modport server (input  say__ENA, say$v, say$seqno,
                    output say__RDY);
    modport client (output say__ENA, say$v, say$seqno,
                    input  say__RDY);
endinterface
`endif
`ifndef __PackIndication_DEF__
`define __PackIndication_DEF__
interface PackIndication;
    logic heard__ENA;
    logic [32 - 1:0] heard$v;
    logic [8 - 1:0] heard$writeCount;
    logic [8 - 1:0] heard$readCount;
    logic [8 - 1:0] heard$seqno;
    logic heard__RDY;
    modport server (input  heard__ENA, heard$v, heard$writeCount, heard$readCount, heard$seqno,
                    output heard__RDY);
    modport client (output heard__ENA, heard$v, heard$writeCount, heard$readCount, heard$seqno,
                    input  heard__RDY);
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
//METASTART; Pack
//METAINVOKE; request$say__ENA; :indication$heard__ENA;
//METAGUARD; request$say; indication$heard__RDY;
//METASTART; l_top
//METAINTERNAL; DUT__Pack; Pack;
//METAINTERNAL; M2P__indication; ___M2PPackIndication;
//METAINTERNAL; P2M__request; ___P2MPackRequest;
//METACONNECT; DUT__Pack$indication$heard__ENA; M2P__indication$method$heard__ENA
//METACONNECT; DUT__Pack$indication$heard__RDY; M2P__indication$method$heard__RDY
//METACONNECT; DUT__Pack$request$say__ENA; P2M__request$method$say__ENA
//METACONNECT; DUT__Pack$request$say__RDY; P2M__request$method$say__RDY
//METACONNECT; request$enq__ENA; P2M__request$pipe$enq__ENA
//METACONNECT; request$enq__RDY; P2M__request$pipe$enq__RDY
//METACONNECT; indication$enq__ENA; M2P__indication$pipe$enq__ENA
//METACONNECT; indication$enq__RDY; M2P__indication$pipe$enq__RDY
//METASTART; ___M2PPackIndication
//METAINVOKE; method$heard__ENA; :pipe$enq__ENA;
//METAGUARD; method$heard; pipe$enq__RDY;
//METASTART; ___P2MPackRequest
//METAINVOKE; pipe$enq__ENA; pipe$enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0:method$say__ENA;
//METAGUARD; pipe$enq; method$say__RDY;
`endif
