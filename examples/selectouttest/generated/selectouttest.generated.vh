`ifndef __selectouttest_GENERATED__VH__
`define __selectouttest_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __SelectOutRequest_DEF__
`define __SelectOutRequest_DEF__
interface SelectOutRequest;
    logic say__ENA;
    logic [32 - 1:0] say$v;
    logic say__RDY;
    modport server (input  say__ENA, say$v,
                    output say__RDY);
    modport client (output say__ENA, say$v,
                    input  say__RDY);
endinterface
`endif
`ifndef __SelectOutIndication_DEF__
`define __SelectOutIndication_DEF__
interface SelectOutIndication;
    logic heard__ENA;
    logic [8 - 1:0] heard$rindex;
    logic [32 - 1:0] heard$v;
    logic heard__RDY;
    modport server (input  heard__ENA, heard$rindex, heard$v,
                    output heard__RDY);
    modport client (output heard__ENA, heard$rindex, heard$v,
                    input  heard__RDY);
endinterface
`endif
//METASTART; SelectOutTest
//METAINTERNAL; fifo0; Fifo1Base(width=32);
//METAINTERNAL; fifo1; Fifo1Base(width=32);
//METAINTERNAL; fifo2; Fifo1Base(width=32);
//METAINTERNAL; fifo3; Fifo1Base(width=32);
//METAINTERNAL; funnel; SelectOut(funnelWidth=4,width=32);
//METAINVOKE; request.say__ENA; :fifo$in[__inst$Genvar1].enq__ENA;
//METAGUARD; request.say; fifo$in__enq__RDY_or1;
//METAINVOKE; RULE$respondRule__ENA; :funnel$out.deq__ENA;:indication.heard__ENA;
//METAGUARD; RULE$respondRule; funnel$out.first__RDY && indication.heard__RDY && funnel$out.deq__RDY;
//METAINVOKE; RULE$rotateRule__ENA; :funnel$select__ENA;
//METAGUARD; RULE$rotateRule; funnel$select__RDY;
//METAGUARD; RULE$init; 1'd1;
//METARULES; RULE$respondRule; RULE$rotateRule; RULE$init
//METASTART; l_top
//METAINTERNAL; M2P__indication; ___M2PSelectOutIndication;
//METAINTERNAL; DUT__SelectOutTest; SelectOutTest;
//METAINTERNAL; P2M__request; ___P2MSelectOutRequest;
//METACONNECT; DUT__SelectOutTest$indication.heard__ENA; M2P__indication$method.heard__ENA
//METACONNECT; DUT__SelectOutTest$indication.heard__RDY; M2P__indication$method.heard__RDY
//METACONNECT; DUT__SelectOutTest$request.say__ENA; P2M__request$method.say__ENA
//METACONNECT; DUT__SelectOutTest$request.say__RDY; P2M__request$method.say__RDY
//METACONNECT; P2M__request$pipe.enq__ENA; request.enq__ENA
//METACONNECT; P2M__request$pipe.enq__RDY; request.enq__RDY
//METACONNECT; indication.enq__ENA; M2P__indication$pipe.enq__ENA
//METACONNECT; indication.enq__RDY; M2P__indication$pipe.enq__RDY
//METASTART; ___M2PSelectOutIndication
//METAINVOKE; method.heard__ENA; :pipe.enq__ENA;
//METAGUARD; method.heard; pipe.enq__RDY;
//METASTART; ___P2MSelectOutRequest
//METAINVOKE; pipe.enq__ENA; pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0:method.say__ENA;
//METAGUARD; pipe.enq; method.say__RDY || ( !( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0 ) );
`endif
