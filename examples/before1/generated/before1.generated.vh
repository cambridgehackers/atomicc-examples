`ifndef __before1_GENERATED__VH__
`define __before1_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __EchoRequest_DEF__
`define __EchoRequest_DEF__
interface EchoRequest;
    logic say__ENA;
    logic [32 - 1:0] say$meth;
    logic [32 - 1:0] say$v;
    logic say__RDY;
    logic say2__ENA;
    logic [32 - 1:0] say2$meth;
    logic [32 - 1:0] say2$v;
    logic say2__RDY;
    modport server (input  say__ENA, say$meth, say$v, say2__ENA, say2$meth, say2$v,
                    output say__RDY, say2__RDY);
    modport client (output say__ENA, say$meth, say$v, say2__ENA, say2$meth, say2$v,
                    input  say__RDY, say2__RDY);
endinterface
`endif
`ifndef __EchoIndication_DEF__
`define __EchoIndication_DEF__
interface EchoIndication;
    logic heard__ENA;
    logic [32 - 1:0] heard$meth;
    logic [32 - 1:0] heard$v;
    logic heard__RDY;
    modport server (input  heard__ENA, heard$meth, heard$v,
                    output heard__RDY);
    modport client (output heard__ENA, heard$meth, heard$v,
                    input  heard__RDY);
endinterface
`endif
`ifndef __Swap_DEF__
`define __Swap_DEF__
interface Swap;
    logic y2x__ENA;
    logic y2x__RDY;
    logic y2xnull__ENA;
    logic y2xnull__RDY;
    logic x2y__ENA;
    logic x2y__RDY;
    modport server (input  y2x__ENA, y2xnull__ENA, x2y__ENA,
                    output y2x__RDY, y2xnull__RDY, x2y__RDY);
    modport client (output y2x__ENA, y2xnull__ENA, x2y__ENA,
                    input  y2x__RDY, y2xnull__RDY, x2y__RDY);
endinterface
`endif
//METASTART; Connect
//METAINTERNAL; lEIO; EchoIndicationOutput;
//METAINTERNAL; lERI; EchoRequestInput;
//METAINTERNAL; lEcho; Echo;
//METAINTERNAL; lERO_test; EchoRequestOutput;
//METAINTERNAL; lEII_test; EchoIndicationInput;
//METAINVOKE; request.say__ENA; :lERO_test$request.say__ENA;
//METAGUARD; request.say; lERO_test$request.say__RDY;
//METAINVOKE; request.say2__ENA; :lERO_test$request.say2__ENA;
//METAGUARD; request.say2; lERO_test$request.say2__RDY;
//METAINVOKE; RULE$swap_rule__ENA; :lEcho$swap.x2y__ENA;:lEcho$swap.y2x__ENA;
//METAGUARD; RULE$swap_rule; lEcho$swap.x2y__RDY && lEcho$swap.y2x__RDY;
//METAINVOKE; RULE$swap2_rule__ENA; :lEcho$swap.y2xnull__ENA;
//METAGUARD; RULE$swap2_rule; lEcho$swap.y2xnull__RDY;
//METARULES; RULE$swap_rule; RULE$swap2_rule
//METACONNECT; lERI$request.say__ENA; lEcho$request.say__ENA
//METACONNECT; lERI$request.say__RDY; lEcho$request.say__RDY
//METACONNECT; lERI$request.say2__ENA; lEcho$request.say2__ENA
//METACONNECT; lERI$request.say2__RDY; lEcho$request.say2__RDY
//METACONNECT; lEIO$pipe.enq__ENA; lEII_test$pipe.enq__ENA
//METACONNECT; lEIO$pipe.enq__RDY; lEII_test$pipe.enq__RDY
//METACONNECT; lEcho$indication.heard__ENA; lEIO$indication.heard__ENA
//METACONNECT; lEcho$indication.heard__RDY; lEIO$indication.heard__RDY
//METACONNECT; lERO_test$pipe.enq__ENA; lERI$pipe.enq__ENA
//METACONNECT; lERO_test$pipe.enq__RDY; lERI$pipe.enq__RDY
//METACONNECT; indication.heard__ENA; lEII_test$indication.heard__ENA
//METACONNECT; indication.heard__RDY; lEII_test$indication.heard__RDY
//METASTART; Echo
//METAEXCLUSIVE; request.say__ENA; RULE$delay_rule__ENA; request.say2__ENA
//METAGUARD; request.say; 0 != ( busy ^ 1 );
//METAEXCLUSIVE; request.say2__ENA; RULE$delay_rule__ENA
//METAGUARD; request.say2; 0 != ( busy ^ 1 );
//METAGUARD; swap.y2x; 1;
//METAGUARD; swap.y2xnull; 1;
//METAGUARD; swap.x2y; 1;
//METAEXCLUSIVE; RULE$delay_rule__ENA; RULE$respond_rule__ENA
//METAGUARD; RULE$delay_rule; ( ( busy != 0 ) & ( busy_delay == 0 ) ) != 0;
//METAINVOKE; RULE$respond_rule__ENA; :indication.heard__ENA;
//METAGUARD; RULE$respond_rule; !( ( busy_delay == 0 ) || ( !indication.heard__RDY ) );
//METARULES; RULE$delay_rule; RULE$respond_rule
//METASTART; EchoIndicationInput
//METAEXCLUSIVE; pipe.enq__ENA; RULE$input_rule__ENA
//METAGUARD; pipe.enq; 0 != ( busy_delay ^ 1 );
//METAINVOKE; RULE$input_rule__ENA; :indication.heard__ENA;
//METAGUARD; RULE$input_rule; !( ( busy_delay == 0 ) || ( !indication.heard__RDY ) );
//METARULES; RULE$input_rule
//METASTART; EchoIndicationOutput
//METAEXCLUSIVE; indication.heard__ENA; RULE$output_rulee__ENA; RULE$output_ruleo__ENA
//METAGUARD; indication.heard; 0 != ( ind_busy ^ 1 );
//METAINVOKE; RULE$output_rulee__ENA; :pipe.enq__ENA;
//METAEXCLUSIVE; RULE$output_rulee__ENA; RULE$output_ruleo__ENA
//METAGUARD; RULE$output_rulee; !( ( ( ( ind_busy != 0 ) & ( even != 0 ) ) == 0 ) || ( !pipe.enq__RDY ) );
//METAINVOKE; RULE$output_ruleo__ENA; :pipe.enq__ENA;
//METAGUARD; RULE$output_ruleo; !( ( ( ( ind_busy != 0 ) & ( even == 0 ) ) == 0 ) || ( !pipe.enq__RDY ) );
//METARULES; RULE$output_rulee; RULE$output_ruleo
//METASTART; EchoRequestInput
//METAINVOKE; pipe.enq__ENA; temp$pipe$enq$v.tag == 2:request.say2__ENA;temp$pipe$enq$v.tag == 1:request.say__ENA;
//METAGUARD; pipe.enq; ( request.say__RDY && ( request.say2__RDY || ( !( temp$pipe$enq$v.tag == 2 ) ) ) ) || ( ( !request.say__RDY ) && ( !( ( temp$pipe$enq$v.tag == 1 ) || ( !( request.say2__RDY || ( !( temp$pipe$enq$v.tag == 2 ) ) ) ) ) ) );
//METASTART; EchoRequestOutput
//METAINVOKE; request.say__ENA; :pipe.enq__ENA;
//METAEXCLUSIVE; request.say__ENA; request.say2__ENA
//METAGUARD; request.say; pipe.enq__RDY;
//METAINVOKE; request.say2__ENA; :pipe.enq__ENA;
//METAGUARD; request.say2; pipe.enq__RDY;
`endif
