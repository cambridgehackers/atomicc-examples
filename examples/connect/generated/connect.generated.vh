`ifndef __connect_GENERATED__VH__
`define __connect_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __EchoIndication_data_DEF__
`define __EchoIndication_data_DEF__
typedef struct packed {
    logic [(32 + 32) - 1:0] data;
    logic [32 - 1:0] tag;
} EchoIndication_data;
`endif
`ifndef __EchoRequest_data_DEF__
`define __EchoRequest_data_DEF__
typedef struct packed {
    logic [(32 + 32) - 1:0] data;
    logic [32 - 1:0] tag;
} EchoRequest_data;
`endif
`ifndef __NOCDataH_DEF__
`define __NOCDataH_DEF__
typedef struct packed {
    logic [128 - 1:0] data;
    logic [16 - 1:0] length;
} NOCDataH;
`endif
`ifndef __ValueType_DEF__
`define __ValueType_DEF__
typedef struct packed {
    logic [32 - 1:0] b;
    logic [32 - 1:0] a;
} ValueType;
`endif
`ifndef ___IC_anonymous_AC_struct_JC__KD__KD_EchoIndication_union_DEF__
`define ___IC_anonymous_AC_struct_JC__KD__KD_EchoIndication_union_DEF__
typedef struct packed {
    logic [(32 + 32) - 1:0] heard;
} _IC_anonymous_AC_struct_JC__KD__KD_EchoIndication_union;
`endif
`ifndef ___IC_anonymous_AC_struct_JC__KD__KD_EchoIndication_union_KD__KD_EchoIndication_heard_DEF__
`define ___IC_anonymous_AC_struct_JC__KD__KD_EchoIndication_union_KD__KD_EchoIndication_heard_DEF__
typedef struct packed {
    logic [32 - 1:0] v;
    logic [32 - 1:0] meth;
} _IC_anonymous_AC_struct_JC__KD__KD_EchoIndication_union_KD__KD_EchoIndication_heard;
`endif
`ifndef ___IC_anonymous_AC_struct_JC__KD__KD_EchoRequest_union_DEF__
`define ___IC_anonymous_AC_struct_JC__KD__KD_EchoRequest_union_DEF__
typedef struct packed {
    logic [(32 + 32) - 1:0] say;
} _IC_anonymous_AC_struct_JC__KD__KD_EchoRequest_union;
`endif
`ifndef ___IC_anonymous_AC_struct_JC__KD__KD_EchoRequest_union_KD__KD_EchoRequest_say_DEF__
`define ___IC_anonymous_AC_struct_JC__KD__KD_EchoRequest_union_KD__KD_EchoRequest_say_DEF__
typedef struct packed {
    logic [32 - 1:0] v;
    logic [32 - 1:0] meth;
} _IC_anonymous_AC_struct_JC__KD__KD_EchoRequest_union_KD__KD_EchoRequest_say;
`endif
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
`ifndef __PipeIn_OC_3_DEF__
`define __PipeIn_OC_3_DEF__
interface PipeIn_OC_3;
    logic enq__ENA;
    logic [(32 + (32 + 32)) - 1:0] enq$v;
    logic enq__RDY;
    modport server (input  enq__ENA, enq$v,
                    output enq__RDY);
    modport client (output enq__ENA, enq$v,
                    input  enq__RDY);
endinterface
`endif
`ifndef __PipeIn_OC_2_DEF__
`define __PipeIn_OC_2_DEF__
interface PipeIn_OC_2;
    logic enq__ENA;
    logic [(32 + (32 + 32)) - 1:0] enq$v;
    logic enq__RDY;
    modport server (input  enq__ENA, enq$v,
                    output enq__RDY);
    modport client (output enq__ENA, enq$v,
                    input  enq__RDY);
endinterface
`endif
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
//METASTART; Connect
//METAINTERNAL; lEIO; EchoIndicationOutput;
//METAINTERNAL; lERI; EchoRequestInput;
//METAINTERNAL; lEcho; Echo;
//METAINTERNAL; lERO_test; EchoRequestOutput;
//METAINTERNAL; lEII_test; EchoIndicationInput;
//METAGUARD; RULE$connectRule; 1;
//METARULES; RULE$connectRule
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
//METAINVOKE; request$say__ENA; :indication$heard__ENA;
//METAGUARD; request$say; indication$heard__RDY;
//METASTART; EchoIndicationInput
//METAINVOKE; pipe$enq__ENA; pipe$enq$v$tag == 1:indication$heard__ENA;
//METAGUARD; pipe$enq; indication$heard__RDY || ( !( pipe$enq$v$tag == 1 ) );
//METASTART; EchoIndicationOutput
//METAINVOKE; indication$heard__ENA; :pipe$enq__ENA;
//METAGUARD; indication$heard; pipe$enq__RDY;
//METASTART; EchoRequestInput
//METAINVOKE; pipe$enq__ENA; pipe$enq$v$tag == 1:request$say__ENA;
//METAGUARD; pipe$enq; request$say__RDY || ( !( pipe$enq$v$tag == 1 ) );
//METASTART; EchoRequestOutput
//METAINVOKE; request$say__ENA; :pipe$enq__ENA;
//METAGUARD; request$say; pipe$enq__RDY;
`endif
