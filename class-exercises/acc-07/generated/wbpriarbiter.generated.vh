`ifndef __wbpriarbiter_GENERATED__VH__
`define __wbpriarbiter_GENERATED__VH__
`include "atomicclib.vh"

//METASTART; FwbSlave
//METAGUARD; a.stb; 1;
//METAGUARD; f_nreqs; 1;
//METAGUARD; f_nacks; 1;
//METAGUARD; f_outstanding; 1;
//METAGUARD; RULE$init; 1;
//METAEXCLUSIVE; RULE$init2__ENA; RULE$init3__ENA
//METAGUARD; RULE$init2; 1;
//METABEFORE; RULE$init3__ENA; :RULE$init2__ENA
//METAGUARD; RULE$init3; status$ack__RDY && ( status$ack || status$err__RDY );
//METAGUARD; RULE$init4; ( a$stb__ENA == 0 ) || status$stall__RDY;
//METABEFORE; RULE$verify__ENA; :RULE$init2__ENA; :RULE$init3__ENA; :RULE$init4__ENA
//METAGUARD; RULE$verify; ( status$err__RDY && ( ( ( $past( a$stb__ENA ) == 0 ) && status$ack__RDY && ( status$stall__RDY || ( a$stb__ENA == 0 ) || ( !( BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 && ( nreqs - nacks ) && ( status$ack || status$err ) ) ) ) ) || ( ( !( $past( a$stb__ENA ) == 0 ) ) && status$ack__RDY && ( status$stall__RDY || ( ( a$stb__ENA == 0 ) && ( ( $past( nRST ) == 0 ) || ( !f_past_valid ) ) ) || ( ( !( a$stb__ENA == 0 ) ) && ( !( ( BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 && ( ( ( nreqs - nacks ) && ( status$ack || ( ( $past( nRST ) == 0 ) && status$err ) || ( ( !( $past( nRST ) == 0 ) ) && ( f_past_valid || status$err ) ) ) ) || ( ( !( nreqs - nacks ) ) && ( !( ( $past( nRST ) == 0 ) || ( !f_past_valid ) ) ) ) ) ) || ( ( !BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 ) && ( !( ( $past( nRST ) == 0 ) || ( !f_past_valid ) ) ) ) ) ) ) ) ) ) ) || ( ( !status$err__RDY ) && ( !( ( BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 && ( ( nreqs - nacks ) || status$ack || f_past_valid ) ) || ( ( !BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 ) && ( status$ack || f_past_valid ) ) || ( !status$ack__RDY ) ) ) );
//METARULES; RULE$init; RULE$init2; RULE$init3; RULE$init4; RULE$verify
//METASTART; WbPriArbiter
//METAINVOKE; a.stb__ENA; :o$stb__ENA;
//METAEXCLUSIVE; a.stb__ENA; b.stb__ENA
//METAGUARD; a.stb; !( ( 0 == acyc ) || ( !o$stb__RDY ) );
//METAGUARD; a.ack; o$ack__RDY;
//METAGUARD; a.stall; o$stall__RDY;
//METAGUARD; a.err; o$err__RDY;
//METAINVOKE; b.stb__ENA; :o$stb__ENA;
//METAGUARD; b.stb; !( ( 0 == ( acyc ^ 1 ) ) || ( !o$stb__RDY ) );
//METAGUARD; b.ack; o$ack__RDY;
//METAGUARD; b.stall; o$stall__RDY;
//METAGUARD; b.err; o$err__RDY;
`endif
