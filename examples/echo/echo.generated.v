`include "echo.generated.vh"

module l_module_OC_Echo (
    input CLK,
    input nRST,
    input sout$say__ENA,
    input [31:0]sout$say$v,
    output sout$say__RDY,
    output ind$heard__ENA,
    output [31:0]ind$heard$v,
    input ind$heard__RDY);
// software: sout
// software: ind
    wire fifo$in$enq__RDY;
    wire fifo$out$deq__RDY;
    wire [31:0]fifo$out$first;
    wire fifo$out$first__RDY;
    l_module_OC_Fifo1 fifo (
        CLK,
        nRST,
        sout$say__ENA,
        sout$say$v,
        fifo$in$enq__RDY,
        respond_rule__ENA,
        fifo$out$deq__RDY,
        fifo$out$first,
        fifo$out$first__RDY);
    assign ind$heard$v = fifo$out$first;
    assign ind$heard__ENA = respond_rule__ENA;
    assign sout$say__RDY = fifo$in$enq__RDY;
    // Extra assigments, not to output wires
    assign respond_rule__RDY = fifo$out$deq__RDY & fifo$out$first__RDY & ind$heard__RDY;
endmodule 

