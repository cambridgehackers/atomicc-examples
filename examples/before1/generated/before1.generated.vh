`ifndef __EchoIndication_data_DEF__
`ifndef YOSYS
`define __EchoIndication_data_DEF__
`endif // YOSYS
typedef struct packed {
    _IC_anonymous_AC_struct_JC__KD__KD_EchoIndication_PF_union data;
    logic [32 - 1:0] tag;
} EchoIndication_data;
typedef struct packed {
    _IC_anonymous_AC_struct_JC__KD__KD_EchoRequest_PF_union data;
    logic [32 - 1:0] tag;
} EchoRequest_data;
typedef struct packed {
    _IC_anonymous_AC_struct_JC__KD__KD_EchoIndication_PF_union_KD__KD_EchoIndication_PF_heard heard;
} _IC_anonymous_AC_struct_JC__KD__KD_EchoIndication_PF_union;
typedef struct packed {
    logic [32 - 1:0] v;
    logic [32 - 1:0] meth;
} _IC_anonymous_AC_struct_JC__KD__KD_EchoIndication_PF_union_KD__KD_EchoIndication_PF_heard;
typedef struct packed {
    _IC_anonymous_AC_struct_JC__KD__KD_EchoRequest_PF_union_KD__KD_EchoRequest_PF_say2 say2;
    _IC_anonymous_AC_struct_JC__KD__KD_EchoRequest_PF_union_KD__KD_EchoRequest_PF_say say;
} _IC_anonymous_AC_struct_JC__KD__KD_EchoRequest_PF_union;
typedef struct packed {
    logic [32 - 1:0] v;
    logic [32 - 1:0] meth;
} _IC_anonymous_AC_struct_JC__KD__KD_EchoRequest_PF_union_KD__KD_EchoRequest_PF_say;
typedef struct packed {
    logic [32 - 1:0] v2;
    logic [32 - 1:0] v;
    logic [32 - 1:0] meth;
} _IC_anonymous_AC_struct_JC__KD__KD_EchoRequest_PF_union_KD__KD_EchoRequest_PF_say2;
`endif
