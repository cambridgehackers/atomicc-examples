`include "atomicc.generated.vh"
`default_nettype none
module Echo (input wire CLK, input wire nRST,
    EchoRequest.server sout,
    EchoIndication.client ind);
    PipeIn#(.width(32)) fifo$in();
    PipeOut#(.width(32)) fifo$out();
    Fifo1Base#(.width(32)) fifo (.CLK(CLK), .nRST(nRST),
        .in(fifo$in),
        .out(fifo$out));
    // Extra assigments, not to output wires
    assign fifo$in.enq$v = sout.say$v;
    assign fifo$in.enq__ENA = sout.say__ENA;
    assign fifo$out.deq__ENA = fifo$out.first__RDY && ind.heard__RDY;
    assign ind.heard$v = fifo$out.first;
    assign ind.heard__ENA = fifo$out.deq__RDY && fifo$out.first__RDY;
    assign ind.heards$ahBackSync = sout.setup$ahBackSync;
    assign ind.heards$ahEnd = sout.setup$ahEnd;
    assign ind.heards$ahFrontEnd = sout.setup$ahFrontEnd;
    assign ind.heards$ahSyncWidth = sout.setup$ahSyncWidth;
    assign ind.heards$avBackSync = sout.setup$avBackSync;
    assign ind.heards$avEnd = sout.setup$avEnd;
    assign ind.heards$avFrontEnd = sout.setup$avFrontEnd;
    assign ind.heards$avSyncWidth = sout.setup$avSyncWidth;
    assign ind.heards__ENA = sout.setup__ENA;
    assign sout.say__RDY = fifo$in.enq__RDY;
    assign sout.setup__RDY = ind.heards__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (ind.heards__RDY && sout.setup__ENA) begin // sout.setup__ENA
            $display( "[%s:%d] ahEnd %d ahFrontEnd %d ahBackSync %d ahSyncWidth %d avEnd %d avFrontEnd %d avBackSync %d avSyncWidth %d" , "sout$setup" , 49 , sout.setup$ahEnd , sout.setup$ahFrontEnd , sout.setup$ahBackSync , sout.setup$ahSyncWidth , sout.setup$avEnd , sout.setup$avFrontEnd , sout.setup$avBackSync , sout.setup$avSyncWidth );
        end; // End of sout.setup__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
