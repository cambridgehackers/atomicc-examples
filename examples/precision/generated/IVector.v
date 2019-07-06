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
    reg [((14) / (7)) + ((3) * (2)) - 1:0]fcounter;
    reg [9 - 1:0]gcounter;
    wire [(6 + 4) - 1:0]RULE$respond$temp;
    wire fifo$in$enq__RDY;
    wire fifo$out$deq__RDY;
    wire [10 - 1:0]fifo$out$first;
    wire fifo$out$first__RDY;
    wire [(6 + 4) - 1:0]request$say$temp;
    Fifo1Base#(10) fifo (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(request$say__ENA),
        .in$enq$v({ request$say$v , request$say$meth }),
        .in$enq__RDY(fifo$in$enq__RDY),
        .out$deq__ENA(fifo$out$first__RDY & ind$heard__RDY),
        .out$deq__RDY(fifo$out$deq__RDY),
        .out$first(fifo$out$first),
        .out$first__RDY(fifo$out$first__RDY));
    assign ind$heard$meth = fifo$out$first[ 6 - 1 : 0 ];
    assign ind$heard$v = fifo$out$first[ 4 - 1 + 6 : 6 ];
    assign ind$heard__ENA = fifo$out$first__RDY & fifo$out$deq__RDY;
    assign request$say__RDY = fifo$in$enq__RDY;
    // Extra assigments, not to output wires
    assign RULE$respond$temp = { fifo$out$first[ 4 - 1 + 6 : 6 ] , fifo$out$first[ 6 - 1 : 0 ] };
    assign request$say$temp = { request$say$v , request$say$meth };

    always @( posedge CLK) begin
      if (!nRST) begin
        counter <= 0;
        fcounter <= 0;
        gcounter <= 0;
      end // nRST
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
