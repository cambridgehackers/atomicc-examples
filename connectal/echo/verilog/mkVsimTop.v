
`include "ProjectDefines.vh"
module mkVsimTop(input CLK_derivedClock, input RST_N_derivedReset, input CLK_sys_clk, input CLK, input RST_N);
  wire sink_0_RDY_beat;
  wire [31 : 0] requests_0_message_enq_v;
  wire EIRDY_in_enq, EIRDY_out_first, EIRDY_out_deq;
  wire [`MAX_OUT_WIDTH-1 : 0]indData;
  wire [31 : 0] lEcho_heard_v; wire lEcho_delay_EMPTY_N, lEcho_delay_FULL_N;
  wire [31 : 0] lEcho_heard2_a_b; wire lEcho_delay2_EMPTY_N, lEcho_delay2_FULL_N;
  wire RULElEIO_sendHeader, RULElEIO_sendMessage, RULElEIO_sendPortal;
  reg [1: 0] indicationState;
  wire [31 : 0] indicationData;
  wire nextInBeat, nextOutBeat;
  wire sinkLast, sourceLast;

  reg [15 : 0] indicationWords;
  reg [15 : 0] indicationPortal;
  reg [15 : 0] indicationId;
  reg [`MAX_IN_WIDTH-1 : 0] incomingData;

  VsimSink sink_0(.RST(RST_N), .CLK(CLK), .CLK_GATE(1'd1),
    .EN_beat(sink_0_RDY_beat && EIRDY_in_enq),
    .beat(requests_0_message_enq_v), .RDY_beat(sink_0_RDY_beat), .last(sinkLast));
  VsimSource tmp_1_0(.RST(RST_N), .CLK(CLK), .CLK_GATE(1'd1),
    .beat(indicationData), .last(sourceLast), .en_beat(nextOutBeat));

  assign nextInBeat = sink_0_RDY_beat && EIRDY_in_enq;
  assign nextOutBeat = EIRDY_out_first && EIRDY_out_deq;
  assign sourceLast = indicationWords == 16'd1;

  assign RULElEIO_sendPortal = nextOutBeat && indicationState == 0 && nextOutBeat;
  assign RULElEIO_sendHeader = nextOutBeat && indicationState == 1 && nextOutBeat;
  assign RULElEIO_sendMessage = nextOutBeat && indicationState == 2 && nextOutBeat;
  assign indicationData = 
    indicationState == 0 ? {        16'd5, 16'd1 + 16'd1 + 16'd1} :
    indicationState == 1 ? {indData[15:0], 16'd1 + 16'd1 } :
                           indData[47:16];

  mkCnocTop top(.CLK(CLK), .RST_N(RST_N),
      .in_enq_v({incomingData[`MAX_IN_WIDTH-1-16:0], requests_0_message_enq_v[31:16]}),
      .EN_in_enq(nextInBeat && sinkLast && EIRDY_in_enq), .RDY_in_enq(EIRDY_in_enq),
      .out_first(indData), .RDY_out_first(EIRDY_out_first),
      .EN_out_deq(RULElEIO_sendMessage && EIRDY_out_deq), .RDY_out_deq(EIRDY_out_deq));

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        indicationState <= 0;
        indicationWords <= 16'd0;
        indicationId <= 16'd0;
      end
    else
      begin
        if (RULElEIO_sendPortal) begin
          $display("CNOCTOP: sendPortal data %x", indicationData);
          indicationState <= 1;
        end
        if (RULElEIO_sendHeader) begin
          $display("CNOCTOP: sendHeader data %x", indicationData);
          indicationState <= 2;
          indicationWords <= 1;
          indicationId <= indData[15:0];
        end
        if (RULElEIO_sendMessage) begin
          $display("CNOCTOP: sendMessage data %x", indicationData);
          indicationWords <= indicationWords - 16'd1;
          if (indicationWords == 16'd1)
            indicationState <= 0;
        end

        if (nextInBeat) begin
          $display("CNOCTOP: incoming %x last %x incomingData %x", requests_0_message_enq_v, sinkLast, incomingData);
          incomingData = {incomingData[`MAX_IN_WIDTH-1-32:0], requests_0_message_enq_v};
        end
      end
  end
  initial
  begin
    indicationState = 0;
    indicationWords = 16'hAAAA;
    indicationId = 16'hAAAA;
  end
endmodule  // mkVsimTop
