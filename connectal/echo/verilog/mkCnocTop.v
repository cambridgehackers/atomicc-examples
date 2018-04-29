
`include "ProjectDefines.vh"
module mkCnocTop( input  CLK, input  RST_N,
  input  [`MAX_IN_WIDTH -1: 0] in_enq_v, input  EN_in_enq, output RDY_in_enq,
  output [`MAX_OUT_WIDTH -1: 0] out_first, output RDY_out_first,
  input  EN_out_deq, output RDY_out_deq);

  wire indAvail;
  wire [31:0] lEcho_heard_v, lEcho_heard2_a_b;
  wire lEcho_delay_FULL_N, lEcho_delay2_FULL_N, lEcho_delay_EMPTY_N, lEcho_delay2_EMPTY_N;
  wire [`MAX_OUT_WIDTH -1: 0] outputValue;

  assign RDY_in_enq = lEcho_delay_FULL_N && lEcho_delay2_FULL_N;
  assign indAvail = lEcho_delay_EMPTY_N || lEcho_delay2_EMPTY_N;
  assign RDY_out_first = indAvail;
  assign RDY_out_deq = indAvail;
  assign out_first = outputValue;
  // value, 16'd(methodNumber), 16'd(length)
  assign outputValue = lEcho_delay_EMPTY_N ? {lEcho_heard_v, 16'd0, 16'd1} : {lEcho_heard2_a_b, 16'd1, 16'd1};

  SizedFIFO #(.p1width(32'd32), .p2depth(32'd8), .p3cntr_width(32'd3), .guarded(32'd1)) lEcho_delay(
      .RST(RST_N), .CLK(CLK), .D_IN(in_enq_v[47:16]),
      .ENQ(EN_in_enq && in_enq_v[15:0] == 0 && lEcho_delay_FULL_N),
      .DEQ(EN_out_deq && outputValue[31:16] == 0 && lEcho_delay_EMPTY_N), .CLR(0),
      .D_OUT(lEcho_heard_v), .FULL_N(lEcho_delay_FULL_N), .EMPTY_N(lEcho_delay_EMPTY_N));

  SizedFIFO #(.p1width(32'd32), .p2depth(32'd8), .p3cntr_width(32'd3), .guarded(32'd1)) lEcho_delay2(
      .RST(RST_N), .CLK(CLK), .D_IN(in_enq_v[47:16]),
      .ENQ(EN_in_enq && in_enq_v[15:0] == 1 && lEcho_delay2_FULL_N),
      .DEQ((EN_out_deq && outputValue[31:16] == 1) && lEcho_delay2_EMPTY_N), .CLR(0),
      .D_OUT(lEcho_heard2_a_b), .FULL_N(lEcho_delay2_FULL_N), .EMPTY_N(lEcho_delay2_EMPTY_N));
endmodule
