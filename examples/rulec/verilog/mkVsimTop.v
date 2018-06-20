
`include "ProjectDefines.vh"
module mkVsimTop(input CLK_derivedClock, input RST_N_derivedReset, input CLK_sys_clk, input CLK, input RST_N);
  wire EN_incoming, EN_in$enqr, in$enq$last, EN_in$enq, EN_out$enqr, out$enq$last;
  wire RDY_echo_in_enq, EN_echo_out_enq, RDY_echo_out_enq, incomingEnable;
  wire [`MAX_OUT_WIDTH-1 : 0] in$enqData, echoData, incomingData;
  wire [15: 0] in$enq$length;
  wire [`MAX_BUS_WIDTH-1:0] in$enq$v, readDatar;
  wire RDY_incoming, RDY_in$enqr;

  VsimReceive #(.width(`MAX_BUS_WIDTH)) sink_0 (.CLK(CLK), .nRST(RST_N),
   .EN_beat(EN_in$enq), .RDY_beat(EN_in$enq), .beat(in$enq$v), .last(in$enq$last));

  VsimSend #(.width(`MAX_BUS_WIDTH)) source_0 (.CLK(CLK), .nRST(RST_N),
   .EN_beat(EN_out$enqr), .RDY_beat(!RDY_in$enqr), .beat(readDatar), .last(out$enq$last));

  l_module_OC_AdapterFromBus wadapter_0(.CLK(CLK), .nRST(RST_N),
    .in$enq__ENA(EN_in$enq), .in$enq$v(in$enq$v), .in$enq$last(in$enq$last), .in$enq__RDY(EN_in$enq),
    .out$enq__ENA(EN_incoming), .out$enq$v(incomingData), .out$enq$length(), .out$enq__RDY(RDY_incoming));
  l_module_OC_AdapterToBus radapter_0(.CLK(CLK), .nRST(RST_N),
   .in$enq__ENA(EN_in$enqr), .in$enq__RDY(RDY_in$enqr), .in$enq$v(in$enqData), .in$enq$length(in$enq$length),
   .out$enq__ENA(EN_out$enqr), .out$enq__RDY(!RDY_in$enqr), .out$enq$v(readDatar), .out$enq$last(out$enq$last));

  l_top top(.CLK(CLK), .nRST(RST_N),
    .request$enq$v(incomingData),
    .request$enq__ENA(incomingEnable), .request$enq__RDY(RDY_echo_in_enq),
    .indication$enq$v(echoData),
    .indication$enq__ENA(EN_echo_out_enq), .indication$enq__RDY(RDY_echo_out_enq));

  assign RDY_incoming = RDY_echo_in_enq;  // 'and' together all RDY signals
  assign incomingEnable = EN_incoming && RDY_incoming && incomingData[15:0] == `IfcNames_EchoRequestS2H && RDY_echo_in_enq;

  assign EN_in$enqr = RDY_in$enqr && (EN_echo_out_enq && RDY_echo_out_enq); // 'or' together all EN signals
  // use priority encoder to mux out going signals when multiple portals
  assign in$enqData = {echoData[`MAX_OUT_WIDTH-1:16], `IfcNames_EchoIndicationH2S};
  assign in$enq$length = echoData[15:0];
  assign RDY_echo_out_enq = RDY_in$enqr;
endmodule  // mkVsimTop
