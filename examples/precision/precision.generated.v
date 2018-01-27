`include "precision.generated.vh"

module l_module_OC_Fifo1_OC_3 (
    input CLK,
    input nRST,
    input in$enq__ENA,
    input [9:0]in$enq$v,
    output in$enq__RDY,
    input out$deq__ENA,
    output out$deq__RDY,
    output [9:0]out$first,
    output out$first__RDY);
    reg[9:0] element;
    reg full;
    assign in$enq__RDY = full ^ 1;
    assign out$deq__RDY = full;
    assign out$first = element;
    assign out$first__RDY = full;

    always @( posedge CLK) begin
      if (!nRST) begin
        element <= 0;
        full <= 0;
      end // nRST
      else begin
        if (in$enq__ENA) begin
            element <= in$enq$v;
            full <= 1;
        end; // End of in$enq__ENA
        if (out$deq__ENA) begin
            full <= 0;
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module l_module_OC_IVector (
    input CLK,
    input nRST,
    input request$say__ENA,
    input [5:0]request$say$meth,
    input [3:0]request$say$v,
    output request$say__RDY,
    output ind$heard__ENA,
    output [5:0]ind$heard$meth,
    output [3:0]ind$heard$v,
    input ind$heard__RDY);
    wire fifo$out$deq__RDY;
    wire [9:0]fifo$out$first;
    wire fifo$out$first__RDY;
    l_module_OC_Fifo1_OC_3 fifo (
        CLK,
        nRST,
        request$say__ENA,
        fifo$out$first,
        request$say__RDY,
        respond__ENA,
        fifo$out$deq__RDY,
        fifo$out$first,
        fifo$out$first__RDY);
    reg fcounter;
    reg[8:0] counter;
    reg[8:0] gcounter;
    assign ind$heard$meth = request$say$meth;
    assign ind$heard$v = request$say$v;
    assign ind$heard__ENA = respond__ENA;
    assign respond__RDY = (fifo$out$first__RDY & fifo$out$deq__RDY) & ind$heard__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
        fcounter <= 0;
        counter <= 0;
        gcounter <= 0;
      end // nRST
    end // always @ (posedge CLK)
endmodule 

module l_module_OC_Fifo1 (
    input CLK,
    input nRST,
    input in$enq__ENA,
    input [31:0]in$enq$v,
    output in$enq__RDY,
    input out$deq__ENA,
    output out$deq__RDY,
    output [31:0]out$first,
    output out$first__RDY);
    reg[31:0] element;
    reg full;
    assign in$enq__RDY = full ^ 1;
    assign out$deq__RDY = full;
    assign out$first = element;
    assign out$first__RDY = full;

    always @( posedge CLK) begin
      if (!nRST) begin
        element <= 0;
        full <= 0;
      end // nRST
      else begin
        if (in$enq__ENA) begin
            element <= in$enq$v;
            full <= 1;
        end; // End of in$enq__ENA
        if (out$deq__ENA) begin
            full <= 0;
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module l_module_OC_IVectorInd (
    input CLK,
    input nRST,
    input ind$heard__ENA,
    input [5:0]ind$heard$meth,
    input [3:0]ind$heard$v,
    output ind$heard__RDY);
    assign ind$heard__RDY = 1;
endmodule 

