
`include "ProjectDefines.vh"
module mkVsimTop(input CLK_derivedClock, input RST_N_derivedReset, input CLK_sys_clk, input CLK, input RST_N);
  wire sink_0_RDY_beat, nextInBeat, nextOutBeat, sinkLast, sourceLast;
  wire [31 : 0] beatInData;
  wire EIRDY_in_enq, EIRDY_out_first, EIRDY_out_deq;
  wire [`MAX_OUT_WIDTH-1 : 0]indData;

  reg [`MAX_OUT_WIDTH-1 : 0] outgoingData;
  reg [`MAX_IN_WIDTH-1 : 0] incomingData;
  reg indicationState;
  reg [15 : 0] indicationWords;

  VsimSink sink_0(.RST(RST_N), .CLK(CLK), .CLK_GATE(1'd1),
    .EN_beat(sink_0_RDY_beat && EIRDY_in_enq),
    .beat(beatInData), .RDY_beat(sink_0_RDY_beat), .last(sinkLast));
  VsimSource tmp_1_0(.RST(RST_N), .CLK(CLK), .CLK_GATE(1'd1),
    .beat(outgoingData[31:0]), .last(sourceLast), .en_beat(nextOutBeat && indicationState));

  mkCnocTop top(.CLK(CLK), .RST_N(RST_N),
      .in_enq_v({incomingData[`MAX_IN_WIDTH-1-16:0], beatInData[31:16]}),
      .EN_in_enq(nextInBeat && sinkLast && EIRDY_in_enq), .RDY_in_enq(EIRDY_in_enq),
      .out_first(indData), .RDY_out_first(EIRDY_out_first),
      .EN_out_deq(sourceLast && EIRDY_out_deq), .RDY_out_deq(EIRDY_out_deq));

  assign nextInBeat = sink_0_RDY_beat && EIRDY_in_enq;
  assign nextOutBeat = EIRDY_out_first && EIRDY_out_deq;
  assign sourceLast = indicationWords == 16'd1;

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        indicationState <= 0;
        indicationWords <= 16'd0;
      end
    else
      begin
        if (nextInBeat) begin
          //$display("CNOCTOP: incoming %x last %x incomingData %x", beatInData, sinkLast, incomingData);
          incomingData = {incomingData[`MAX_IN_WIDTH-1-32:0], beatInData};
        end
        if (nextOutBeat) begin
          if (!indicationState) begin
              indicationState <= 1;
              outgoingData = {indData[`MAX_OUT_WIDTH-1:16], /*portal*/16'd5};
              indicationWords <= indData[15:0] + 1;
          end
          else begin
              //$display("CNOCTOP: state %x outgoing last %x data %x", indicationState, sourceLast, outgoingData);
              outgoingData = {32'b0, outgoingData[`MAX_IN_WIDTH-1:32]};
              indicationWords <= indicationWords - 16'd1;
              if (sourceLast)
                indicationState <= 0;
          end
        end
      end
  end
  initial
  begin
    indicationState = 0;
    indicationWords = 16'hAAAA;
  end
endmodule  // mkVsimTop
