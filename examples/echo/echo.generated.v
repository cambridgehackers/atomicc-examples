`include "echo.generated.vh"

module l_module_OC_Echo (
    input CLK,
    input nRST,
    input out$say__ENA,
    input [31:0]out$say$v,
    output out$say__RDY,
    output out$heard,
    output [31:0]heard$v,
    output out$heard__ENA,
    output [31:0]heard$v,
    input out$heard__RDY);
    wire out$say__RDY_internal;
    wire fifo$out$deq__RDY;
    wire fifo$out$first__RDY;
    l_module_OC_Fifo1 fifo (
        CLK,
        nRST,
        out$say__ENA_internal,
        out$say$v,
        out$say__RDY_internal,
        respond_rule__ENA_internal,
        fifo$out$deq__RDY,
        ind$out$heard$v,
        fifo$out$first__RDY);
    reg[31:0] pipetemp;
    assign ind$out$heard__ENA = respond_rule__ENA_internal;
    assign out$say__RDY = out$say__RDY_internal;
    assign respond_rule__RDY_internal = (fifo$out$deq__RDY & fifo$out$first__RDY) & ind$out$heard__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
        pipetemp <= 0;
      end // nRST
    end // always @ (posedge CLK)
endmodule 

