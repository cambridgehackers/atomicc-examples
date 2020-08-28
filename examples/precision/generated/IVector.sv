`include "precision.generated.vh"

`default_nettype none
module IVector (input wire CLK, input wire nRST,
    IVectorRequest.server request,
    IVectorIndication.client ind);
    reg [9 - 1:0]counter;
    reg [((14 / 7) + (3 * 2)) - 1:0]fcounter;
    reg [9 - 1:0]gcounter;
    ValueType RULE$respond$temp;
    PipeIn#(.width(10)) fifo$in();
    PipeOut#(.width(10)) fifo$out();
    ValueType request$say$temp;
    Fifo1Base#(.width(10)) fifo (.CLK(CLK), .nRST(nRST),
        .in(fifo$in),
        .out(fifo$out));
    // Extra assigments, not to output wires
    assign RULE$respond$temp = fifo$out.first;
    assign fifo$in.enq$v = request.say$temp;
    assign fifo$in.enq__ENA = request.say__ENA;
    assign fifo$out.deq__ENA = fifo$out.first__RDY && ind.heard__RDY;
    assign ind.heard$meth = RULE$respond$temp.a;
    assign ind.heard$v = RULE$respond$temp.b;
    assign ind.heard__ENA = fifo$out.first__RDY && fifo$out.deq__RDY;
    assign request$say$temp.a = request.say$meth;
    assign request$say$temp.b = request.say$v;
    assign request.say__RDY = fifo$in.enq__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
        counter <= 0;
        fcounter <= 0;
        gcounter <= 0;
      end // nRST
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
