
`include "ProjectDefines.vh"
module mkVsimTop(input CLK_derivedClock, input RST_N_derivedReset, input CLK_sys_clk, input CLK, input RST_N);
  wire EN_incoming, EN_outgoing, writeLast, EN_writeBeat, EN_readBeat, readLast;
  wire RDY_echo_in_enq, EN_echo_out_enq, RDY_echo_out_enq, incomingEnable;
  wire [`MAX_OUT_WIDTH-1 : 0] outgoingData, echoData, incomingData;
  wire [15: 0] outgoingLength;
  wire [`MAX_BUS_WIDTH-1:0] writeData, readData;
  wire RDY_incoming, RDY_outgoing;

  VsimSink #(.width(`MAX_BUS_WIDTH)) sink_0 (.CLK(CLK), .RST_N(RST_N),
   .EN_beat(EN_writeBeat), .RDY_beat(!RDY_incoming), .beat(writeData), .last(writeLast));

  VsimSource #(.width(`MAX_BUS_WIDTH)) source_0 (.CLK(CLK), .RST_N(RST_N),
   .EN_beat(EN_readBeat), .RDY_beat(!RDY_outgoing), .beat(readData), .last(readLast));

  wire RDY_fromBus;
  assign EN_writeBeat = RDY_fromBus;
  AdapterFromBus wadapter_0(.CLK(CLK), .RST_N(RST_N),
   .EN_writeBeat(EN_writeBeat), .RDY_writeBeat(RDY_fromBus), .writeData(writeData), .writeLast(writeLast),
   .EN_incoming(EN_incoming), .RDY_incoming(RDY_incoming), .incomingData(incomingData));
  //l_module_OC_AdapterFromBus wadapter_0(.CLK(CLK), .nRST(RST_N),
    //.in$enq__ENA(EN_writeBeat), .in$enq$v(writeData), .in$enq$last(writeLast), .in$enq__RDY(RDY_fromBus),
    //.out$enq__ENA(EN_incoming), .out$enq$v(incomingData), .out$enq$length(), .out$enq__RDY(RDY_incoming));
  AdapterToBus radapter_0(.CLK(CLK), .RST_N(RST_N),
   .EN_readBeat(EN_readBeat), .RDY_readBeat(!RDY_outgoing), .readData(readData), .readLast(readLast),
   .EN_outgoing(EN_outgoing), .RDY_outgoing(RDY_outgoing), .outgoingData(outgoingData), .outgoingLength(outgoingLength));

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
endmodule  // mkVsimTop

module AdapterFromBus(input CLK, input RST_N,
   input EN_writeBeat, output RDY_writeBeat, input [`MAX_BUS_WIDTH-1:0] writeData, input writeLast,
   input EN_incoming, output RDY_incoming, output [`MAX_IN_WIDTH-1:0]incomingData);

  reg  [`MAX_IN_WIDTH-1 : 0] buffer;
  reg  waitForEnq;

  assign RDY_writeBeat = !waitForEnq;
  assign RDY_incoming = waitForEnq;
  assign incomingData = buffer;
  always @(posedge CLK) begin
     if (RST_N == `BSV_RESET_VALUE) begin
        waitForEnq <= 0;
     end
     else begin
        // process 'write' requests
        if (EN_incoming && waitForEnq)
            waitForEnq <= 0;
        if (EN_writeBeat && !waitForEnq) begin
            $display("VSIMSINK: buffer %x writeData %x writeLast %x", buffer, writeData, writeLast);
            buffer <= buffer << 32 | writeData;
            if (writeLast)
                waitForEnq <= 1;
        end 
    end
  end

endmodule  // Adapter

module AdapterToBus(input CLK, input RST_N,
   output EN_readBeat, input RDY_readBeat, output [`MAX_BUS_WIDTH-1:0]readData, output readLast,
   input EN_outgoing, output RDY_outgoing, input [`MAX_OUT_WIDTH-1:0]outgoingData, input [15: 0]outgoingLength);

  reg  RDY_outgoing;
  reg  [`MAX_OUT_WIDTH-1 : 0] outgoingBuffer;
  reg  [15 : 0] readCount;

  assign readLast = readCount == 16'd1;
  assign readData = outgoingBuffer[`MAX_BUS_WIDTH - 1: 0];

  always @(posedge CLK) begin
     if (RST_N == `BSV_RESET_VALUE) begin
        RDY_outgoing <= 1;
     end
     else begin
        // process 'read' requests
        if (EN_outgoing && RDY_outgoing) begin
            RDY_outgoing <= 0;
            outgoingBuffer <= outgoingData;
            readCount <= outgoingLength + 1;
            //$display("VSOURCE: start data %x", outgoingData);
        end
        if (EN_readBeat && !RDY_outgoing) begin
            //$display("VSOURCE: outgoing data %x last %x", outgoingBuffer, readLast);
            outgoingBuffer <= {32'b0, outgoingBuffer[`MAX_OUT_WIDTH-1:32]};
            if (readLast)
                RDY_outgoing <= 1;
            readCount <= readCount - 16'd1;
        end
    end
  end

endmodule  // Adapter
