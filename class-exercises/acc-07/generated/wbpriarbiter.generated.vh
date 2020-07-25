`ifndef __wbpriarbiter_GENERATED__VH__
`define __wbpriarbiter_GENERATED__VH__

//METASTART; FwbSlave
//METAGUARD; a$stb; 1;
//METAGUARD; f_nreqs; 1;
//METAGUARD; f_nacks; 1;
//METAGUARD; f_outstanding; 1;
//METAGUARD; RULE$init; 1;
//METAEXCLUSIVE; RULE$init2__ENA; RULE$init3__ENA
//METAGUARD; RULE$init2; 1;
//METAINVOKE; RULE$init3__ENA; :status$ack;!status$ack:status$err;
//METAEXCLUSIVE; RULE$init3__ENA; RULE$verify__ENA
//METABEFORE; RULE$init3__ENA; :RULE$init2__ENA
//METAGUARD; RULE$init3; status$ack__RDY && ( status$ack || status$err__RDY );
//METAINVOKE; RULE$init4__ENA; !( a$stb__ENA == 0 ):status$stall;
//METAEXCLUSIVE; RULE$init4__ENA; RULE$verify__ENA
//METAGUARD; RULE$init4; ( a$stb__ENA == 0 ) || status$stall__RDY;
//METAINVOKE; RULE$verify__ENA; !( $past{ ( nRST != 0 ) ^ 1 } == 0 ):status$ack;!( ( nreqs - nacks ) || ( !acyc ) ):status$ack;!acyc:status$ack;1:status$ack;!( $past{ ( nRST != 0 ) ^ 1 } == 0 ):status$err;!( ( nreqs - nacks ) || ( !acyc ) ):status$err;!acyc:status$err;f_past_valid:status$err;status$ack:status$err;!( $past{ a$stb__ENA } == 0 ):status$stall;!( ( a$stb__ENA == 0 ) || ( nreqs - nacks ) || ( !acyc ) || ( !status$ack ) ):status$stall;!( ( a$stb__ENA == 0 ) || ( nreqs - nacks ) || ( !acyc ) || ( !status$err ) ):status$stall;
//METABEFORE; RULE$verify__ENA; :RULE$init2__ENA; :RULE$init3__ENA; :RULE$init4__ENA; :a$stb__ENA
//METAGUARD; RULE$verify; status$err__RDY && ( ( ( $past{ a$stb__ENA } == 0 ) && status$ack__RDY && ( status$stall__RDY || ( a$stb__ENA == 0 ) || ( nreqs - nacks ) || ( !( status$ack || status$err ) ) ) ) || ( ( !( $past{ a$stb__ENA } == 0 ) ) && status$ack__RDY && status$stall__RDY ) );
//METARULES; RULE$init; RULE$init2; RULE$init3; RULE$init4; RULE$verify
//METASTART; WbPriArbiter
//METAINVOKE; a$stb__ENA; :o$stb__ENA;
//METAEXCLUSIVE; a$stb__ENA; b$stb__ENA
//METAGUARD; a$stb; acyc && o$stb__RDY;
//METAINVOKE; a$ack; :o$ack;
//METAEXCLUSIVE; a$ack; b$ack
//METAGUARD; a$ack; o$ack__RDY;
//METAINVOKE; a$stall; :o$stall;
//METAEXCLUSIVE; a$stall; b$stall
//METAGUARD; a$stall; o$stall__RDY;
//METAINVOKE; a$err; :o$err;
//METAEXCLUSIVE; a$err; b$err
//METAGUARD; a$err; o$err__RDY;
//METAINVOKE; b$stb__ENA; :o$stb__ENA;
//METAGUARD; b$stb; !( acyc || ( !o$stb__RDY ) );
//METAINVOKE; b$ack; :o$ack;
//METAGUARD; b$ack; o$ack__RDY;
//METAINVOKE; b$stall; :o$stall;
//METAGUARD; b$stall; o$stall__RDY;
//METAINVOKE; b$err; :o$err;
//METAGUARD; b$err; o$err__RDY;
`endif
