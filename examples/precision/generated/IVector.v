`include "precision.generated.vh"

`default_nettype none
module IVector (input wire CLK, input wire nRST,
    input wire request$say__ENA,
    input wire [5:0]request$say$meth,
    input wire [3:0]request$say$v,
    output wire request$say__RDY,
    output wire ind$heard__ENA,
    output wire [5:0]ind$heard$meth,
    output wire [3:0]ind$heard$v,
    input wire ind$heard__RDY);
    reg [8:0]counter;
    reg [7:0]fcounter;
    reg [8:0]gcounter;
    wire [5:0]RULErespond__ENA$temp$a;
    wire [3:0]RULErespond__ENA$temp$b;
    wire fifo$out$deq__RDY;
    wire fifo$out$first__RDY;
    Fifo1Base#(10) fifo (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(request$say__ENA),
        .in$enq$v({ request$say$v , request$say$meth }),
        .in$enq__RDY(request$say__RDY),
        .out$deq__ENA(fifo$out$first__RDY & ind$heard__RDY),
        .out$deq__RDY(fifo$out$deq__RDY),
        .out$first(),
        .out$first__RDY(fifo$out$first__RDY));
    assign ind$heard$meth = RULErespond__ENA$temp$a;
    assign ind$heard$v = RULErespond__ENA$temp$b;
    assign ind$heard__ENA = fifo$out$first__RDY & fifo$out$deq__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
        counter <= 0;
        fcounter <= 0;
        gcounter <= 0;
      end // nRST
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
