`ifndef __out2int_GENERATED__VH__
`define __out2int_GENERATED__VH__
`include "atomicclib.vh"

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
//METASTART; Oin
//METAINTERNAL; first; Fifo1Base(width=32);
//METAINTERNAL; second; Fifo1Base(width=32);
//METAINTERNAL; pipe; Out2InBase(width=32);
//METAINVOKE; request.say__ENA; :first$in.enq__ENA;
//METAGUARD; request.say; first$in.enq__RDY;
//METAINVOKE; RULE$copyRule__ENA; :indication.heard__ENA;:second$out.deq__ENA;
//METAGUARD; RULE$copyRule; second$out.first__RDY && indication.heard__RDY && second$out.deq__RDY;
//METARULES; RULE$copyRule
//METACONNECT; pipe$in.deq__ENA; first$out.deq__ENA
//METACONNECT; pipe$in.deq__RDY; first$out.deq__RDY
//METACONNECT; pipe$in.first; first$out.first
//METACONNECT; pipe$in.first__RDY; first$out.first__RDY
//METACONNECT; pipe$out.enq__ENA; second$in.enq__ENA
//METACONNECT; pipe$out.enq__RDY; second$in.enq__RDY
//METASTART; l_top
//METAINTERNAL; M2P__indication; ___M2POinIndication;
//METAINTERNAL; DUT__Oin; Oin;
//METAINTERNAL; P2M__request; ___P2MOinRequest;
//METACONNECT; DUT__Oin$indication.heard__ENA; M2P__indication$method.heard__ENA
//METACONNECT; DUT__Oin$indication.heard__RDY; M2P__indication$method.heard__RDY
//METACONNECT; DUT__Oin$request.say__ENA; P2M__request$method.say__ENA
//METACONNECT; DUT__Oin$request.say__RDY; P2M__request$method.say__RDY
//METACONNECT; P2M__request$pipe.enq__ENA; request.enq__ENA
//METACONNECT; P2M__request$pipe.enq__RDY; request.enq__RDY
//METACONNECT; indication.enq__ENA; M2P__indication$pipe.enq__ENA
//METACONNECT; indication.enq__RDY; M2P__indication$pipe.enq__RDY
//METASTART; ___M2POinIndication
//METAINVOKE; method.heard__ENA; :pipe.enq__ENA;
//METAGUARD; method.heard; pipe.enq__RDY;
//METASTART; ___P2MOinRequest
//METAINVOKE; pipe.enq__ENA; pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0:method.say__ENA;
//METAGUARD; pipe.enq; method.say__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd0 );
`endif
