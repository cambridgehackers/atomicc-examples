`ifndef __wbpriarbiter_GENERATED__VH__
`define __wbpriarbiter_GENERATED__VH__

//METASTART; WbPriArbiter
//METAINVOKE; a$cyc__ENA; :o$cyc__ENA;
//METAEXCLUSIVE; a$cyc__ENA; b$cyc__ENA
//METAGUARD; a$cyc; o$cyc__RDY;
//METAINVOKE; a$ack; :o$ack;
//METAEXCLUSIVE; a$ack; b$ack
//METAGUARD; a$ack; o$ack__RDY;
//METAINVOKE; a$stall; :o$stall;
//METAEXCLUSIVE; a$stall; b$stall
//METAGUARD; a$stall; o$stall__RDY;
//METAINVOKE; a$err; :o$err;
//METAEXCLUSIVE; a$err; b$err
//METAGUARD; a$err; o$err__RDY;
//METAINVOKE; b$cyc__ENA; :o$cyc__ENA;
//METAGUARD; b$cyc; ( a$cyc__ENA == 0 ) && o$cyc__RDY;
//METAINVOKE; b$ack; :o$ack;
//METAGUARD; b$ack; o$ack__RDY;
//METAINVOKE; b$stall; :o$stall;
//METAGUARD; b$stall; o$stall__RDY;
//METAINVOKE; b$err; :o$err;
//METAGUARD; b$err; o$err__RDY;
`endif
