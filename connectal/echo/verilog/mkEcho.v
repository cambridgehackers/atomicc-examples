
`include "ProjectDefines.vh"
module mkEcho( input  CLK, input  RST_N,
  input  [`MAX_IN_WIDTH -1: 0] in_enq_v, input EN_in_enq, output RDY_in_enq,
  output [`MAX_OUT_WIDTH -1: 0] out_enq_v, output EN_out_enq, input RDY_out_enq);

  wire outputEnable;
  wire [31:0] lEcho_heard_v, lEcho_heard2_a_b;
  wire lEcho_delay_FULL_N, lEcho_delay2_FULL_N, lEcho_delay_EMPTY_N, lEcho_delay2_EMPTY_N;
  wire [`MAX_OUT_WIDTH -1: 0] outputValue;

  assign RDY_in_enq = lEcho_delay_FULL_N && lEcho_delay2_FULL_N;
  assign EN_out_enq = outputEnable;
  assign out_enq_v = outputValue;

  assign outputEnable = RDY_out_enq && (lEcho_delay_EMPTY_N || lEcho_delay2_EMPTY_N);
                                             // value, 16'd(methodNumber), 16'd(length)
  assign outputValue = lEcho_delay_EMPTY_N ? {lEcho_heard_v, 16'd0, 16'd1} :
                                             {lEcho_heard2_a_b, 16'd1, 16'd1};

  SizedFIFO #(.p1width(32'd32), .p2depth(32'd8), .p3cntr_width(32'd3), .guarded(32'd1)) lEcho_delay(
      .RST(RST_N), .CLK(CLK), .D_IN(in_enq_v[47:16]),
      .ENQ(EN_in_enq && in_enq_v[15:0] == 0 && lEcho_delay_FULL_N),
      .DEQ(outputEnable && outputValue[31:16] == 0 && lEcho_delay_EMPTY_N), .CLR(0),
      .D_OUT(lEcho_heard_v), .FULL_N(lEcho_delay_FULL_N), .EMPTY_N(lEcho_delay_EMPTY_N));

  SizedFIFO #(.p1width(32'd32), .p2depth(32'd8), .p3cntr_width(32'd3), .guarded(32'd1)) lEcho_delay2(
      .RST(RST_N), .CLK(CLK), .D_IN(in_enq_v[47:16]),
      .ENQ(EN_in_enq && in_enq_v[15:0] == 1 && lEcho_delay2_FULL_N),
      .DEQ((outputEnable && outputValue[31:16] == 1) && lEcho_delay2_EMPTY_N), .CLR(0),
      .D_OUT(lEcho_heard2_a_b), .FULL_N(lEcho_delay2_FULL_N), .EMPTY_N(lEcho_delay2_EMPTY_N));
endmodule
