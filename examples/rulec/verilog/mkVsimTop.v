
`include "ProjectDefines.vh"
module mkVsimTop(input CLK_derivedClock, input RST_N_derivedReset, input CLK_sys_clk, input CLK, input RST_N);
  wire EN_incoming, EN_in$enqr, in$enq$last, EN_in$enq, EN_out$enqr, out$enq$last;
  wire RDY_echo_in_enq, EN_echo_out_enq, RDY_echo_out_enq, incomingEnable;
  wire [`MAX_OUT_WIDTH-1 : 0] in$enqData, echoData, incomingData;
  wire [15: 0] in$enq$length;
  wire [`MAX_BUS_WIDTH-1:0] in$enq$v, readDatar;
  wire RDY_incoming, RDY_in$enqr;
  wire RDY_fromBus;

  VsimSink #(.width(`MAX_BUS_WIDTH)) sink_0 (.CLK(CLK), .RST_N(RST_N),
   .EN_beat(EN_in$enq), .RDY_beat(RDY_fromBus), .beat(in$enq$v), .last(in$enq$last));

  VsimSource #(.width(`MAX_BUS_WIDTH)) source_0 (.CLK(CLK), .RST_N(RST_N),
   .EN_beat(EN_out$enqr), .RDY_beat(!RDY_in$enqr), .beat(readDatar), .last(out$enq$last));

  assign EN_in$enq = RDY_fromBus;
  l_module_OC_AdapterFromBus wadapter_0(.CLK(CLK), .nRST(RST_N),
    .in$enq__ENA(EN_in$enq), .in$enq$v(in$enq$v), .in$enq$last(in$enq$last), .in$enq__RDY(RDY_fromBus),
    .out$enq__ENA(EN_incoming), .out$enq$v(incomingData), .out$enq$length(), .out$enq__RDY(RDY_incoming));
  //AdapterToBus radapter_0(.CLK(CLK), .RST_N(RST_N),
   //.EN_in$enq(EN_in$enqr), .RDY_in$enq(RDY_in$enqr), .in$enq$v(in$enqData), .in$enq$length(in$enq$length),
   //.EN_out$enq(EN_out$enqr), .RDY_out$enq(!RDY_in$enqr), .out$enq$v(readDatar), .out$enq$last(out$enq$last));
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

module AdapterToBus(input CLK, input RST_N,
   input EN_in$enq, output RDY_in$enq, input [`MAX_OUT_WIDTH-1:0]in$enq$v, input [15: 0]in$enq$length,
   output EN_out$enq, input RDY_out$enq, output [`MAX_BUS_WIDTH-1:0]out$enq$v, output out$enq$last);

  reg  [`MAX_OUT_WIDTH-1 : 0] buffer;
  reg  [15 : 0] remain;

  assign RDY_in$enq = remain == 0;
  assign out$enq$last = remain == 16'd1;
  assign out$enq$v = buffer;
  assign EN_out$enq = RDY_out$enq && remain != 0;

  always @(posedge CLK) begin
     if (RST_N == `BSV_RESET_VALUE) begin
        remain <= 0;
     end
     else begin
        // process 'read' requests
        if (EN_in$enq && RDY_in$enq) begin
            buffer <= in$enq$v;
            remain <= in$enq$length + 1;
            //$display("VSOURCE: start data %x", in$enq$v);
        end
        if (EN_out$enq) begin
            //$display("VSOURCE: in$enq data %x last %x", buffer, out$enq$last);
            buffer <= buffer >> 32;
            remain <= remain - 1;
        end
    end
  end

endmodule  // Adapter
