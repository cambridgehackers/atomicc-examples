
`include "ProjectDefines.vh"
module mkVsimTop(input CLK_derivedClock, input RST_N_derivedReset, input CLK_sys_clk, input CLK, input RST_N);
  wire EN_incoming, EN_outgoing, sinkLast, EN_sinkBeat, EN_sourceBeat, sourceLast;
  wire RDY_echo_in_enq, EN_echo_out_enq, RDY_echo_out_enq, incomingEnable;
  wire [`MAX_OUT_WIDTH-1 : 0] outgoingData, echoData;
  wire [15: 0] outgoingLength;
  wire [`MAX_BUS_WIDTH-1:0] sinkData;

  reg  RDY_outgoing, RDY_incoming;
  reg  [`MAX_IN_WIDTH-1 : 0] incomingData;
  reg  [`MAX_OUT_WIDTH-1 : 0] outgoingBuffer;
  reg  [15 : 0] indicationWords;

  assign sourceLast = indicationWords == 16'd1;

  VsimSink #(.width(`MAX_BUS_WIDTH)) sink_0 (.CLK(CLK), .RST_N(RST_N),
   .EN_beat(EN_sinkBeat), .RDY_beat(!RDY_incoming), .beat(sinkData), .last(sinkLast));

  VsimSource #(.width(`MAX_BUS_WIDTH)) source_0 (.CLK(CLK), .RST_N(RST_N),
   .EN_beat(EN_sourceBeat), .RDY_beat(!RDY_outgoing), .beat(outgoingBuffer[31:0]), .last(sourceLast));

  always @(posedge CLK) begin
     if (RST_N == `BSV_RESET_VALUE) begin
        RDY_incoming <= 0;
        RDY_outgoing <= 1;
     end
     else begin
        // process 'write' requests
        if (EN_incoming && RDY_incoming)
            RDY_incoming <= 0;
        if (EN_sinkBeat && !RDY_incoming) begin
            $display("VSIMSINK: incomingData %x sinkData %x sinkLast %x", incomingData, sinkData, sinkLast);
            incomingData <= incomingData << 32 | sinkData;
            if (sinkLast)
                RDY_incoming <= 1;
        end 
        // process 'read' requests
        if (EN_outgoing && RDY_outgoing) begin
            RDY_outgoing <= 0;
            outgoingBuffer <= outgoingData;
            indicationWords <= outgoingLength + 1;
            //$display("VSOURCE: start data %x", outgoingData);
        end
        if (EN_sourceBeat && !RDY_outgoing) begin
            //$display("VSOURCE: outgoing data %x last %x", outgoingBuffer, sourceLast);
            outgoingBuffer <= {32'b0, outgoingBuffer[`MAX_OUT_WIDTH-1:32]};
            if (sourceLast)
                RDY_outgoing <= 1;
            indicationWords <= indicationWords - 16'd1;
        end
    end
  end

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
