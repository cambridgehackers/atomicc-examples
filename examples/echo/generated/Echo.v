`include "echo.generated.vh"

module Echo (input CLK, input nRST,
    input sout$say__ENA,
    input [31:0]sout$say$v,
    output sout$say__RDY,
    output ind$heard__ENA,
    output [31:0]ind$heard$v,
    input ind$heard__RDY);
    wire CLK, nRST;
    wire fifo$out$deq__RDY;
    wire fifo$out$first__RDY;
    wire respond_rule__ENA;
    wire respond_rule__RDY;
    assign respond_rule__ENA = respond_rule__RDY ;
    assign respond_rule__RDY = fifo$out$deq__RDY  & fifo$out$first__RDY  & ind$heard__RDY ;
    Fifo1_OC_3 fifo (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(sout$say__ENA),
        .in$enq$v(sout$say$v),
        .in$enq__RDY(sout$say__RDY),
        .out$deq__ENA(respond_rule__ENA),
        .out$deq__RDY(fifo$out$deq__RDY),
        .out$first(ind$heard$v),
        .out$first__RDY(fifo$out$first__RDY));
    assign ind$heard__ENA = respond_rule__ENA ;
endmodule 

