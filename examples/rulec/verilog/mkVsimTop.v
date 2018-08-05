
`include "ProjectDefines.vh"
module mkVsimTop(input CLK_derivedClock, input RST_N_derivedReset, input CLK_sys_clk, input CLK, input RST_N);
  wire EN_writeBeat, RDY_writeBeat, writeLast;
  wire EN_readBeat, RDY_readBeat, readLast;
  wire [`MAX_BUS_WIDTH-1:0] writeData, readData;
  wire EN_incoming;
  wire [`MAX_OUT_WIDTH-1 : 0] outgoingData, indicationData, requestData;
  wire EN_request, RDY_request, EN_indication, RDY_indication;

  VsimReceive #(.width(`MAX_BUS_WIDTH)) sink_0 (.CLK(CLK), .nRST(RST_N),
   .EN_beat(EN_writeBeat), .RDY_beat(RDY_writeBeat), .beat(writeData), .last(writeLast));
  VsimSend #(.width(`MAX_BUS_WIDTH)) source_0 (.CLK(CLK), .nRST(RST_N),
   .EN_beat(EN_readBeat), .RDY_beat(RDY_readBeat), .beat(readData), .last(readLast));

//`define BOZO
`ifdef BOZO
  AdapterFromBus wadapter_0(.CLK(CLK), .nRST(RST_N),
    .in$enq__ENA(EN_writeBeat), .in$enq__RDY(RDY_writeBeat), .in$enq$v(writeData), .in$enq$last(writeLast),
    .out$enq__ENA(EN_incoming), .out$enq__RDY(RDY_request), .out$enq$v(requestData), .out$enq$length());
  AdapterToBus radapter_0(.CLK(CLK), .nRST(RST_N),
   .in$enq__ENA(EN_indication), .in$enq__RDY(RDY_indication), .in$enq$v(outgoingData), .in$enq$length(indicationData[15:0]),
   .out$enq__ENA(EN_readBeat), .out$enq__RDY(RDY_readBeat), .out$enq$v(readData), .out$enq$last(readLast));
  //always @(posedge CLK) begin
    //if (EN_writeBeat) 
        //$display("mkVsimTop: writeBeat %x last %x RDY %x", writeData, writeLast, RDY_writeBeat);
  //end

  l_top top(.CLK(CLK), .nRST(RST_N),
    .request$enq__ENA(EN_request), .request$enq__RDY(RDY_request), .request$enq$v(requestData),
    .indication$enq__ENA(EN_indication), .indication$enq__RDY(RDY_indication), .indication$enq$v(indicationData));
`else
  UserTop top (.CLK(CLK), .nRST(RST_N),
    .write$enq__ENA(EN_writeBeat), .write$enq__RDY(RDY_writeBeat), .write$enq$v(writeData), .write$enq$last(writeLast),
   .read$enq__ENA(EN_readBeat), .read$enq__RDY(RDY_readBeat), .read$enq$v(readData), .read$enq$last(readLast));
`endif

  assign EN_request = EN_incoming && requestData[15:0] == `IfcNames_EchoRequestS2H;
  assign outgoingData = {indicationData[`MAX_OUT_WIDTH-1:16], `IfcNames_EchoIndicationH2S};
  assign RDY_readBeat = !RDY_indication;
endmodule  // mkVsimTop
