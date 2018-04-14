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
    input request$say__ENA,
    input [95:0]request$say$v,
    output request$say__RDY,
    output ind$heard__ENA,
    output [95:0]ind$heard$v,
    input ind$heard__RDY);
    wire fifo$in$enq__RDY;
    wire fifo$out$deq__RDY;
    wire [95:0]fifo$out$first;
    wire [31:0]fifo$out$first$a;
    wire [31:0]fifo$out$first$b;
    wire [31:0]fifo$out$first$c;
    wire fifo$out$first__RDY;
    // Alias assigments for struct/union elements
    assign fifo$out$first$a = fifo$out$first[0:31];
    assign fifo$out$first$b = fifo$out$first[32:63];
    assign fifo$out$first$c = fifo$out$first[64:95];
    l_module_OC_FifoPong fifo (
        CLK,
        nRST,
        request$say__ENA,
        request$say$v,
        fifo$in$enq__RDY,
        respond__ENA,
        fifo$out$deq__RDY,
        fifo$out$first,
        fifo$out$first__RDY);
    assign ind$heard$v = { fifo$out$first$a , fifo$out$first$b , fifo$out$first$c };
    assign ind$heard__ENA = respond__ENA;
    assign request$say__RDY = fifo$in$enq__RDY;
    // assign respond__ENA = MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE;
    assign respond__RDY = fifo$out$deq__RDY & fifo$out$first__RDY & ind$heard__RDY;
endmodule 

