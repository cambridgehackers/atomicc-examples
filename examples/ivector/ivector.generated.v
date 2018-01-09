`include "ivector.generated.vh"

module l_module_OC_Fifo1_OC_3 (
    input CLK,
    input nRST,
    input in$enq__ENA,
    input [95:0]in$enq$v,
    output in$enq__RDY,
    input out$deq__ENA,
    output out$deq__RDY,
    output [95:0]out$first,
    output out$first__RDY);
    wire in$enq__RDY_internal;
    wire out$deq__RDY_internal;
    reg[95:0] element;
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

module l_module_OC_FifoPong (
    input CLK,
    input nRST,
    input deq__ENA,
    output deq__RDY,
    input enq__ENA,
    input [95:0]v,
    output enq__RDY,
    output [95:0]first,
    output first__RDY,
    input in$enq__ENA,
    input [95:0]in$enq$v,
    output in$enq__RDY,
    input out$deq__ENA,
    output out$deq__RDY,
    output [95:0]out$first,
    output out$first__RDY);
    wire deq__RDY_internal;
    wire enq__RDY_internal;
    wire in$enq__RDY_internal;
    wire out$deq__RDY_internal;
    wire element1$in$enq__RDY;
    wire element1$out$deq__RDY;
    wire element1$out$first__RDY;
    l_module_OC_Fifo1_OC_3 element1 (
        CLK,
        nRST,
        enq__ENA_internal,
        element2$in$enq$v,
        element1$in$enq__RDY,
        deq__ENA_internal,
        element1$out$deq__RDY,
        first,
        element1$out$first__RDY);
    wire [95:0]element2$in$enq$v;
    wire element2$in$enq__RDY;
    wire element2$out$deq__RDY;
    wire [95:0]element2$out$first;
    wire element2$out$first__RDY;
    l_module_OC_Fifo1_OC_3 element2 (
        CLK,
        nRST,
        enq__ENA_internal,
        element2$in$enq$v,
        element2$in$enq__RDY,
        deq__ENA_internal,
        element2$out$deq__RDY,
        element2$out$first,
        element2$out$first__RDY);
    reg pong;
    assign deq__RDY_internal = 1;
    assign enq__RDY_internal = 1;
    assign first__RDY_internal = 1;
    assign in$enq$v = in$enq$v;
    assign in$enq__ENA = in$enq__ENA_internal;
    assign in$enq__RDY_internal = in$enq__RDY;
    assign out$deq__ENA = out$deq__ENA_internal;
    assign out$deq__RDY_internal = out$deq__RDY;
    assign out$first = out$first;
    assign out$first__RDY_internal = out$first__RDY;
    assign deq__RDY = deq__RDY_internal;
    assign enq__RDY = enq__RDY_internal;
    assign in$enq__RDY = in$enq__RDY_internal;
    assign out$deq__RDY = out$deq__RDY_internal;

    always @( posedge CLK) begin
      if (!nRST) begin
        pong <= 0;
      end // nRST
      else begin
        if (deq__ENA) begin
            pong <= pong ^ 1;
        end; // End of deq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module l_module_OC_IVector (
    input CLK,
    input nRST,
    input in$say__ENA,
    input [31:0]in$say$meth,
    input [31:0]in$say$v,
    output in$say__RDY,
    output out$heard__ENA,
    output [31:0]out$heard$meth,
    output [31:0]out$heard$v,
    input out$heard__RDY);
    wire in$say__RDY_internal;
    wire fifo0$deq__ENA;
    wire fifo0$deq__RDY;
    wire fifo0$enq__ENA;
    wire [95:0]fifo0$v;
    wire fifo0$enq__RDY;
    wire [95:0]fifo0$first;
    wire fifo0$first__RDY;
    wire fifo0$in$enq__ENA;
    wire [95:0]fifo0$in$enq$v;
    wire fifo0$in$enq__RDY;
    wire fifo0$out$deq__RDY;
    wire [95:0]fifo0$out$first;
    wire fifo0$out$first__RDY;
    l_module_OC_FifoPong fifo0 (
        CLK,
        nRST,
        fifo0$deq__ENA,
        fifo0$deq__RDY,
        fifo0$enq__ENA,
        fifo0$v,
        fifo0$enq__RDY,
        fifo0$first,
        fifo0$first__RDY,
        fifo0$in$enq__ENA,
        fifo0$in$enq$v,
        fifo0$in$enq__RDY,
        respond_rule_0__ENA_internal,
        fifo0$out$deq__RDY,
        fifo0$out$first,
        fifo0$out$first__RDY);
    wire fifo1$deq__ENA;
    wire fifo1$deq__RDY;
    wire fifo1$enq__ENA;
    wire [95:0]fifo1$v;
    wire fifo1$enq__RDY;
    wire [95:0]fifo1$first;
    wire fifo1$first__RDY;
    wire fifo1$in$enq__ENA;
    wire [95:0]fifo1$in$enq$v;
    wire fifo1$in$enq__RDY;
    wire fifo1$out$deq__RDY;
    wire [95:0]fifo1$out$first;
    wire fifo1$out$first__RDY;
    l_module_OC_FifoPong fifo1 (
        CLK,
        nRST,
        fifo1$deq__ENA,
        fifo1$deq__RDY,
        fifo1$enq__ENA,
        fifo1$v,
        fifo1$enq__RDY,
        fifo1$first,
        fifo1$first__RDY,
        fifo1$in$enq__ENA,
        fifo1$in$enq$v,
        fifo1$in$enq__RDY,
        respond_rule_1__ENA_internal,
        fifo1$out$deq__RDY,
        fifo1$out$first,
        fifo1$out$first__RDY);
    wire fifo2$deq__ENA;
    wire fifo2$deq__RDY;
    wire fifo2$enq__ENA;
    wire [95:0]fifo2$v;
    wire fifo2$enq__RDY;
    wire [95:0]fifo2$first;
    wire fifo2$first__RDY;
    wire fifo2$in$enq__ENA;
    wire [95:0]fifo2$in$enq$v;
    wire fifo2$in$enq__RDY;
    wire fifo2$out$deq__RDY;
    wire [95:0]fifo2$out$first;
    wire fifo2$out$first__RDY;
    l_module_OC_FifoPong fifo2 (
        CLK,
        nRST,
        fifo2$deq__ENA,
        fifo2$deq__RDY,
        fifo2$enq__ENA,
        fifo2$v,
        fifo2$enq__RDY,
        fifo2$first,
        fifo2$first__RDY,
        fifo2$in$enq__ENA,
        fifo2$in$enq$v,
        fifo2$in$enq__RDY,
        respond_rule_2__ENA_internal,
        fifo2$out$deq__RDY,
        fifo2$out$first,
        fifo2$out$first__RDY);
    wire fifo3$deq__ENA;
    wire fifo3$deq__RDY;
    wire fifo3$enq__ENA;
    wire [95:0]fifo3$v;
    wire fifo3$enq__RDY;
    wire [95:0]fifo3$first;
    wire fifo3$first__RDY;
    wire fifo3$in$enq__ENA;
    wire [95:0]fifo3$in$enq$v;
    wire fifo3$in$enq__RDY;
    wire fifo3$out$deq__RDY;
    wire [95:0]fifo3$out$first;
    wire fifo3$out$first__RDY;
    l_module_OC_FifoPong fifo3 (
        CLK,
        nRST,
        fifo3$deq__ENA,
        fifo3$deq__RDY,
        fifo3$enq__ENA,
        fifo3$v,
        fifo3$enq__RDY,
        fifo3$first,
        fifo3$first__RDY,
        fifo3$in$enq__ENA,
        fifo3$in$enq$v,
        fifo3$in$enq__RDY,
        respond_rule_3__ENA_internal,
        fifo3$out$deq__RDY,
        fifo3$out$first,
        fifo3$out$first__RDY);
    wire fifo4$deq__ENA;
    wire fifo4$deq__RDY;
    wire fifo4$enq__ENA;
    wire [95:0]fifo4$v;
    wire fifo4$enq__RDY;
    wire [95:0]fifo4$first;
    wire fifo4$first__RDY;
    wire fifo4$in$enq__ENA;
    wire [95:0]fifo4$in$enq$v;
    wire fifo4$in$enq__RDY;
    wire fifo4$out$deq__RDY;
    wire [95:0]fifo4$out$first;
    wire fifo4$out$first__RDY;
    l_module_OC_FifoPong fifo4 (
        CLK,
        nRST,
        fifo4$deq__ENA,
        fifo4$deq__RDY,
        fifo4$enq__ENA,
        fifo4$v,
        fifo4$enq__RDY,
        fifo4$first,
        fifo4$first__RDY,
        fifo4$in$enq__ENA,
        fifo4$in$enq$v,
        fifo4$in$enq__RDY,
        respond_rule_4__ENA_internal,
        fifo4$out$deq__RDY,
        fifo4$out$first,
        fifo4$out$first__RDY);
    wire fifo5$deq__ENA;
    wire fifo5$deq__RDY;
    wire fifo5$enq__ENA;
    wire [95:0]fifo5$v;
    wire fifo5$enq__RDY;
    wire [95:0]fifo5$first;
    wire fifo5$first__RDY;
    wire fifo5$in$enq__ENA;
    wire [95:0]fifo5$in$enq$v;
    wire fifo5$in$enq__RDY;
    wire fifo5$out$deq__RDY;
    wire [95:0]fifo5$out$first;
    wire fifo5$out$first__RDY;
    l_module_OC_FifoPong fifo5 (
        CLK,
        nRST,
        fifo5$deq__ENA,
        fifo5$deq__RDY,
        fifo5$enq__ENA,
        fifo5$v,
        fifo5$enq__RDY,
        fifo5$first,
        fifo5$first__RDY,
        fifo5$in$enq__ENA,
        fifo5$in$enq$v,
        fifo5$in$enq__RDY,
        respond_rule_5__ENA_internal,
        fifo5$out$deq__RDY,
        fifo5$out$first,
        fifo5$out$first__RDY);
    wire fifo6$deq__ENA;
    wire fifo6$deq__RDY;
    wire fifo6$enq__ENA;
    wire [95:0]fifo6$v;
    wire fifo6$enq__RDY;
    wire [95:0]fifo6$first;
    wire fifo6$first__RDY;
    wire fifo6$in$enq__ENA;
    wire [95:0]fifo6$in$enq$v;
    wire fifo6$in$enq__RDY;
    wire fifo6$out$deq__RDY;
    wire [95:0]fifo6$out$first;
    wire fifo6$out$first__RDY;
    l_module_OC_FifoPong fifo6 (
        CLK,
        nRST,
        fifo6$deq__ENA,
        fifo6$deq__RDY,
        fifo6$enq__ENA,
        fifo6$v,
        fifo6$enq__RDY,
        fifo6$first,
        fifo6$first__RDY,
        fifo6$in$enq__ENA,
        fifo6$in$enq$v,
        fifo6$in$enq__RDY,
        respond_rule_6__ENA_internal,
        fifo6$out$deq__RDY,
        fifo6$out$first,
        fifo6$out$first__RDY);
    wire fifo7$deq__ENA;
    wire fifo7$deq__RDY;
    wire fifo7$enq__ENA;
    wire [95:0]fifo7$v;
    wire fifo7$enq__RDY;
    wire [95:0]fifo7$first;
    wire fifo7$first__RDY;
    wire fifo7$in$enq__ENA;
    wire [95:0]fifo7$in$enq$v;
    wire fifo7$in$enq__RDY;
    wire fifo7$out$deq__RDY;
    wire [95:0]fifo7$out$first;
    wire fifo7$out$first__RDY;
    l_module_OC_FifoPong fifo7 (
        CLK,
        nRST,
        fifo7$deq__ENA,
        fifo7$deq__RDY,
        fifo7$enq__ENA,
        fifo7$v,
        fifo7$enq__RDY,
        fifo7$first,
        fifo7$first__RDY,
        fifo7$in$enq__ENA,
        fifo7$in$enq$v,
        fifo7$in$enq__RDY,
        respond_rule_7__ENA_internal,
        fifo7$out$deq__RDY,
        fifo7$out$first,
        fifo7$out$first__RDY);
    wire fifo8$deq__ENA;
    wire fifo8$deq__RDY;
    wire fifo8$enq__ENA;
    wire [95:0]fifo8$v;
    wire fifo8$enq__RDY;
    wire [95:0]fifo8$first;
    wire fifo8$first__RDY;
    wire fifo8$in$enq__ENA;
    wire [95:0]fifo8$in$enq$v;
    wire fifo8$in$enq__RDY;
    wire fifo8$out$deq__RDY;
    wire [95:0]fifo8$out$first;
    wire fifo8$out$first__RDY;
    l_module_OC_FifoPong fifo8 (
        CLK,
        nRST,
        fifo8$deq__ENA,
        fifo8$deq__RDY,
        fifo8$enq__ENA,
        fifo8$v,
        fifo8$enq__RDY,
        fifo8$first,
        fifo8$first__RDY,
        fifo8$in$enq__ENA,
        fifo8$in$enq$v,
        fifo8$in$enq__RDY,
        respond_rule_8__ENA_internal,
        fifo8$out$deq__RDY,
        fifo8$out$first,
        fifo8$out$first__RDY);
    wire fifo9$deq__ENA;
    wire fifo9$deq__RDY;
    wire fifo9$enq__ENA;
    wire [95:0]fifo9$v;
    wire fifo9$enq__RDY;
    wire [95:0]fifo9$first;
    wire fifo9$first__RDY;
    wire fifo9$in$enq__ENA;
    wire [95:0]fifo9$in$enq$v;
    wire fifo9$in$enq__RDY;
    wire fifo9$out$deq__RDY;
    wire fifo9$out$first__RDY;
    l_module_OC_FifoPong fifo9 (
        CLK,
        nRST,
        fifo9$deq__ENA,
        fifo9$deq__RDY,
        fifo9$enq__ENA,
        fifo9$v,
        fifo9$enq__RDY,
        fifo9$first,
        fifo9$first__RDY,
        fifo9$in$enq__ENA,
        fifo9$in$enq$v,
        fifo9$in$enq__RDY,
        respond_rule_9__ENA_internal,
        fifo9$out$deq__RDY,
        temp,
        fifo9$out$first__RDY);
    wire fifo10$deq__ENA;
    wire fifo10$deq__RDY;
    wire fifo10$enq__ENA;
    wire [95:0]fifo10$v;
    wire fifo10$enq__RDY;
    wire [95:0]fifo10$first;
    wire fifo10$first__RDY;
    wire fifo10$in$enq__ENA;
    wire [95:0]fifo10$in$enq$v;
    wire fifo10$in$enq__RDY;
    wire fifo10$out$deq__ENA;
    wire fifo10$out$deq__RDY;
    wire [95:0]fifo10$out$first;
    wire fifo10$out$first__RDY;
    l_module_OC_FifoPong fifo10 (
        CLK,
        nRST,
        fifo10$deq__ENA,
        fifo10$deq__RDY,
        fifo10$enq__ENA,
        fifo10$v,
        fifo10$enq__RDY,
        fifo10$first,
        fifo10$first__RDY,
        fifo10$in$enq__ENA,
        fifo10$in$enq$v,
        fifo10$in$enq__RDY,
        fifo10$out$deq__ENA,
        fifo10$out$deq__RDY,
        fifo10$out$first,
        fifo10$out$first__RDY);
    reg[31:0] vsize;
    assign (in$say$meth == 0 ? fifo0:&fifo1)$in$enq$v = temp_2e_i;
    assign (in$say$meth == 0 ? fifo0:&fifo1)$in$enq__ENA = in$say__ENA_internal;
    assign in$say__RDY_internal = fifo0$in$enq__RDY & fifo1$in$enq__RDY;
    assign out$heard$meth = respond_rule_0__ENA_internal ? 0 : respond_rule_1__ENA_internal ? 1 : respond_rule_2__ENA_internal ? 2 : respond_rule_3__ENA_internal ? 3 : respond_rule_4__ENA_internal ? 4 : respond_rule_5__ENA_internal ? 5 : respond_rule_6__ENA_internal ? 6 : respond_rule_7__ENA_internal ? 7 : respond_rule_8__ENA_internal ? 8 : 9;
    assign out$heard$v = respond_rule_0__ENA_internal ? temp$b : respond_rule_1__ENA_internal ? temp$b : respond_rule_2__ENA_internal ? temp$b : respond_rule_3__ENA_internal ? temp$b : respond_rule_4__ENA_internal ? temp$b : respond_rule_5__ENA_internal ? temp$b : respond_rule_6__ENA_internal ? temp$b : respond_rule_7__ENA_internal ? temp$b : respond_rule_8__ENA_internal ? temp$b : temp$b;
    assign out$heard__ENA = respond_rule_0__ENA_internal || respond_rule_1__ENA_internal || respond_rule_2__ENA_internal || respond_rule_3__ENA_internal || respond_rule_4__ENA_internal || respond_rule_5__ENA_internal || respond_rule_6__ENA_internal || respond_rule_7__ENA_internal || respond_rule_8__ENA_internal || respond_rule_9__ENA_internal;
    assign respond_rule_0__RDY_internal = (fifo0$out$first__RDY & fifo0$out$deq__RDY) & out$heard__RDY;
    assign respond_rule_1__RDY_internal = (fifo1$out$first__RDY & fifo1$out$deq__RDY) & out$heard__RDY;
    assign respond_rule_2__RDY_internal = (fifo2$out$first__RDY & fifo2$out$deq__RDY) & out$heard__RDY;
    assign respond_rule_3__RDY_internal = (fifo3$out$first__RDY & fifo3$out$deq__RDY) & out$heard__RDY;
    assign respond_rule_4__RDY_internal = (fifo4$out$first__RDY & fifo4$out$deq__RDY) & out$heard__RDY;
    assign respond_rule_5__RDY_internal = (fifo5$out$first__RDY & fifo5$out$deq__RDY) & out$heard__RDY;
    assign respond_rule_6__RDY_internal = (fifo6$out$first__RDY & fifo6$out$deq__RDY) & out$heard__RDY;
    assign respond_rule_7__RDY_internal = (fifo7$out$first__RDY & fifo7$out$deq__RDY) & out$heard__RDY;
    assign respond_rule_8__RDY_internal = (fifo8$out$first__RDY & fifo8$out$deq__RDY) & out$heard__RDY;
    assign respond_rule_9__RDY_internal = (fifo9$out$first__RDY & fifo9$out$deq__RDY) & out$heard__RDY;
    assign temp_2e_i$b = in$say$v;
    assign in$say__RDY = in$say__RDY_internal;

    always @( posedge CLK) begin
      if (!nRST) begin
        vsize <= 0;
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

