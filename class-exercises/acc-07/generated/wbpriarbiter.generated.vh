`ifndef __wbpriarbiter_GENERATED__VH__
`define __wbpriarbiter_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __WishboneRequestType_DEF__
`define __WishboneRequestType_DEF__
interface WishboneRequestType;
    logic  cyc;
    logic stb__ENA;
    logic  stb$we;
    logic [32 - 1:0] stb$addr;
    logic [32 - 1:0] stb$data;
    logic [(32 / 8) - 1:0] stb$sel;
    logic stb__RDY;
    modport server (input  cyc, stb__ENA, stb$we, stb$addr, stb$data, stb$sel,
                    output stb__RDY);
    modport client (output cyc, stb__ENA, stb$we, stb$addr, stb$data, stb$sel,
                    input  stb__RDY);
endinterface
`endif
`ifndef __WishboneStatusType_DEF__
`define __WishboneStatusType_DEF__
interface WishboneStatusType;
    logic  ack;
    logic ack__RDY;
    logic  stall;
    logic stall__RDY;
    logic  err;
    logic err__RDY;
    modport server (output ack, ack__RDY, stall, stall__RDY, err, err__RDY);
    modport client (input  ack, ack__RDY, stall, stall__RDY, err, err__RDY);
endinterface
`endif
`ifndef __FwbSlaveIfc_DEF__
`define __FwbSlaveIfc_DEF__
interface FwbSlaveIfc;
    logic [(32 / 8) - 1:0] f_nreqs;
    logic f_nreqs__RDY;
    logic [(32 / 8) - 1:0] f_nacks;
    logic f_nacks__RDY;
    logic [(32 / 8) - 1:0] f_outstanding;
    logic f_outstanding__RDY;
    modport server (output f_nreqs, f_nreqs__RDY, f_nacks, f_nacks__RDY, f_outstanding, f_outstanding__RDY);
    modport client (input  f_nreqs, f_nreqs__RDY, f_nacks, f_nacks__RDY, f_outstanding, f_outstanding__RDY);
endinterface
`endif
`ifndef __WishboneType_DEF__
`define __WishboneType_DEF__
interface WishboneType#(F_OPT_CLK2FFLOGIC = 1, OPT_ZERO_ON_IDLE = 0);
    logic  cyc;
    logic stb__ENA;
    logic  stb$we;
    logic [32 - 1:0] stb$addr;
    logic [32 - 1:0] stb$data;
    logic [32/8 - 1:0] stb$sel;
    logic stb__RDY;
    logic  ack;
    logic ack__RDY;
    logic  stall;
    logic stall__RDY;
    logic  err;
    logic err__RDY;
    modport server (input  cyc, stb__ENA, stb$we, stb$addr, stb$data, stb$sel,
                    output stb__RDY, ack, ack__RDY, stall, stall__RDY, err, err__RDY);
    modport client (output cyc, stb__ENA, stb$we, stb$addr, stb$data, stb$sel,
                    input  stb__RDY, ack, ack__RDY, stall, stall__RDY, err, err__RDY);
endinterface
`endif
//METASTART; FwbSlave
//METAGUARD; a.stb; 1;
//METAGUARD; f_nreqs; 1;
//METAGUARD; f_nacks; 1;
//METAGUARD; f_outstanding; 1;
//METAGUARD; RULE$init; 1;
//METAEXCLUSIVE; RULE$init2__ENA; RULE$init3__ENA
//METAGUARD; RULE$init2; 1;
//METABEFORE; RULE$init3__ENA; :RULE$init2__ENA
//METAGUARD; RULE$init3; status.ack__RDY && ( status.ack || status.err__RDY );
//METAGUARD; RULE$init4; ( a.stb__ENA == 0 ) || status.stall__RDY;
//METABEFORE; RULE$verify__ENA; :RULE$init2__ENA; :RULE$init3__ENA; :RULE$init4__ENA
//METAGUARD; RULE$verify; ( status.err__RDY && ( ( ( $past( a.stb__ENA ) == 0 ) && status.ack__RDY && ( ( a.stb__ENA == 0 ) || ( status.stall__RDY && ( status.stall__RDY || ( !status.err ) ) ) || ( ( !status.stall__RDY ) && ( !( status.ack || ( !( status.stall__RDY || ( !status.err ) ) ) ) ) ) || ( !BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 ) || ( !( nreqs - nacks ) ) ) ) || ( ( !( $past( a.stb__ENA ) == 0 ) ) && status.ack__RDY && ( ( ( a.stb__ENA == 0 ) && ( status.stall__RDY || ( $past( nRST ) == 0 ) || ( !f_past_valid ) ) ) || ( ( !( a.stb__ENA == 0 ) ) && ( ( ( nreqs - nacks ) && ( ( BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 && ( ( status.stall__RDY && ( status.stall__RDY || ( !status.err ) ) ) || ( ( !status.stall__RDY ) && ( !( status.ack || ( !( ( f_past_valid && ( $past( nRST ) == 0 ) && ( status.stall__RDY || ( !status.err ) ) ) || ( ( !f_past_valid ) && ( status.stall__RDY || ( !status.err ) ) ) ) ) ) ) ) ) ) || ( ( !BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 ) && ( status.stall__RDY || ( $past( nRST ) == 0 ) || ( !f_past_valid ) ) ) ) ) || ( ( !( nreqs - nacks ) ) && ( status.stall__RDY || ( $past( nRST ) == 0 ) || ( !f_past_valid ) ) ) ) ) ) ) ) ) || ( ( !status.err__RDY ) && ( !( ( ( nreqs - nacks ) && ( BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 || status.ack || f_past_valid ) ) || ( ( !( nreqs - nacks ) ) && ( status.ack || f_past_valid ) ) || ( !status.ack__RDY ) ) ) );
//METARULES; RULE$init; RULE$init2; RULE$init3; RULE$init4; RULE$verify
//METASTART; WbPriArbiter
//METAINVOKE; a.stb__ENA; :o.stb__ENA;
//METAEXCLUSIVE; a.stb__ENA; b.stb__ENA
//METAGUARD; a.stb; !( ( 0 == a.cyc ) || ( !o.stb__RDY ) );
//METAGUARD; a.ack; o.ack__RDY;
//METAGUARD; a.stall; o.stall__RDY;
//METAGUARD; a.err; o.err__RDY;
//METAINVOKE; b.stb__ENA; :o.stb__ENA;
//METAGUARD; b.stb; !( ( 0 == ( a.cyc ^ 1 ) ) || ( !o.stb__RDY ) );
//METAGUARD; b.ack; o.ack__RDY;
//METAGUARD; b.stall; o.stall__RDY;
//METAGUARD; b.err; o.err__RDY;
`endif
