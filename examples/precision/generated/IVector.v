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
    wire [9:0]fifo$out$first;
    Fifo1_OC_4 fifo (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(request$say__ENA),
        .in$enq$v({ request$say$v , request$say$meth }),
        .in$enq__RDY(request$say__RDY),
        .out$deq__ENA(ind$heard__RDY),
        .out$deq__RDY(ind$heard__ENA),
        .out$first(fifo$out$first),
        .out$first__RDY());
    assign ind$heard$meth = fifo$out$first[ 5 : 0 ];
    assign ind$heard$v = fifo$out$first[ 9 : 6 ];

    always @( posedge CLK) begin
      if (!nRST) begin
        counter <= 0;
        fcounter <= 0;
        gcounter <= 0;
      end // nRST
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
