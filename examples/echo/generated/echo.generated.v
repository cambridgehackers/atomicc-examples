`include "echo.generated.vh"

module l_module_OC_Echo (input CLK, input nRST,
    input sout$say__ENA,
    input [31:0]sout$say$v,
    output sout$say__RDY,
    output ind$heard__ENA,
    output [31:0]ind$heard$v,
    input ind$heard__RDY);
    wire fifo$out$deq__RDY;
    wire fifo$out$first__RDY;
    wire respond_rule__ENA;
    wire respond_rule__RDY;
    assign respond_rule__ENA = respond_rule__RDY ;
    assign respond_rule__RDY = fifo$out$deq__RDY  & fifo$out$first__RDY  & ind$heard__RDY ;
    l_module_OC_Fifo1 fifo (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(sout$say__ENA),
        .in$enq$v(sout$say$v),
        .in$enq__RDY(sout$say__RDY),
        .out$deq__ENA(respond_rule__ENA),
        .out$deq__RDY(fifo$out$deq__RDY),
        .out$first(ind$heard$v),
        .out$first__RDY(fifo$out$first__RDY));
    assign ind$heard__ENA = respond_rule__ENA ;
endmodule 

module l_module_OC_Fifo1 (input CLK, input nRST,
    input in$enq__ENA,
    input [31:0]in$enq$v,
    output in$enq__RDY,
    input out$deq__ENA,
    output out$deq__RDY,
    output [31:0]out$first,
    output out$first__RDY);
    reg [31:0]element;
    reg full;
    assign in$enq__RDY = 0 == full ;
    assign out$deq__RDY = 0 != full ;
    assign out$first = element ;
    assign out$first__RDY = 0 != full ;

    always @( posedge CLK) begin
      if (!nRST) begin
        element <= 0;
        full <= 0;
      end // nRST
      else begin
        if (in$enq__ENA) begin
            element  <= in$enq$v;
            full  <= 1;
        end; // End of in$enq__ENA
        if (out$deq__ENA) begin
            full  <= 0;
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

