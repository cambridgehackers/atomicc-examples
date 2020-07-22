`include "precision.generated.vh"

`default_nettype none
module IVector (input wire CLK, input wire nRST,
    input wire request$say__ENA,
    input wire [6 - 1:0]request$say$meth,
    input wire [4 - 1:0]request$say$v,
    output wire request$say__RDY,
    output wire ind$heard__ENA,
    output wire [6 - 1:0]ind$heard$meth,
    output wire [4 - 1:0]ind$heard$v,
    input wire ind$heard__RDY);
    reg [9 - 1:0]counter;
    reg [((14 / 7) + (3 * 2)) - 1:0]fcounter;
    reg [9 - 1:0]gcounter;
    wire [6 - 1:0]RULE$respond$temp$a;
    wire [4 - 1:0]RULE$respond$temp$b;
    wire [10 - 1:0]fifo$in$enq$v;
    wire fifo$in$enq__RDY;
    wire fifo$out$deq__ENA;
    wire fifo$out$deq__RDY;
    wire [10 - 1:0]fifo$out$first;
    wire fifo$out$first__RDY;
    wire [6 - 1:0]request$say$temp$a;
    wire [4 - 1:0]request$say$temp$b;
    Fifo1Base#(.width(10)) fifo (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(request$say__ENA),
        .in$enq$v(fifo$in$enq$v),
        .in$enq__RDY(fifo$in$enq__RDY),
        .out$deq__ENA(fifo$out$deq__ENA),
        .out$deq__RDY(fifo$out$deq__RDY),
        .out$first(fifo$out$first),
        .out$first__RDY(fifo$out$first__RDY));
    assign fifo$in$enq$v = { request$say$temp$b , request$say$temp$a };
    assign fifo$out$deq__ENA = fifo$out$first__RDY && ind$heard__RDY;
    assign ind$heard$meth = RULE$respond$temp$a;
    assign ind$heard$v = RULE$respond$temp$b;
    assign ind$heard__ENA = fifo$out$first__RDY && fifo$out$deq__RDY;
    assign request$say__RDY = fifo$in$enq__RDY;
    // Extra assigments, not to output wires
    assign RULE$respond$temp$a = fifo$out$first[ 6 - 1 : 0 ];
    assign RULE$respond$temp$b = fifo$out$first[ 4 - 1 + 6 : 6 ];
    assign request$say$temp$a = request$say$meth;
    assign request$say$temp$b = request$say$v;

    always @( posedge CLK) begin
      if (!nRST) begin
        counter <= 0;
        fcounter <= 0;
        gcounter <= 0;
      end // nRST
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
