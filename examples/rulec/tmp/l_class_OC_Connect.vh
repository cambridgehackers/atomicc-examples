`ifndef __l_class_OC_Connect_VH__
`define __l_class_OC_Connect_VH__

`include "l_class_OC_Echo.vh"
`include "l_class_OC_EchoIndicationInput.vh"
`include "l_class_OC_EchoIndicationOutput.vh"
`include "l_class_OC_EchoRequestInput.vh"
`include "l_class_OC_EchoRequestOutput.vh"
`define l_class_OC_Connect_RULE_COUNT (0 + `l_class_OC_EchoIndicationOutput_RULE_COUNT + `l_class_OC_EchoRequestInput_RULE_COUNT + `l_class_OC_Echo_RULE_COUNT + `l_class_OC_EchoRequestOutput_RULE_COUNT + `l_class_OC_EchoIndicationInput_RULE_COUNT)

//METACONNECT; lERO_test$pipe$enq; lERI$pipe$enq
//METACONNECT; lEcho$indication$heard; lEIO$indication$heard
//METACONNECT; lEIO$pipe$enq; lEII_test$pipe$enq
//METACONNECT; lERI$request$say; lEcho$request$say
//METACONNECT; lERI$request$say2; lEcho$request$say2
//METAINTERNAL; lEIO; l_class_OC_EchoIndicationOutput;
//METAINTERNAL; lERI; l_class_OC_EchoRequestInput;
//METAINTERNAL; lEcho; l_class_OC_Echo;
//METAINTERNAL; lERO_test; l_class_OC_EchoRequestOutput;
//METAINTERNAL; lEII_test; l_class_OC_EchoIndicationInput;
`endif
