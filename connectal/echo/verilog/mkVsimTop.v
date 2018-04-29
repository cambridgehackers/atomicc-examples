
`include "ProjectDefines.vh"
module mkVsimTop(input CLK_derivedClock, input RST_N_derivedReset, input CLK_sys_clk, input CLK, input RST_N);
  wire RDY_incoming, EN_incoming;
  wire RDY_echo_in_enq, EN_echo_out_enq, RDY_echo_out_enq;
  wire [`MAX_OUT_WIDTH-1 : 0] outgoingData, echoData;
  wire [`MAX_IN_WIDTH-1 : 0] incomingData;
  wire [15: 0] outgoingLength;
  wire RDY_outgoing, EN_outgoing;

  VsimSink#(.width(`MAX_IN_WIDTH)) sink_0(.RST_N(RST_N), .CLK(CLK),
    .data(incomingData),
    .EN_data(EN_incoming && RDY_incoming), .RDY_data(RDY_incoming));
  VsimSource#(.width(`MAX_IN_WIDTH)) source_0(.RST_N(RST_N), .CLK(CLK),
    .data_v(outgoingData), .data_length(outgoingLength),
    .EN_data(EN_outgoing && RDY_outgoing), .RDY_data(RDY_outgoing));

  mkEcho echo(.CLK(CLK), .RST_N(RST_N),
    .in_enq_v({16'b0, incomingData[`MAX_IN_WIDTH-1:16]}),
    .EN_in_enq(RDY_incoming && incomingData[15:0] == 16'd6 && RDY_echo_in_enq),
    .RDY_in_enq(RDY_echo_in_enq),
    .out_enq_v(echoData),
    .EN_out_enq(EN_echo_out_enq), .RDY_out_enq(RDY_echo_out_enq));

  assign EN_incoming = RDY_echo_in_enq;  // 'and' together all RDY signals
  assign EN_outgoing = (EN_echo_out_enq && RDY_echo_out_enq); // 'or' together all EN signals

  // use priority encoder to mux outgoing signals when multiple portals
  assign outgoingData = {echoData[`MAX_OUT_WIDTH-1:16], 16'd5};
  assign outgoingLength = echoData[15:0];
  assign RDY_echo_out_enq = RDY_outgoing;

endmodule  // mkVsimTop
