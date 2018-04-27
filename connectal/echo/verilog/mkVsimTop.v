
module mkVsimTop(input CLK_derivedClock, input RST_N_derivedReset, input CLK_sys_clk, input CLK, input RST_N);
  wire sink_0_RDY_beat;
  wire top_RDY_indications_0_message_deq, top_RDY_indications_0_message_first, top_RDY_requests_0_message_enq;
  wire [31 : 0] top_indications_0_message_first, top_requests_0_message_enq_v;
  VsimSink sink_0(.RST(RST_N), .CLK(CLK), .CLK_GATE(1'd1),
    .EN_beat(sink_0_RDY_beat && top_RDY_requests_0_message_enq),
    .beat(top_requests_0_message_enq_v), .RDY_beat(sink_0_RDY_beat));
  VsimSource tmp_1_0(.RST(RST_N), .CLK(CLK), .CLK_GATE(1'd1),
    .beat(top_indications_0_message_first),
    .en_beat(top_RDY_indications_0_message_first && top_RDY_indications_0_message_deq));

  mkCnocTop top(.CLK(CLK), .RST_N(RST_N),
    .requests_0_message_enq_v(top_requests_0_message_enq_v), .EN_requests_0_message_enq(sink_0_RDY_beat && top_RDY_requests_0_message_enq),
    .EN_indications_0_message_deq(top_RDY_indications_0_message_first && top_RDY_indications_0_message_deq),
    .RDY_requests_0_message_enq(top_RDY_requests_0_message_enq),
    .requests_0_message_notFull(), .RDY_requests_0_message_notFull(),
    .indications_0_message_first(top_indications_0_message_first), .RDY_indications_0_message_first(top_RDY_indications_0_message_first),
    .RDY_indications_0_message_deq(top_RDY_indications_0_message_deq),
    .indications_0_message_notEmpty(), .RDY_indications_0_message_notEmpty());
endmodule  // mkVsimTop
