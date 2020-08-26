`ifndef __connect_GENERATED__VH__
`define __connect_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __EchoRequest_DEF__
`define __EchoRequest_DEF__
interface EchoRequest;
    logic say__ENA;
    logic [32 - 1:0] say$meth;
    logic [32 - 1:0] say$v;
    logic say__RDY;
    modport server (input  say__ENA, say$meth, say$v,
                    output say__RDY);
    modport client (output say__ENA, say$meth, say$v,
                    input  say__RDY);
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
//METASTART; Connect
//METAINTERNAL; lEIO; EchoIndicationOutput;
//METAINTERNAL; lERI; EchoRequestInput;
//METAINTERNAL; lEcho; Echo;
//METAINTERNAL; lERO_test; EchoRequestOutput;
//METAINTERNAL; lEII_test; EchoIndicationInput;
//METAGUARD; RULE$connectRule; 1;
//METARULES; RULE$connectRule
//METACONNECT; lERI$request.say__ENA; lEcho$request.say__ENA
//METACONNECT; lERI$request.say__RDY; lEcho$request.say__RDY
//METACONNECT; lEIO$pipe.enq__ENA; lEII_test$pipe.enq__ENA
//METACONNECT; lEIO$pipe.enq__RDY; lEII_test$pipe.enq__RDY
//METACONNECT; lEcho$indication.heard__ENA; lEIO$indication.heard__ENA
//METACONNECT; lEcho$indication.heard__RDY; lEIO$indication.heard__RDY
//METACONNECT; lERO_test$pipe.enq__ENA; lERI$pipe.enq__ENA
//METACONNECT; lERO_test$pipe.enq__RDY; lERI$pipe.enq__RDY
//METACONNECT; request.say__ENA; lERO_test$request.say__ENA
//METACONNECT; request.say__RDY; lERO_test$request.say__RDY
//METACONNECT; indication.heard__ENA; lEII_test$indication.heard__ENA
//METACONNECT; indication.heard__RDY; lEII_test$indication.heard__RDY
//METASTART; Echo
//METAINVOKE; request.say__ENA; :indication.heard__ENA;
//METAGUARD; request.say; indication.heard__RDY;
//METASTART; EchoIndicationInput
//METAINVOKE; pipe.enq__ENA; pipe.enq$v$tag == 1:indication.heard__ENA;
//METAGUARD; pipe.enq; indication.heard__RDY || ( !( pipe.enq$v$tag == 1 ) );
//METASTART; EchoIndicationOutput
//METAINVOKE; indication.heard__ENA; :pipe.enq__ENA;
//METAGUARD; indication.heard; pipe.enq__RDY;
//METASTART; EchoRequestInput
//METAINVOKE; pipe.enq__ENA; pipe.enq$v$tag == 1:request.say__ENA;
//METAGUARD; pipe.enq; request.say__RDY || ( !( pipe.enq$v$tag == 1 ) );
//METASTART; EchoRequestOutput
//METAINVOKE; request.say__ENA; :pipe.enq__ENA;
//METAGUARD; request.say; pipe.enq__RDY;
`endif
