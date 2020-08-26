`include "echo.generated.vh"

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
    assign sout.say__RDY = fifo$in.enq__RDY;
endmodule

`default_nettype wire    // set back to default value
