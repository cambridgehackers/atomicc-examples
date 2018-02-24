`include "ivector.generated.vh"

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
    reg[95:0] element;
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

module l_module_OC_FifoPong (
    input CLK,
    input nRST,
    input in$enq__ENA,
    input [95:0]in$enq$v,
    output in$enq__RDY,
    input out$deq__ENA,
    output out$deq__RDY,
    output [95:0]out$first,
    output out$first__RDY);
    wire [95:0]out$first$retval;
    wire element1$in$enq__RDY;
    wire element1$out$deq__RDY;
    wire [95:0]element1$out$first;
    wire element1$out$first__RDY;
    l_module_OC_Fifo1_OC_3 element1 (
        CLK,
        nRST,
        in$enq__ENA & pong ^ 1,
        in$enq$v,
        element1$in$enq__RDY,
        out$deq__ENA & pong ^ 1,
        element1$out$deq__RDY,
        element1$out$first,
        element1$out$first__RDY);
    wire element2$in$enq__RDY;
    wire element2$out$deq__RDY;
    wire [95:0]element2$out$first;
    wire element2$out$first__RDY;
    l_module_OC_Fifo1_OC_3 element2 (
        CLK,
        nRST,
        in$enq__ENA & pong,
        in$enq$v,
        element2$in$enq__RDY,
        out$deq__ENA & pong,
        element2$out$deq__RDY,
        element2$out$first,
        element2$out$first__RDY);
    reg pong;
    assign in$enq__RDY = (element2$in$enq__RDY | (pong ^ 1)) & (element1$in$enq__RDY | pong);
    assign out$deq__RDY = (element2$out$deq__RDY | (pong ^ 1)) & (element1$out$deq__RDY | pong);
    assign out$first = pong ? element2$out$first : element1$out$first;
    assign out$first__RDY = (element2$out$first__RDY | (pong ^ 1)) & (element1$out$first__RDY | pong);

    always @( posedge CLK) begin
      if (!nRST) begin
        pong <= 0;
      end // nRST
      else begin
        if (out$deq__ENA) begin
            pong <= pong ^ 1;
        end; // End of out$deq__ENA
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
    wire [95:0]in$say__ENA$temp;
    wire [95:0]respond_rule_0__ENA$temp;
    wire [95:0]respond_rule_1__ENA$temp;
    wire [95:0]respond_rule_2__ENA$temp;
    wire [95:0]respond_rule_3__ENA$temp;
    wire [95:0]respond_rule_4__ENA$temp;
    wire [95:0]respond_rule_5__ENA$temp;
    wire [95:0]respond_rule_6__ENA$temp;
    wire [95:0]respond_rule_7__ENA$temp;
    wire [95:0]respond_rule_8__ENA$temp;
    wire [95:0]respond_rule_9__ENA$temp;
    wire fifo0$in$enq__RDY;
    wire fifo0$out$deq__RDY;
    wire fifo0$out$first__RDY;
    l_module_OC_FifoPong fifo0 (
        CLK,
        nRST,
        in$say__ENA & in$say$meth == 0,
        in$say__ENA$temp,
        fifo0$in$enq__RDY,
        respond_rule_0__ENA,
        fifo0$out$deq__RDY,
        respond_rule_0__ENA$temp,
        fifo0$out$first__RDY);
    wire fifo1$in$enq__RDY;
    wire fifo1$out$deq__RDY;
    wire fifo1$out$first__RDY;
    l_module_OC_FifoPong fifo1 (
        CLK,
        nRST,
        in$say__ENA & (in$say$meth == 1) & ((in$say$meth == 0) ^ 1),
        in$say__ENA$temp,
        fifo1$in$enq__RDY,
        respond_rule_1__ENA,
        fifo1$out$deq__RDY,
        respond_rule_1__ENA$temp,
        fifo1$out$first__RDY);
    wire fifo2$in$enq__RDY;
    wire fifo2$out$deq__RDY;
    wire fifo2$out$first__RDY;
    l_module_OC_FifoPong fifo2 (
        CLK,
        nRST,
        in$say__ENA & (in$say$meth == 2) & (((in$say$meth == 1) ^ 1) & ((in$say$meth == 0) ^ 1)),
        in$say__ENA$temp,
        fifo2$in$enq__RDY,
        respond_rule_2__ENA,
        fifo2$out$deq__RDY,
        respond_rule_2__ENA$temp,
        fifo2$out$first__RDY);
    wire fifo3$in$enq__RDY;
    wire fifo3$out$deq__RDY;
    wire fifo3$out$first__RDY;
    l_module_OC_FifoPong fifo3 (
        CLK,
        nRST,
        in$say__ENA & (in$say$meth == 3) & (((in$say$meth == 2) ^ 1) & (((in$say$meth == 1) ^ 1) & ((in$say$meth == 0) ^ 1))),
        in$say__ENA$temp,
        fifo3$in$enq__RDY,
        respond_rule_3__ENA,
        fifo3$out$deq__RDY,
        respond_rule_3__ENA$temp,
        fifo3$out$first__RDY);
    wire fifo4$in$enq__RDY;
    wire fifo4$out$deq__RDY;
    wire fifo4$out$first__RDY;
    l_module_OC_FifoPong fifo4 (
        CLK,
        nRST,
        in$say__ENA & (in$say$meth == 4) & (((in$say$meth == 3) ^ 1) & (((in$say$meth == 2) ^ 1) & (((in$say$meth == 1) ^ 1) & ((in$say$meth == 0) ^ 1)))),
        in$say__ENA$temp,
        fifo4$in$enq__RDY,
        respond_rule_4__ENA,
        fifo4$out$deq__RDY,
        respond_rule_4__ENA$temp,
        fifo4$out$first__RDY);
    wire fifo5$in$enq__RDY;
    wire fifo5$out$deq__RDY;
    wire fifo5$out$first__RDY;
    l_module_OC_FifoPong fifo5 (
        CLK,
        nRST,
        in$say__ENA & (in$say$meth == 5) & (((in$say$meth == 4) ^ 1) & (((in$say$meth == 3) ^ 1) & (((in$say$meth == 2) ^ 1) & (((in$say$meth == 1) ^ 1) & ((in$say$meth == 0) ^ 1))))),
        in$say__ENA$temp,
        fifo5$in$enq__RDY,
        respond_rule_5__ENA,
        fifo5$out$deq__RDY,
        respond_rule_5__ENA$temp,
        fifo5$out$first__RDY);
    wire fifo6$in$enq__RDY;
    wire fifo6$out$deq__RDY;
    wire fifo6$out$first__RDY;
    l_module_OC_FifoPong fifo6 (
        CLK,
        nRST,
        in$say__ENA & (in$say$meth == 6) & (((in$say$meth == 5) ^ 1) & (((in$say$meth == 4) ^ 1) & (((in$say$meth == 3) ^ 1) & (((in$say$meth == 2) ^ 1) & (((in$say$meth == 1) ^ 1) & ((in$say$meth == 0) ^ 1)))))),
        in$say__ENA$temp,
        fifo6$in$enq__RDY,
        respond_rule_6__ENA,
        fifo6$out$deq__RDY,
        respond_rule_6__ENA$temp,
        fifo6$out$first__RDY);
    wire fifo7$in$enq__RDY;
    wire fifo7$out$deq__RDY;
    wire fifo7$out$first__RDY;
    l_module_OC_FifoPong fifo7 (
        CLK,
        nRST,
        in$say__ENA & (in$say$meth == 7) & (((in$say$meth == 6) ^ 1) & (((in$say$meth == 5) ^ 1) & (((in$say$meth == 4) ^ 1) & (((in$say$meth == 3) ^ 1) & (((in$say$meth == 2) ^ 1) & (((in$say$meth == 1) ^ 1) & ((in$say$meth == 0) ^ 1))))))),
        in$say__ENA$temp,
        fifo7$in$enq__RDY,
        respond_rule_7__ENA,
        fifo7$out$deq__RDY,
        respond_rule_7__ENA$temp,
        fifo7$out$first__RDY);
    wire fifo8$in$enq__RDY;
    wire fifo8$out$deq__RDY;
    wire fifo8$out$first__RDY;
    l_module_OC_FifoPong fifo8 (
        CLK,
        nRST,
        in$say__ENA & (in$say$meth == 8) & (((in$say$meth == 7) ^ 1) & (((in$say$meth == 6) ^ 1) & (((in$say$meth == 5) ^ 1) & (((in$say$meth == 4) ^ 1) & (((in$say$meth == 3) ^ 1) & (((in$say$meth == 2) ^ 1) & (((in$say$meth == 1) ^ 1) & ((in$say$meth == 0) ^ 1)))))))),
        in$say__ENA$temp,
        fifo8$in$enq__RDY,
        respond_rule_8__ENA,
        fifo8$out$deq__RDY,
        respond_rule_8__ENA$temp,
        fifo8$out$first__RDY);
    wire fifo9$in$enq__RDY;
    wire fifo9$out$deq__RDY;
    wire fifo9$out$first__RDY;
    l_module_OC_FifoPong fifo9 (
        CLK,
        nRST,
        in$say__ENA & ((in$say$meth == 8) ^ 1) & (((in$say$meth == 7) ^ 1) & (((in$say$meth == 6) ^ 1) & (((in$say$meth == 5) ^ 1) & (((in$say$meth == 4) ^ 1) & (((in$say$meth == 3) ^ 1) & (((in$say$meth == 2) ^ 1) & (((in$say$meth == 1) ^ 1) & ((in$say$meth == 0) ^ 1)))))))),
        in$say__ENA$temp,
        fifo9$in$enq__RDY,
        respond_rule_9__ENA,
        fifo9$out$deq__RDY,
        respond_rule_9__ENA$temp,
        fifo9$out$first__RDY);
    reg[31:0] vsize;
    assign in$say__RDY = (((((((((fifo0$in$enq__RDY | (in$say$meth != 0)) & (fifo1$in$enq__RDY | (((in$say$meth == 1) & ((in$say$meth == 0) ^ 1)) ^ 1))) & (fifo2$in$enq__RDY | (((in$say$meth == 2) & (((in$say$meth == 1) ^ 1) & ((in$say$meth == 0) ^ 1))) ^ 1))) & (fifo3$in$enq__RDY | (((in$say$meth == 3) & (((in$say$meth == 2) ^ 1) & (((in$say$meth == 1) ^ 1) & ((in$say$meth == 0) ^ 1)))) ^ 1))) & (fifo4$in$enq__RDY | (((in$say$meth == 4) & (((in$say$meth == 3) ^ 1) & (((in$say$meth == 2) ^ 1) & (((in$say$meth == 1) ^ 1) & ((in$say$meth == 0) ^ 1))))) ^ 1))) & (fifo5$in$enq__RDY | (((in$say$meth == 5) & (((in$say$meth == 4) ^ 1) & (((in$say$meth == 3) ^ 1) & (((in$say$meth == 2) ^ 1) & (((in$say$meth == 1) ^ 1) & ((in$say$meth == 0) ^ 1)))))) ^ 1))) & (fifo6$in$enq__RDY | (((in$say$meth == 6) & (((in$say$meth == 5) ^ 1) & (((in$say$meth == 4) ^ 1) & (((in$say$meth == 3) ^ 1) & (((in$say$meth == 2) ^ 1) & (((in$say$meth == 1) ^ 1) & ((in$say$meth == 0) ^ 1))))))) ^ 1))) & (fifo7$in$enq__RDY | (((in$say$meth == 7) & (((in$say$meth == 6) ^ 1) & (((in$say$meth == 5) ^ 1) & (((in$say$meth == 4) ^ 1) & (((in$say$meth == 3) ^ 1) & (((in$say$meth == 2) ^ 1) & (((in$say$meth == 1) ^ 1) & ((in$say$meth == 0) ^ 1)))))))) ^ 1))) & (fifo8$in$enq__RDY | (((in$say$meth == 8) & (((in$say$meth == 7) ^ 1) & (((in$say$meth == 6) ^ 1) & (((in$say$meth == 5) ^ 1) & (((in$say$meth == 4) ^ 1) & (((in$say$meth == 3) ^ 1) & (((in$say$meth == 2) ^ 1) & (((in$say$meth == 1) ^ 1) & ((in$say$meth == 0) ^ 1))))))))) ^ 1))) & (fifo9$in$enq__RDY | ((((in$say$meth == 8) ^ 1) & (((in$say$meth == 7) ^ 1) & (((in$say$meth == 6) ^ 1) & (((in$say$meth == 5) ^ 1) & (((in$say$meth == 4) ^ 1) & (((in$say$meth == 3) ^ 1) & (((in$say$meth == 2) ^ 1) & (((in$say$meth == 1) ^ 1) & ((in$say$meth == 0) ^ 1))))))))) ^ 1));
    assign out$heard$meth = respond_rule_0__ENA ? 0 : respond_rule_1__ENA ? 1 : respond_rule_2__ENA ? 2 : respond_rule_3__ENA ? 3 : respond_rule_4__ENA ? 4 : respond_rule_5__ENA ? 5 : respond_rule_6__ENA ? 6 : respond_rule_7__ENA ? 7 : respond_rule_8__ENA ? 8 : 9;
    assign out$heard$v = respond_rule_0__ENA ? respond_rule_0__ENA$temp$b : respond_rule_1__ENA ? respond_rule_1__ENA$temp$b : respond_rule_2__ENA ? respond_rule_2__ENA$temp$b : respond_rule_3__ENA ? respond_rule_3__ENA$temp$b : respond_rule_4__ENA ? respond_rule_4__ENA$temp$b : respond_rule_5__ENA ? respond_rule_5__ENA$temp$b : respond_rule_6__ENA ? respond_rule_6__ENA$temp$b : respond_rule_7__ENA ? respond_rule_7__ENA$temp$b : respond_rule_8__ENA ? respond_rule_8__ENA$temp$b : respond_rule_9__ENA$temp$b;
    assign out$heard__ENA = respond_rule_0__ENA || respond_rule_1__ENA || respond_rule_2__ENA || respond_rule_3__ENA || respond_rule_4__ENA || respond_rule_5__ENA || respond_rule_6__ENA || respond_rule_7__ENA || respond_rule_8__ENA || respond_rule_9__ENA;
    // Extra assigments, not to output wires
    assign in$say__ENA$temp$b = in$say$v;
    assign respond_rule_0__RDY = (fifo0$out$first__RDY & fifo0$out$deq__RDY) & out$heard__RDY;
    assign respond_rule_1__RDY = (fifo1$out$first__RDY & fifo1$out$deq__RDY) & out$heard__RDY;
    assign respond_rule_2__RDY = (fifo2$out$first__RDY & fifo2$out$deq__RDY) & out$heard__RDY;
    assign respond_rule_3__RDY = (fifo3$out$first__RDY & fifo3$out$deq__RDY) & out$heard__RDY;
    assign respond_rule_4__RDY = (fifo4$out$first__RDY & fifo4$out$deq__RDY) & out$heard__RDY;
    assign respond_rule_5__RDY = (fifo5$out$first__RDY & fifo5$out$deq__RDY) & out$heard__RDY;
    assign respond_rule_6__RDY = (fifo6$out$first__RDY & fifo6$out$deq__RDY) & out$heard__RDY;
    assign respond_rule_7__RDY = (fifo7$out$first__RDY & fifo7$out$deq__RDY) & out$heard__RDY;
    assign respond_rule_8__RDY = (fifo8$out$first__RDY & fifo8$out$deq__RDY) & out$heard__RDY;
    assign respond_rule_9__RDY = (fifo9$out$first__RDY & fifo9$out$deq__RDY) & out$heard__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
        vsize <= 0;
      end // nRST
    end // always @ (posedge CLK)
endmodule 

