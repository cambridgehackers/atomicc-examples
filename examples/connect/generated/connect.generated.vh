`include "atomicclib.vh"

`ifndef __EchoIndication_data_DEF__
`define __EchoIndication_data_DEF__
typedef struct packed {
    _IC_anonymous_AC_struct_JC__KD__KD_EchoIndication_PF_union data;
    logic [32 - 1:0] tag;
} EchoIndication_data;
`endif
`ifndef __EchoRequest_data_DEF__
`define __EchoRequest_data_DEF__
typedef struct packed {
    _IC_anonymous_AC_struct_JC__KD__KD_EchoRequest_PF_union data;
    logic [32 - 1:0] tag;
} EchoRequest_data;
`endif
`ifndef __ValueType_DEF__
`define __ValueType_DEF__
typedef struct packed {
    logic [32 - 1:0] b;
    logic [32 - 1:0] a;
} ValueType;
`endif
`ifndef ___IC_anonymous_AC_struct_JC__KD__KD_EchoIndication_PF_union_DEF__
`define ___IC_anonymous_AC_struct_JC__KD__KD_EchoIndication_PF_union_DEF__
typedef struct packed {
    _IC_anonymous_AC_struct_JC__KD__KD_EchoIndication_PF_union_KD__KD_EchoIndication_PF_heard heard;
} _IC_anonymous_AC_struct_JC__KD__KD_EchoIndication_PF_union;
`endif
`ifndef ___IC_anonymous_AC_struct_JC__KD__KD_EchoIndication_PF_union_KD__KD_EchoIndication_PF_heard_DEF__
`define ___IC_anonymous_AC_struct_JC__KD__KD_EchoIndication_PF_union_KD__KD_EchoIndication_PF_heard_DEF__
typedef struct packed {
    logic [32 - 1:0] v;
    logic [32 - 1:0] meth;
} _IC_anonymous_AC_struct_JC__KD__KD_EchoIndication_PF_union_KD__KD_EchoIndication_PF_heard;
`endif
`ifndef ___IC_anonymous_AC_struct_JC__KD__KD_EchoRequest_PF_union_DEF__
`define ___IC_anonymous_AC_struct_JC__KD__KD_EchoRequest_PF_union_DEF__
typedef struct packed {
    _IC_anonymous_AC_struct_JC__KD__KD_EchoRequest_PF_union_KD__KD_EchoRequest_PF_say say;
} _IC_anonymous_AC_struct_JC__KD__KD_EchoRequest_PF_union;
`endif
`ifndef ___IC_anonymous_AC_struct_JC__KD__KD_EchoRequest_PF_union_KD__KD_EchoRequest_PF_say_DEF__
`define ___IC_anonymous_AC_struct_JC__KD__KD_EchoRequest_PF_union_KD__KD_EchoRequest_PF_say_DEF__
typedef struct packed {
    logic [32 - 1:0] v;
    logic [32 - 1:0] meth;
} _IC_anonymous_AC_struct_JC__KD__KD_EchoRequest_PF_union_KD__KD_EchoRequest_PF_say;
`endif
//METASTART; Connect
//METAINTERNAL; lEIO; EchoIndicationOutput;
//METAINTERNAL; lERI; EchoRequestInput;
//METAINTERNAL; lEcho; Echo;
//METAINTERNAL; lERO_test; EchoRequestOutput;
//METAINTERNAL; lEII_test; EchoIndicationInput;
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
//METAINVOKE; pipe.enq__ENA; _pipe$enq$temp$v.tag == 1:indication.heard__ENA;
//METAGUARD; pipe.enq; indication.heard__RDY || ( _pipe$enq$temp$v.tag != 1 );
//METASTART; EchoIndicationOutput
//METAINVOKE; indication.heard__ENA; :pipe.enq__ENA;
//METAGUARD; indication.heard; pipe.enq__RDY;
//METASTART; EchoRequestInput
//METAINVOKE; pipe.enq__ENA; _pipe$enq$temp$v.tag == 1:request.say__ENA;
//METAGUARD; pipe.enq; request.say__RDY || ( _pipe$enq$temp$v.tag != 1 );
//METASTART; EchoRequestOutput
//METAINVOKE; request.say__ENA; :pipe.enq__ENA;
//METAGUARD; request.say; pipe.enq__RDY;
