`ifndef __connect_GENERATED__VH__
`define __connect_GENERATED__VH__

//METASTART; Connect
//METAEXTERNAL; indication; EchoIndication;
//METAINTERNAL; lEIO; EchoIndicationOutput;
//METAINTERNAL; lERI; EchoRequestInput;
//METAINTERNAL; lEcho; Echo;
//METAINTERNAL; lERO_test; EchoRequestOutput;
//METAINTERNAL; lEII_test; EchoIndicationInput;
//METACONNECT; lERI$request$say__ENA; lEcho$request$say__ENA
//METACONNECT; lERI$request$say__RDY; lEcho$request$say__RDY
//METACONNECT; lEIO$pipe$enq__ENA; lEII_test$pipe$enq__ENA
//METACONNECT; lEIO$pipe$enq__RDY; lEII_test$pipe$enq__RDY
//METACONNECT; lEcho$indication$heard__ENA; lEIO$indication$heard__ENA
//METACONNECT; lEcho$indication$heard__RDY; lEIO$indication$heard__RDY
//METACONNECT; lERO_test$pipe$enq__ENA; lERI$pipe$enq__ENA
//METACONNECT; lERO_test$pipe$enq__RDY; lERI$pipe$enq__RDY
//METACONNECT; request$say__ENA; lERO_test$request$say__ENA
//METACONNECT; request$say__RDY; lERO_test$request$say__RDY
//METACONNECT; indication$heard__ENA; lEII_test$indication$heard__ENA
//METACONNECT; indication$heard__RDY; lEII_test$indication$heard__RDY
//METASTART; Echo
//METAEXTERNAL; indication; EchoIndication;
//METAINVOKE; request$say__ENA; :indication$heard__ENA;
//METAGUARD; request$say; indication$heard__RDY;
//METASTART; EchoIndicationInput
//METAEXTERNAL; indication; EchoIndication;
//METAINVOKE; pipe$enq__ENA; pipe$enq__ENA$v$tag == 1:indication$heard__ENA;
//METAGUARD; pipe$enq; indication$heard__RDY;
//METASTART; EchoIndicationOutput
//METAEXTERNAL; pipe; PipeIn.0;
//METAINVOKE; indication$heard__ENA; :pipe$enq__ENA;
//METAGUARD; indication$heard; pipe$enq__RDY;
//METASTART; EchoRequestInput
//METAEXTERNAL; request; EchoRequest;
//METAINVOKE; pipe$enq__ENA; pipe$enq__ENA$v$tag == 1:request$say__ENA;
//METAGUARD; pipe$enq; request$say__RDY;
//METASTART; EchoRequestOutput
//METAEXTERNAL; pipe; PipeIn;
//METAINVOKE; request$say__ENA; :pipe$enq__ENA;
//METAGUARD; request$say; pipe$enq__RDY;
`endif
