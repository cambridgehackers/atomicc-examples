`include "precision.generated.vh"

module l_module_OC_Fifo1 (
    input CLK,
    input nRST,
    input out$deq__ENA,
    output out$deq__RDY,
    input in$enq__ENA,
    input [31:0]in$enq_v,
    output in$enq__RDY,
    output [31:0]out$first,
    output out$first__RDY);
    wire out$deq__RDY_internal;
    wire out$deq__ENA_internal = out$deq__ENA && out$deq__RDY_internal;
    wire in$enq__RDY_internal;
    wire in$enq__ENA_internal = in$enq__ENA && in$enq__RDY_internal;
    reg[31:0] element;
    reg full;
    assign in$enq__RDY = in$enq__RDY_internal;
    assign in$enq__RDY_internal = full ^ 1;
    assign out$deq__RDY = out$deq__RDY_internal;
    assign out$deq__RDY_internal = full;
    assign out$first = element;
    assign out$first__RDY_internal = full;

    always @( posedge CLK) begin
      if (!nRST) begin
        element <= 0;
        full <= 0;
      end // nRST
      else begin
        if (out$deq__ENA_internal) begin
            full <= 0;
        end; // End of out$deq__ENA
        if (in$enq__ENA_internal) begin
            element <= in$enq_v;
            full <= 1;
        end; // End of in$enq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module l_module_OC_Fifo1_OC_0 (
    input CLK,
    input nRST,
    input out$deq__ENA,
    output out$deq__RDY,
    input in$enq__ENA,
    input [9:0]in$enq_v,
    output in$enq__RDY,
    output [9:0]out$first,
    output out$first__RDY);
    wire out$deq__RDY_internal;
    wire out$deq__ENA_internal = out$deq__ENA && out$deq__RDY_internal;
    wire in$enq__RDY_internal;
    wire in$enq__ENA_internal = in$enq__ENA && in$enq__RDY_internal;
    reg[9:0] element;
    reg full;
    assign in$enq__RDY = in$enq__RDY_internal;
    assign in$enq__RDY_internal = full ^ 1;
    assign out$deq__RDY = out$deq__RDY_internal;
    assign out$deq__RDY_internal = full;
    assign out$first = element;
    assign out$first__RDY_internal = full;

    always @( posedge CLK) begin
      if (!nRST) begin
        element <= 0;
        full <= 0;
      end // nRST
      else begin
        if (out$deq__ENA_internal) begin
            full <= 0;
        end; // End of out$deq__ENA
        if (in$enq__ENA_internal) begin
            element <= in$enq_v;
            full <= 1;
        end; // End of in$enq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module l_module_OC_IVector (
    input CLK,
    input nRST,
    input say__ENA,
    input [5:0]say_meth,
    input [3:0]say_v,
    output say__RDY,
    output ind$heard__ENA,
    output [5:0]ind$heard_heard_meth,
    output [3:0]ind$heard_heard_v,
    input ind$heard__RDY);
    wire say__RDY_internal;
    wire say__ENA_internal = say__ENA && say__RDY_internal;
    wire fifo$out$deq__RDY;
    wire [9:0]fifo$out$first;
    wire fifo$out$first__RDY;
    l_module_OC_Fifo1_OC_0 fifo (
        CLK,
        nRST,
        respond__ENA_internal,
        fifo$out$deq__RDY,
        say__ENA_internal,
        temp,
        say__RDY_internal,
        fifo$out$first,
        fifo$out$first__RDY);
    reg fcounter;
    unsigned VERILOG_short counter;
    unsigned VERILOG_short gcounter;
    assign ind$heard__ENA = respond__ENA_internal;
    assign ind$heard_heard_meth = say_meth;
    assign ind$heard_heard_v = say_v;
    assign respond__RDY_internal = (fifo$out$first__RDY & fifo$out$deq__RDY) & ind$heard__RDY;
    assign say__RDY = say__RDY_internal;

    always @( posedge CLK) begin
      if (!nRST) begin
        fcounter <= 0;
        counter <= 0;
        gcounter <= 0;
      end // nRST
    end // always @ (posedge CLK)
endmodule 

