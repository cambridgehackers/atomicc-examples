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
    reg [31:0]element;
    reg [7:0]full;
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
    reg [31:0]element$a;
    reg [31:0]element$b;
    reg [31:0]element$c;
    reg [7:0]full;
    assign in$enq__RDY = full ^ 1;
    assign out$deq__RDY = full;
    assign out$first = { element$a , element$b , element$c };
    assign out$first__RDY = full;

    always @( posedge CLK) begin
      if (!nRST) begin
        element$a <= 0;
        element$b <= 0;
        element$c <= 0;
        full <= 0;
      end // nRST
      else begin
        if (in$enq__ENA) begin
            { element$a , element$b , element$c } <= in$enq$v;
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
    reg [7:0]pong;
    wire element1$in$enq__RDY;
    wire element1$out$deq__RDY;
    wire [95:0]element1$out$first;
    wire [31:0]element1$out$first$a;
    wire [31:0]element1$out$first$b;
    wire [31:0]element1$out$first$c;
    wire element1$out$first__RDY;
    wire element2$in$enq__RDY;
    wire element2$out$deq__RDY;
    wire [95:0]element2$out$first;
    wire [31:0]element2$out$first$a;
    wire [31:0]element2$out$first$b;
    wire [31:0]element2$out$first$c;
    wire element2$out$first__RDY;
    // Alias assigments for struct/union elements
    assign element1$out$first$a = element1$out$first[0:31];
    assign element1$out$first$b = element1$out$first[32:63];
    assign element1$out$first$c = element1$out$first[64:95];
    assign element2$out$first$a = element2$out$first[0:31];
    assign element2$out$first$b = element2$out$first[32:63];
    assign element2$out$first$c = element2$out$first[64:95];
    l_module_OC_Fifo1_OC_3 element1 (
        CLK,
        nRST,
        ( pong ^ 1 ) & in$enq__ENA,
        in$enq$v,
        element1$in$enq__RDY,
        ( pong ^ 1 ) & out$deq__ENA,
        element1$out$deq__RDY,
        element1$out$first,
        element1$out$first__RDY);
    l_module_OC_Fifo1_OC_3 element2 (
        CLK,
        nRST,
        pong & in$enq__ENA,
        in$enq$v,
        element2$in$enq__RDY,
        pong & out$deq__ENA,
        element2$out$deq__RDY,
        element2$out$first,
        element2$out$first__RDY);
    assign in$enq__RDY = ( ( pong ^ 1 ) | element2$in$enq__RDY ) & ( pong | element1$in$enq__RDY );
    assign out$deq__RDY = ( ( pong ^ 1 ) | element2$out$deq__RDY ) & ( pong | element1$out$deq__RDY );
    assign out$first = { pong ? element2$out$first$a : element1$out$first$a , pong ? element2$out$first$b : element1$out$first$b , pong ? element2$out$first$c : element1$out$first$c };
    assign out$first__RDY = ( ( pong ^ 1 ) | element2$out$first__RDY ) & ( pong | element1$out$first__RDY );

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
    output out$heard__ENA,
    output [31:0]out$heard$meth,
    output [31:0]out$heard$v,
    input out$heard__RDY,
    input in$say__ENA,
    input [31:0]in$say$meth,
    input [31:0]in$say$v,
    output in$say__RDY);
    reg [31:0]vsize;
    wire fifo0$in$enq__RDY;
    wire fifo0$out$deq__RDY;
    wire [95:0]fifo0$out$first;
    wire [31:0]fifo0$out$first$b;
    wire fifo0$out$first__RDY;
    wire fifo1$in$enq__RDY;
    wire fifo1$out$deq__RDY;
    wire [95:0]fifo1$out$first;
    wire [31:0]fifo1$out$first$b;
    wire fifo1$out$first__RDY;
    wire fifo2$in$enq__RDY;
    wire fifo2$out$deq__RDY;
    wire [95:0]fifo2$out$first;
    wire [31:0]fifo2$out$first$b;
    wire fifo2$out$first__RDY;
    wire fifo3$in$enq__RDY;
    wire fifo3$out$deq__RDY;
    wire [95:0]fifo3$out$first;
    wire [31:0]fifo3$out$first$b;
    wire fifo3$out$first__RDY;
    wire fifo4$in$enq__RDY;
    wire fifo4$out$deq__RDY;
    wire [95:0]fifo4$out$first;
    wire [31:0]fifo4$out$first$b;
    wire fifo4$out$first__RDY;
    wire fifo5$in$enq__RDY;
    wire fifo5$out$deq__RDY;
    wire [95:0]fifo5$out$first;
    wire [31:0]fifo5$out$first$b;
    wire fifo5$out$first__RDY;
    wire fifo6$in$enq__RDY;
    wire fifo6$out$deq__RDY;
    wire [95:0]fifo6$out$first;
    wire [31:0]fifo6$out$first$b;
    wire fifo6$out$first__RDY;
    wire fifo7$in$enq__RDY;
    wire fifo7$out$deq__RDY;
    wire [95:0]fifo7$out$first;
    wire [31:0]fifo7$out$first$b;
    wire fifo7$out$first__RDY;
    wire fifo8$in$enq__RDY;
    wire fifo8$out$deq__RDY;
    wire [95:0]fifo8$out$first;
    wire [31:0]fifo8$out$first$b;
    wire fifo8$out$first__RDY;
    wire fifo9$in$enq__RDY;
    wire fifo9$out$deq__RDY;
    wire [95:0]fifo9$out$first;
    wire [31:0]fifo9$out$first$b;
    wire fifo9$out$first__RDY;
    wire [31:0]in$say__ENA$temp$a;
    wire [31:0]in$say__ENA$temp$c;
    // Alias assigments for struct/union elements
    assign fifo0$out$first$b = fifo0$out$first[32:63];
    assign fifo1$out$first$b = fifo1$out$first[32:63];
    assign fifo2$out$first$b = fifo2$out$first[32:63];
    assign fifo3$out$first$b = fifo3$out$first[32:63];
    assign fifo4$out$first$b = fifo4$out$first[32:63];
    assign fifo5$out$first$b = fifo5$out$first[32:63];
    assign fifo6$out$first$b = fifo6$out$first[32:63];
    assign fifo7$out$first$b = fifo7$out$first[32:63];
    assign fifo8$out$first$b = fifo8$out$first[32:63];
    assign fifo9$out$first$b = fifo9$out$first[32:63];
    l_module_OC_FifoPong fifo0 (
        CLK,
        nRST,
        ( in$say$meth == 0 ) & in$say__ENA,
        { in$say__ENA$temp$a , in$say$v , in$say__ENA$temp$c },
        fifo0$in$enq__RDY,
        respond_rule_0__ENA,
        fifo0$out$deq__RDY,
        fifo0$out$first,
        fifo0$out$first__RDY);
    l_module_OC_FifoPong fifo1 (
        CLK,
        nRST,
        ( in$say$meth == 1 ) & in$say__ENA,
        { in$say__ENA$temp$a , in$say$v , in$say__ENA$temp$c },
        fifo1$in$enq__RDY,
        respond_rule_1__ENA,
        fifo1$out$deq__RDY,
        fifo1$out$first,
        fifo1$out$first__RDY);
    l_module_OC_FifoPong fifo2 (
        CLK,
        nRST,
        ( in$say$meth == 2 ) & in$say__ENA,
        { in$say__ENA$temp$a , in$say$v , in$say__ENA$temp$c },
        fifo2$in$enq__RDY,
        respond_rule_2__ENA,
        fifo2$out$deq__RDY,
        fifo2$out$first,
        fifo2$out$first__RDY);
    l_module_OC_FifoPong fifo3 (
        CLK,
        nRST,
        ( in$say$meth == 3 ) & in$say__ENA,
        { in$say__ENA$temp$a , in$say$v , in$say__ENA$temp$c },
        fifo3$in$enq__RDY,
        respond_rule_3__ENA,
        fifo3$out$deq__RDY,
        fifo3$out$first,
        fifo3$out$first__RDY);
    l_module_OC_FifoPong fifo4 (
        CLK,
        nRST,
        ( in$say$meth == 4 ) & in$say__ENA,
        { in$say__ENA$temp$a , in$say$v , in$say__ENA$temp$c },
        fifo4$in$enq__RDY,
        respond_rule_4__ENA,
        fifo4$out$deq__RDY,
        fifo4$out$first,
        fifo4$out$first__RDY);
    l_module_OC_FifoPong fifo5 (
        CLK,
        nRST,
        ( in$say$meth == 5 ) & in$say__ENA,
        { in$say__ENA$temp$a , in$say$v , in$say__ENA$temp$c },
        fifo5$in$enq__RDY,
        respond_rule_5__ENA,
        fifo5$out$deq__RDY,
        fifo5$out$first,
        fifo5$out$first__RDY);
    l_module_OC_FifoPong fifo6 (
        CLK,
        nRST,
        ( in$say$meth == 6 ) & in$say__ENA,
        { in$say__ENA$temp$a , in$say$v , in$say__ENA$temp$c },
        fifo6$in$enq__RDY,
        respond_rule_6__ENA,
        fifo6$out$deq__RDY,
        fifo6$out$first,
        fifo6$out$first__RDY);
    l_module_OC_FifoPong fifo7 (
        CLK,
        nRST,
        ( in$say$meth == 7 ) & in$say__ENA,
        { in$say__ENA$temp$a , in$say$v , in$say__ENA$temp$c },
        fifo7$in$enq__RDY,
        respond_rule_7__ENA,
        fifo7$out$deq__RDY,
        fifo7$out$first,
        fifo7$out$first__RDY);
    l_module_OC_FifoPong fifo8 (
        CLK,
        nRST,
        ( in$say$meth == 8 ) & in$say__ENA,
        { in$say__ENA$temp$a , in$say$v , in$say__ENA$temp$c },
        fifo8$in$enq__RDY,
        respond_rule_8__ENA,
        fifo8$out$deq__RDY,
        fifo8$out$first,
        fifo8$out$first__RDY);
    l_module_OC_FifoPong fifo9 (
        CLK,
        nRST,
        ( in$say$meth == 9 ) & in$say__ENA,
        { in$say__ENA$temp$a , in$say$v , in$say__ENA$temp$c },
        fifo9$in$enq__RDY,
        respond_rule_9__ENA,
        fifo9$out$deq__RDY,
        fifo9$out$first,
        fifo9$out$first__RDY);
    assign in$say__RDY = ( ( in$say$meth != 0 ) | fifo0$in$enq__RDY ) & ( ( in$say$meth != 1 ) | fifo1$in$enq__RDY ) & ( ( in$say$meth != 2 ) | fifo2$in$enq__RDY ) & ( ( in$say$meth != 3 ) | fifo3$in$enq__RDY ) & ( ( in$say$meth != 4 ) | fifo4$in$enq__RDY ) & ( ( in$say$meth != 5 ) | fifo5$in$enq__RDY ) & ( ( in$say$meth != 6 ) | fifo6$in$enq__RDY ) & ( ( in$say$meth != 7 ) | fifo7$in$enq__RDY ) & ( ( in$say$meth != 8 ) | fifo8$in$enq__RDY ) & ( ( in$say$meth != 9 ) | fifo9$in$enq__RDY );
    assign out$heard$meth = respond_rule_0__ENA ? 0 : respond_rule_1__ENA ? 1 : respond_rule_2__ENA ? 2 : respond_rule_3__ENA ? 3 : respond_rule_4__ENA ? 4 : respond_rule_5__ENA ? 5 : respond_rule_6__ENA ? 6 : respond_rule_7__ENA ? 7 : respond_rule_8__ENA ? 8 : 9;
    assign out$heard$v = respond_rule_0__ENA ? fifo0$out$first$b : respond_rule_1__ENA ? fifo1$out$first$b : respond_rule_2__ENA ? fifo2$out$first$b : respond_rule_3__ENA ? fifo3$out$first$b : respond_rule_4__ENA ? fifo4$out$first$b : respond_rule_5__ENA ? fifo5$out$first$b : respond_rule_6__ENA ? fifo6$out$first$b : respond_rule_7__ENA ? fifo7$out$first$b : respond_rule_8__ENA ? fifo8$out$first$b : fifo9$out$first$b;
    assign out$heard__ENA = respond_rule_0__ENA || respond_rule_1__ENA || respond_rule_2__ENA || respond_rule_3__ENA || respond_rule_4__ENA || respond_rule_5__ENA || respond_rule_6__ENA || respond_rule_7__ENA || respond_rule_8__ENA || respond_rule_9__ENA;
    // assign respond_rule_0__ENA = MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE;
    assign respond_rule_0__RDY = fifo0$out$first__RDY & fifo0$out$deq__RDY & out$heard__RDY;
    // assign respond_rule_1__ENA = MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE;
    assign respond_rule_1__RDY = fifo1$out$first__RDY & fifo1$out$deq__RDY & out$heard__RDY;
    // assign respond_rule_2__ENA = MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE;
    assign respond_rule_2__RDY = fifo2$out$first__RDY & fifo2$out$deq__RDY & out$heard__RDY;
    // assign respond_rule_3__ENA = MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE;
    assign respond_rule_3__RDY = fifo3$out$first__RDY & fifo3$out$deq__RDY & out$heard__RDY;
    // assign respond_rule_4__ENA = MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE;
    assign respond_rule_4__RDY = fifo4$out$first__RDY & fifo4$out$deq__RDY & out$heard__RDY;
    // assign respond_rule_5__ENA = MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE;
    assign respond_rule_5__RDY = fifo5$out$first__RDY & fifo5$out$deq__RDY & out$heard__RDY;
    // assign respond_rule_6__ENA = MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE;
    assign respond_rule_6__RDY = fifo6$out$first__RDY & fifo6$out$deq__RDY & out$heard__RDY;
    // assign respond_rule_7__ENA = MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE;
    assign respond_rule_7__RDY = fifo7$out$first__RDY & fifo7$out$deq__RDY & out$heard__RDY;
    // assign respond_rule_8__ENA = MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE;
    assign respond_rule_8__RDY = fifo8$out$first__RDY & fifo8$out$deq__RDY & out$heard__RDY;
    // assign respond_rule_9__ENA = MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE;
    assign respond_rule_9__RDY = fifo9$out$first__RDY & fifo9$out$deq__RDY & out$heard__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
        vsize <= 0;
      end // nRST
    end // always @ (posedge CLK)
endmodule 

