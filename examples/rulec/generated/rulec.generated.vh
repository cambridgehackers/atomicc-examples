`ifndef __rulec_GENERATED__VH__
`define __rulec_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __EchoRequest_DEF__
`define __EchoRequest_DEF__
interface EchoRequest;
    logic say__ENA;
    logic [32 - 1:0] say$v;
    logic say__RDY;
    logic say2__ENA;
    logic [16 - 1:0] say2$a;
    logic [16 - 1:0] say2$b;
    logic say2__RDY;
    logic setLeds__ENA;
    logic [8 - 1:0] setLeds$v;
    logic setLeds__RDY;
    modport server (input  say__ENA, say$v, say2__ENA, say2$a, say2$b, setLeds__ENA, setLeds$v,
                    output say__RDY, say2__RDY, setLeds__RDY);
    modport client (output say__ENA, say$v, say2__ENA, say2$a, say2$b, setLeds__ENA, setLeds$v,
                    input  say__RDY, say2__RDY, setLeds__RDY);
endinterface
`endif
`ifndef __EchoIndication_DEF__
`define __EchoIndication_DEF__
interface EchoIndication;
    logic heard__ENA;
    logic [32 - 1:0] heard$v;
    logic heard__RDY;
    logic heard2__ENA;
    logic [16 - 1:0] heard2$a;
    logic [16 - 1:0] heard2$b;
    logic heard2__RDY;
    logic heard3__ENA;
    logic [16 - 1:0] heard3$a;
    logic [32 - 1:0] heard3$b;
    logic [32 - 1:0] heard3$c;
    logic [16 - 1:0] heard3$d;
    logic heard3__RDY;
    modport server (input  heard__ENA, heard$v, heard2__ENA, heard2$a, heard2$b, heard3__ENA, heard3$a, heard3$b, heard3$c, heard3$d,
                    output heard__RDY, heard2__RDY, heard3__RDY);
    modport client (output heard__ENA, heard$v, heard2__ENA, heard2$a, heard2$b, heard3__ENA, heard3$a, heard3$b, heard3$c, heard3$d,
                    input  heard__RDY, heard2__RDY, heard3__RDY);
endinterface
`endif
//METASTART; Echo
//METAEXCLUSIVE; request.say__ENA; RULE$delay_rule__ENA; request.say2__ENA
//METAGUARD; request.say; 0 != ( ( busy != 0 ) ^ 1 );
//METAEXCLUSIVE; request.say2__ENA; RULE$delay_rule__ENA
//METAGUARD; request.say2; 0 != ( ( busy != 0 ) ^ 1 );
//METAGUARD; request.setLeds; 1'd1;
//METAEXCLUSIVE; RULE$delay_rule__ENA; RULE$respond_rule__ENA
//METAGUARD; RULE$delay_rule; ( ( busy != 0 ) & ( busy_delay == 0 ) ) != 0;
//METAINVOKE; RULE$respond_rule__ENA; v_type != 1:indication.heard2__ENA;v_type == 1:indication.heard__ENA;
//METABEFORE; RULE$respond_rule__ENA; :RULE$delay_rule__ENA
//METAGUARD; RULE$respond_rule; busy_delay && ( ( indication.heard__RDY && ( ( v_type == 1 ) || indication.heard2__RDY ) ) || ( ( !indication.heard__RDY ) && ( v_type != 1 ) && indication.heard2__RDY ) );
//METARULES; RULE$delay_rule; RULE$respond_rule
//METASTART; l_top
//METAINTERNAL; M2P__indication; ___M2PEchoIndication;
//METAINTERNAL; DUT__Echo; Echo;
//METAINTERNAL; P2M__request; ___P2MEchoRequest;
//METACONNECT; DUT__Echo$indication.heard__ENA; M2P__indication$method.heard__ENA
//METACONNECT; DUT__Echo$indication.heard__RDY; M2P__indication$method.heard__RDY
//METACONNECT; DUT__Echo$indication.heard2__ENA; M2P__indication$method.heard2__ENA
//METACONNECT; DUT__Echo$indication.heard2__RDY; M2P__indication$method.heard2__RDY
//METACONNECT; DUT__Echo$indication.heard3__ENA; M2P__indication$method.heard3__ENA
//METACONNECT; DUT__Echo$indication.heard3__RDY; M2P__indication$method.heard3__RDY
//METACONNECT; DUT__Echo$request.say__ENA; P2M__request$method.say__ENA
//METACONNECT; DUT__Echo$request.say__RDY; P2M__request$method.say__RDY
//METACONNECT; DUT__Echo$request.say2__ENA; P2M__request$method.say2__ENA
//METACONNECT; DUT__Echo$request.say2__RDY; P2M__request$method.say2__RDY
//METACONNECT; DUT__Echo$request.setLeds__ENA; P2M__request$method.setLeds__ENA
//METACONNECT; DUT__Echo$request.setLeds__RDY; P2M__request$method.setLeds__RDY
//METACONNECT; P2M__request$pipe.enq__ENA; request.enq__ENA
//METACONNECT; P2M__request$pipe.enq__RDY; request.enq__RDY
//METACONNECT; indication.enq__ENA; M2P__indication$pipe.enq__ENA
//METACONNECT; indication.enq__RDY; M2P__indication$pipe.enq__RDY
//METASTART; ___M2PEchoIndication
//METAINVOKE; method.heard__ENA; :pipe.enq__ENA;
//METAEXCLUSIVE; method.heard__ENA; method.heard2__ENA; method.heard3__ENA
//METAGUARD; method.heard; pipe.enq__RDY;
//METAINVOKE; method.heard2__ENA; :pipe.enq__ENA;
//METAEXCLUSIVE; method.heard2__ENA; method.heard3__ENA
//METAGUARD; method.heard2; pipe.enq__RDY;
//METAINVOKE; method.heard3__ENA; :pipe.enq__ENA;
//METAGUARD; method.heard3; pipe.enq__RDY;
//METASTART; ___P2MEchoRequest
//METAINVOKE; pipe.enq__ENA; pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd1:method.say2__ENA;pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0:method.say__ENA;pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd2:method.setLeds__ENA;
//METAGUARD; pipe.enq; ( method.say__RDY && ( ( method.say2__RDY && ( method.setLeds__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd2 ) ) ) || ( ( !method.say2__RDY ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd1 ) && ( method.setLeds__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd2 ) ) ) ) ) || ( ( !method.say__RDY ) && ( ( !method.say2__RDY ) || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd0 ) && ( method.setLeds__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd2 ) ) ) ) && ( method.say2__RDY || ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd1 ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd0 ) && ( method.setLeds__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd2 ) ) ) ) );
`endif
