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
// software: ind
// software: sout
    wire sout$say__RDY_internal;
    wire fifo$out$deq__RDY;
    wire fifo$out$first__RDY;
    l_module_OC_Fifo1 fifo (
        CLK,
        nRST,
        sout$say__ENA_internal,
        sout$say$v,
        sout$say__RDY_internal,
        respond_rule__ENA_internal,
        fifo$out$deq__RDY,
        ind$heard$v,
        fifo$out$first__RDY);
    assign ind$heard__ENA = respond_rule__ENA_internal;
    assign respond_rule__RDY_internal = (fifo$out$deq__RDY & fifo$out$first__RDY) & ind$heard__RDY;
    assign sout$say__RDY = sout$say__RDY_internal;
endmodule 

