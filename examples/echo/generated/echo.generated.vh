`ifndef __echo_GENERATED__VH__
`define __echo_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __EchoRequest_DEF__
`define __EchoRequest_DEF__
interface EchoRequest;
    logic say__ENA;
    logic [32 - 1:0] say$v;
    logic say__RDY;
    logic setup__ENA;
    logic [16 - 1:0] setup$ahEnd;
    logic [16 - 1:0] setup$ahFrontEnd;
    logic [8 - 1:0] setup$ahBackSync;
    logic [8 - 1:0] setup$ahSyncWidth;
    logic [16 - 1:0] setup$avEnd;
    logic [16 - 1:0] setup$avFrontEnd;
    logic [8 - 1:0] setup$avBackSync;
    logic [8 - 1:0] setup$avSyncWidth;
    logic setup__RDY;
    modport server (input  say__ENA, say$v, setup__ENA, setup$ahEnd, setup$ahFrontEnd, setup$ahBackSync, setup$ahSyncWidth, setup$avEnd, setup$avFrontEnd, setup$avBackSync, setup$avSyncWidth,
                    output say__RDY, setup__RDY);
    modport client (output say__ENA, say$v, setup__ENA, setup$ahEnd, setup$ahFrontEnd, setup$ahBackSync, setup$ahSyncWidth, setup$avEnd, setup$avFrontEnd, setup$avBackSync, setup$avSyncWidth,
                    input  say__RDY, setup__RDY);
endinterface
`endif
`ifndef __EchoIndication_DEF__
`define __EchoIndication_DEF__
interface EchoIndication;
    logic heard__ENA;
    logic [32 - 1:0] heard$v;
    logic heard__RDY;
    logic heards__ENA;
    logic [16 - 1:0] heards$ahEnd;
    logic [16 - 1:0] heards$ahFrontEnd;
    logic [8 - 1:0] heards$ahBackSync;
    logic [8 - 1:0] heards$ahSyncWidth;
    logic [16 - 1:0] heards$avEnd;
    logic [16 - 1:0] heards$avFrontEnd;
    logic [8 - 1:0] heards$avBackSync;
    logic [8 - 1:0] heards$avSyncWidth;
    logic heards__RDY;
    modport server (input  heard__ENA, heard$v, heards__ENA, heards$ahEnd, heards$ahFrontEnd, heards$ahBackSync, heards$ahSyncWidth, heards$avEnd, heards$avFrontEnd, heards$avBackSync, heards$avSyncWidth,
                    output heard__RDY, heards__RDY);
    modport client (output heard__ENA, heard$v, heards__ENA, heards$ahEnd, heards$ahFrontEnd, heards$ahBackSync, heards$ahSyncWidth, heards$avEnd, heards$avFrontEnd, heards$avBackSync, heards$avSyncWidth,
                    input  heard__RDY, heards__RDY);
endinterface
`endif
//METASTART; Echo
//METAINTERNAL; fifo; Fifo1Base(width=32);
//METAINVOKE; sout.say__ENA; :fifo$in.enq__ENA;
//METAGUARD; sout.say; fifo$in.enq__RDY;
//METAINVOKE; sout.setup__ENA; :ind.heards__ENA;
//METAGUARD; sout.setup; ind.heards__RDY;
//METAINVOKE; RULE$respond_rule__ENA; :fifo$out.deq__ENA;:ind.heard__ENA;
//METAGUARD; RULE$respond_rule; fifo$out.deq__RDY && fifo$out.first__RDY && ind.heard__RDY;
//METARULES; RULE$respond_rule
//METASTART; l_top
//METAINTERNAL; M2P__ind; ___M2PEchoIndication;
//METAINTERNAL; DUT__Echo; Echo;
//METAINTERNAL; P2M__sout; ___P2MEchoRequest;
//METACONNECT; DUT__Echo$ind.heard__ENA; M2P__ind$method.heard__ENA
//METACONNECT; DUT__Echo$ind.heard__RDY; M2P__ind$method.heard__RDY
//METACONNECT; DUT__Echo$ind.heards__ENA; M2P__ind$method.heards__ENA
//METACONNECT; DUT__Echo$ind.heards__RDY; M2P__ind$method.heards__RDY
//METACONNECT; DUT__Echo$sout.say__ENA; P2M__sout$method.say__ENA
//METACONNECT; DUT__Echo$sout.say__RDY; P2M__sout$method.say__RDY
//METACONNECT; DUT__Echo$sout.setup__ENA; P2M__sout$method.setup__ENA
//METACONNECT; DUT__Echo$sout.setup__RDY; P2M__sout$method.setup__RDY
//METACONNECT; P2M__sout$pipe.enq__ENA; request.enq__ENA
//METACONNECT; P2M__sout$pipe.enq__RDY; request.enq__RDY
//METACONNECT; indication.enq__ENA; M2P__ind$pipe.enq__ENA
//METACONNECT; indication.enq__RDY; M2P__ind$pipe.enq__RDY
//METASTART; ___M2PEchoIndication
//METAINVOKE; method.heard__ENA; :pipe.enq__ENA;
//METAEXCLUSIVE; method.heard__ENA; method.heards__ENA
//METAGUARD; method.heard; pipe.enq__RDY;
//METAINVOKE; method.heards__ENA; :pipe.enq__ENA;
//METAGUARD; method.heards; pipe.enq__RDY;
//METASTART; ___P2MEchoRequest
//METAINVOKE; pipe.enq__ENA; pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0:method.say__ENA;pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd1:method.setup__ENA;
//METAGUARD; pipe.enq; ( method.say__RDY && ( method.setup__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd1 ) ) ) || ( ( !method.say__RDY ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd0 ) && ( method.setup__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd1 ) ) );
`endif
