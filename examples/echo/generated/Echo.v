`include "echo.generated.vh"

`default_nettype none
module Echo (input wire CLK, input wire nRST,
    input wire sout$say__ENA,
    input wire [31:0]sout$say$v,
    output wire sout$say__RDY,
    output wire ind$heard__ENA,
    output wire [31:0]ind$heard$v,
    input wire ind$heard__RDY);
    wire RULErespond_rule__ENA;
    wire RULErespond_rule__RDY;
    wire [31:0]fifo$in$enq$v;
    wire fifo$in$enq__ENA;
    wire fifo$out$deq__ENA;
    wire fifo$out$deq__RDY;
    wire fifo$out$first__RDY;
    assign RULErespond_rule__ENA = fifo$out$deq__RDY & fifo$out$first__RDY & ind$heard__RDY;
    assign ind$heard__ENA = fifo$out$deq__RDY & fifo$out$first__RDY;
    Fifo1_OC_3 fifo (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(sout$say__ENA & sout$say__RDY),
        .in$enq$v(sout$say$v),
        .in$enq__RDY(sout$say__RDY),
        .out$deq__ENA(fifo$out$first__RDY & ind$heard__RDY),
        .out$deq__RDY(fifo$out$deq__RDY),
        .out$first(ind$heard$v),
        .out$first__RDY(fifo$out$first__RDY));
    assign fifo$in$enq$v = sout$say$v;
    assign fifo$in$enq__ENA = sout$say__ENA & sout$say__RDY;
    assign fifo$out$deq__ENA = fifo$out$first__RDY & ind$heard__RDY;
    // Extra assigments, not to output wires
    assign RULErespond_rule__RDY = fifo$out$deq__RDY & fifo$out$first__RDY & ind$heard__RDY;
endmodule 

`default_nettype wire    // set back to default value
