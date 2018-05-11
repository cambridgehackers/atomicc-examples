
`include "ProjectDefines.vh"
module mkVsimTop(input CLK_derivedClock, input RST_N_derivedReset, input CLK_sys_clk, input CLK, input RST_N);
  wire RDY_incoming, EN_incoming;
  wire RDY_echo_in_enq, EN_echo_out_enq, RDY_echo_out_enq, incomingEnable;
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

  l_top top(.CLK(CLK), .nRST(RST_N),
    .request$enq$v(incomingData),
    .request$enq__ENA(incomingEnable), .request$enq__RDY(RDY_echo_in_enq),
    .indication$enq$v(echoData),
    .indication$enq__ENA(EN_echo_out_enq), .indication$enq__RDY(RDY_echo_out_enq));

  assign EN_incoming = RDY_echo_in_enq;  // 'and' together all RDY signals
  assign incomingEnable = RDY_incoming && incomingData[15:0] == `IfcNames_EchoRequestS2H && RDY_echo_in_enq;

  assign EN_outgoing = (EN_echo_out_enq && RDY_echo_out_enq); // 'or' together all EN signals
  // use priority encoder to mux outgoing signals when multiple portals
  assign outgoingData = {echoData[`MAX_OUT_WIDTH-1:16], `IfcNames_EchoIndicationH2S};
  assign outgoingLength = echoData[15:0];
  assign RDY_echo_out_enq = RDY_outgoing;

  always @( posedge CLK) begin
    if (!RST_N) begin
    end // RST_N
    else begin
    end
  end
endmodule  // mkVsimTop
