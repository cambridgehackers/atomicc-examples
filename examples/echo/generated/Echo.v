`include "echo.generated.vh"

`default_nettype none
module Echo (input wire CLK, input wire nRST,
    input wire sout$say__ENA,
    input wire [31:0]sout$say$v,
    output wire sout$say__RDY,
    output wire ind$heard__ENA,
    output wire [31:0]ind$heard$v,
    input wire ind$heard__RDY);
    Fifo1_OC_5 fifo (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(sout$say__ENA),
        .in$enq$v(sout$say$v),
        .in$enq__RDY(sout$say__RDY),
        .out$deq__ENA(ind$heard__RDY),
        .out$deq__RDY(ind$heard__ENA),
        .out$first(ind$heard$v),
        .out$first__RDY());
endmodule 

`default_nettype wire    // set back to default value
