
`include "ProjectDefines.vh"
module mkVsimTop(input CLK_derivedClock, input RST_N_derivedReset, input CLK_sys_clk, input CLK, input RST_N);
  wire EN_writeBeat, RDY_writeBeat, writeLast, EN_readBeat, RDY_readBeat;
  wire [`MAX_BUS_WIDTH-1:0] writeData, readData, readLength;

  VsimReceive #(.width(`MAX_BUS_WIDTH)) sink_0 (.CLK(CLK), .nRST(RST_N),
   .EN_beat(EN_writeBeat),
   .beat$v(writeData), .beat$last(writeLast),
   .RDY_beat(RDY_writeBeat));
  VsimSend #(.width(`MAX_BUS_WIDTH)) source_0 (.CLK(CLK), .nRST(RST_N),
   .EN_beat(EN_readBeat),
   .beat$v(readData), .beat$last(readLength == 1),
   .RDY_beat(RDY_readBeat));

  UserTop top (.CLK(CLK), .nRST(RST_N),
    .write$enq__ENA(EN_writeBeat),
   .write$enq$v(writeData), .write$enq$length(writeLast ? 1 : 2),
   .write$enq__RDY(RDY_writeBeat),
   .read$enq__ENA(EN_readBeat),
   .read$enq$v(readData), .read$enq$length(readLength),
   .read$enq__RDY(RDY_readBeat));
endmodule  // mkVsimTop
