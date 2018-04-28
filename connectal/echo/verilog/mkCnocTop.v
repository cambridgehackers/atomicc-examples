
`include "ProjectDefines.vh"
module mkCnocTop( input  CLK, input  RST_N,
  input  [`MAX_IN_WIDTH -1: 0] in_enq_v, input  EN_in_enq, output RDY_in_enq,
  output [`MAX_OUT_WIDTH -1: 0] out_first, output RDY_out_first,
  input  EN_out_deq, output RDY_out_deq);

  wire indAvail;
  wire [31:0] lEcho_heard_v, lEcho_heard2_a_b;
  wire [`MAX_OUT_WIDTH-1:0] outValue;
  wire [15:0] indId;
  wire lEcho_delay_FULL_N, lEcho_delay2_FULL_N;
  wire lEcho_delay_EMPTY_N, lEcho_delay2_EMPTY_N;

  assign RDY_in_enq = lEcho_delay_FULL_N && lEcho_delay2_FULL_N;
  assign indAvail = lEcho_delay_EMPTY_N || lEcho_delay2_EMPTY_N;
  assign RDY_out_first = indAvail;
  assign RDY_out_deq = indAvail;
  assign indId = lEcho_delay_EMPTY_N ? 0 : 1;
  assign out_first = outValue;
  assign outValue = (indId == 0) ? {16'b0, lEcho_heard_v, indId} : {16'b0, lEcho_heard2_a_b, indId};

  SizedFIFO #(.p1width(32'd32), .p2depth(32'd8), .p3cntr_width(32'd3), .guarded(32'd1)) lEcho_delay(
      .RST(RST_N), .CLK(CLK), .D_IN(in_enq_v[47:16]),
      .ENQ(EN_in_enq && in_enq_v[15:0] == 0 && lEcho_delay_FULL_N),
      .DEQ(EN_out_deq && indId == 0 && lEcho_delay_EMPTY_N), .CLR(0),
      .D_OUT(lEcho_heard_v), .FULL_N(lEcho_delay_FULL_N), .EMPTY_N(lEcho_delay_EMPTY_N));

  SizedFIFO #(.p1width(32'd32), .p2depth(32'd8), .p3cntr_width(32'd3), .guarded(32'd1)) lEcho_delay2(
      .RST(RST_N), .CLK(CLK), .D_IN(in_enq_v[47:16]),
      .ENQ(EN_in_enq && in_enq_v[15:0] == 1 && lEcho_delay2_FULL_N),
      .DEQ((EN_out_deq && indId == 1) && lEcho_delay2_EMPTY_N), .CLR(0),
      .D_OUT(lEcho_heard2_a_b), .FULL_N(lEcho_delay2_FULL_N), .EMPTY_N(lEcho_delay2_EMPTY_N));
  always@(posedge CLK)
  begin
     if (EN_in_enq)
        $display("MKECHO: enq   %x", in_enq_v);
     if (RDY_out_first)
        $display("MKECHO: first %x", outValue);
  end
endmodule
