`include "precision.generated.vh"

module l_class_OC_Fifo1 (
    input CLK,
    input nRST,
    input out$deq__ENA,
    output out$deq__RDY,
    input in$enq__ENA,
    input [31:0]in$enq_v,
    output in$enq__RDY,
    output [31:0]out$first,
    output out$first__RDY,
    input [`l_class_OC_Fifo1_RULE_COUNT:0]rule_enable,
    output [`l_class_OC_Fifo1_RULE_COUNT:0]rule_ready);
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
            element <= enq_v;
            full <= 1;
        end; // End of in$enq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module l_class_OC_Fifo1_OC_0 (
    input CLK,
    input nRST,
    input out$deq__ENA,
    output out$deq__RDY,
    input in$enq__ENA,
    input [9:0]in$enq_v,
    output in$enq__RDY,
    output [9:0]out$first,
    output out$first__RDY,
    input [`l_class_OC_Fifo1_OC_0_RULE_COUNT:0]rule_enable,
    output [`l_class_OC_Fifo1_OC_0_RULE_COUNT:0]rule_ready);
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
    assign out$first = retval;
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
            element <= enq_v;
            full <= 1;
        end; // End of in$enq__ENA
        if (out$first_internal) begin
            retval <= element;
        end; // End of out$first
      end
    end // always @ (posedge CLK)
endmodule 

module l_class_OC_IVector (
    input CLK,
    input nRST,
    input say__ENA,
    input [5:0]say_meth,
    input [3:0]say_v,
    output say__RDY,
    output ind$heard__ENA,
    output [5:0]ind$heard_heard_meth,
    output [3:0]ind$heard_heard_v,
    input ind$heard__RDY,
    input [`l_class_OC_IVector_RULE_COUNT:0]rule_enable,
    output [`l_class_OC_IVector_RULE_COUNT:0]rule_ready);
    wire respond__RDY_internal;
    wire respond__ENA_internal = rule_enable[0] && respond__RDY_internal;
    wire say__RDY_internal;
    wire say__ENA_internal = say__ENA && say__RDY_internal;
    wire fifo$out$deq__RDY;
    wire [9:0]fifo$out$first;
    wire fifo$out$first__RDY;
    l_class_OC_Fifo1_OC_0 fifo (
        CLK,
        nRST,
        respond__ENA_internal,
        fifo$out$deq__RDY,
        say__ENA_internal,
        temp,
        say__RDY_internal,
        fifo$out$first,
        fifo$out$first__RDY,
        rule_enable[1:`l_class_OC_Fifo1_OC_0_RULE_COUNT],
        rule_ready[1:`l_class_OC_Fifo1_OC_0_RULE_COUNT]);
    reg[:0] fcounter;
    reg[1:0] counter;
    reg[14:0] gcounter;
    assign ind$heard__ENA = respond__ENA_internal;
    assign ind$heard_heard_meth = ((say_meth) & (-1));
    assign ind$heard_heard_v = ((say_v) & (-1));
    assign respond__RDY_internal = (fifo$out$first__RDY & fifo$out$deq__RDY) & ind$heard__RDY;
    assign rule_ready[0] = respond__RDY_internal;
    assign say__RDY = say__RDY_internal;

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (respond__ENA_internal) begin
            gcounter <= gcounter + 1;
        end; // End of respond__ENA
      end
    end // always @ (posedge CLK)
endmodule 

