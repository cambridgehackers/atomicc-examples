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
    wire in$enq__RDY_internal;
    wire out$deq__RDY_internal;
    reg[9:0] element;
    reg full;
    assign in$enq__RDY_internal = full ^ 1;
    assign out$deq__RDY_internal = full;
    assign out$first = element;
    assign out$first__RDY_internal = full;
    assign in$enq__RDY = in$enq__RDY_internal;
    assign out$deq__RDY = out$deq__RDY_internal;

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
    input say__ENA,
    input [5:0]say$meth,
    input [3:0]say$v,
    output say__RDY,
    output ind$heard__ENA,
    output [5:0]ind$heard$meth,
    output [3:0]ind$heard$v,
    input ind$heard__RDY);
    wire request$say__RDY_internal;
    wire say__RDY_internal;
    wire fifo$out$deq__RDY;
    wire fifo$out$first__RDY;
    l_module_OC_Fifo1_OC_3 fifo (
        CLK,
        nRST,
        request$say__ENA_internal,
        temp_2e_i,
        request$say__RDY_internal,
        respond__ENA_internal,
        fifo$out$deq__RDY,
        temp,
        fifo$out$first__RDY);
    reg fcounter;
    unsigned VERILOG_short counter;
    unsigned VERILOG_short gcounter;
    assign ind$heard$meth = temp$a;
    assign ind$heard$v = temp$b;
    assign ind$heard__ENA = respond__ENA_internal;
    assign respond__RDY_internal = (fifo$out$first__RDY & fifo$out$deq__RDY) & ind$heard__RDY;
    assign say$meth = say$meth;
    assign say$v = say$v;
    assign say__ENA = say__ENA_internal;
    assign say__RDY_internal = say__RDY;
    assign temp_2e_i$a = request$say$meth;
    assign temp_2e_i$b = request$say$v;
    assign request$say__RDY = request$say__RDY_internal;
    assign say__RDY = say__RDY_internal;

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
    wire in$enq__RDY_internal;
    wire out$deq__RDY_internal;
    reg[31:0] element;
    reg full;
    assign in$enq__RDY_internal = full ^ 1;
    assign out$deq__RDY_internal = full;
    assign out$first = element;
    assign out$first__RDY_internal = full;
    assign in$enq__RDY = in$enq__RDY_internal;
    assign out$deq__RDY = out$deq__RDY_internal;

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
    wire ind$heard__RDY_internal;
    assign ind$heard__RDY_internal = 1;
    assign ind$heard__RDY = ind$heard__RDY_internal;
endmodule 

