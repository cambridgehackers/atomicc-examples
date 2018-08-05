
`include "ProjectDefines.vh"
module mkVsimTop(input CLK_derivedClock, input RST_N_derivedReset, input CLK_sys_clk, input CLK, input RST_N);
  wire EN_writeBeat, RDY_writeBeat, writeLast;
  wire EN_readBeat, RDY_readBeat;
  wire [`MAX_BUS_WIDTH-1:0] writeData, readData, writeLength, readLength;
  wire RDY_request, RDY_indication;

  VsimReceive #(.width(`MAX_BUS_WIDTH)) sink_0 (.CLK(CLK), .nRST(RST_N),
   .EN_beat(EN_writeBeat), .RDY_beat(RDY_writeBeat), .beat$v(writeData), .beat$last(writeLast));
  VsimSend #(.width(`MAX_BUS_WIDTH)) source_0 (.CLK(CLK), .nRST(RST_N),
   .EN_beat(EN_readBeat), .RDY_beat(RDY_readBeat), .beat$v(readData), .beat$last(readLength == 1));

  assign writeLength = writeLast ? 1 : 2;
  UserTop top (.CLK(CLK), .nRST(RST_N),
    .write$enq__ENA(EN_writeBeat), .write$enq__RDY(RDY_writeBeat), .write$enq$v(writeData), .write$enq$length(writeLength),
   .read$enq__ENA(EN_readBeat), .read$enq__RDY(RDY_readBeat), .read$enq$v(readData), .read$enq$length(readLength));

  assign RDY_readBeat = !RDY_indication;
endmodule  // mkVsimTop
