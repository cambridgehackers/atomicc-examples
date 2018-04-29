
`include "ProjectDefines.vh"
module mkVsimTop(input CLK_derivedClock, input RST_N_derivedReset, input CLK_sys_clk, input CLK, input RST_N);
  wire sinkReady;
  wire RDY_in_enq, EN_out_enq;
  wire [`MAX_OUT_WIDTH-1 : 0] outgoingData;
  wire [`MAX_IN_WIDTH-1 : 0] incomingData;
  wire RDY_outgoing;

  VsimSink sink_0(.RST_N(RST_N), .CLK(CLK), .CLK_GATE(1'd1),
    .EN_data(sinkReady && RDY_in_enq), .data(incomingData), .RDY_data(sinkReady));
  VsimSource tmp_1_0(.RST_N(RST_N), .CLK(CLK), .CLK_GATE(1'd1),
    .data(outgoingData), .en_data(EN_out_enq && RDY_outgoing), .RDY_data(RDY_outgoing));

  mkCnocTop top(.CLK(CLK), .RST_N(RST_N),
      .in_enq_v({16'b0, incomingData[`MAX_IN_WIDTH-1:16]}), .EN_in_enq(sinkReady && RDY_in_enq), .RDY_in_enq(RDY_in_enq),
      .out_enq_v(outgoingData), .RDY_out_enq(RDY_outgoing), .EN_out_enq(EN_out_enq));
endmodule  // mkVsimTop
