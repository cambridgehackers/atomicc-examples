`include "precision.generated.vh"

module IVector (input CLK, input nRST,
    input request$say__ENA,
    input [5:0]request$say$meth,
    input [3:0]request$say$v,
    output request$say__RDY,
    output ind$heard__ENA,
    output [5:0]ind$heard$meth,
    output [3:0]ind$heard$v,
    input ind$heard__RDY);
    wire CLK, nRST;
    reg [8:0]counter;
    reg [7:0]fcounter;
    reg [8:0]gcounter;
    wire fifo$out$deq__RDY;
    wire [9:0]fifo$out$first;
    wire fifo$out$first__RDY;
    wire respond__ENA;
    assign respond__ENA = fifo$out$first__RDY  & fifo$out$deq__RDY  & ind$heard__RDY ;
    Fifo1_OC_2 fifo (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(request$say__ENA),
        .in$enq$v({ request$say$v , request$say$meth }),
        .in$enq__RDY(request$say__RDY),
        .out$deq__ENA(respond__ENA),
        .out$deq__RDY(fifo$out$deq__RDY),
        .out$first(fifo$out$first),
        .out$first__RDY(fifo$out$first__RDY));
    assign ind$heard$meth = fifo$out$first[5:0] ;
    assign ind$heard$v = fifo$out$first[9:6] ;
    assign ind$heard__ENA = respond__ENA ;

    always @( posedge CLK) begin
      if (!nRST) begin
        counter <= 0;
        fcounter <= 0;
        gcounter <= 0;
      end // nRST
    end // always @ (posedge CLK)
endmodule 

