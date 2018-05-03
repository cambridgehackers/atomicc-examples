`include "ivector.generated.vh"

module l_module_OC_Fifo1 (input CLK, input nRST,
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
    reg full;
    assign in$enq__RDY = 0 == full ;
    assign out$deq__RDY = 0 != full ;
    assign out$first = { element$c  , element$b  , element$a  };
    assign out$first__RDY = 0 != full ;

    always @( posedge CLK) begin
      if (!nRST) begin
        element$a <= 0;
        element$b <= 0;
        element$c <= 0;
        full <= 0;
      end // nRST
      else begin
        if (in$enq__ENA) begin
            { element$c  , element$b  , element$a  } <= in$enq$v;
            full  <= 1;
        end; // End of in$enq__ENA
        if (out$deq__ENA) begin
            full  <= 0;
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module l_module_OC_FifoPong (input CLK, input nRST,
    input in$enq__ENA,
    input [95:0]in$enq$v,
    output in$enq__RDY,
    input out$deq__ENA,
    output out$deq__RDY,
    output [95:0]out$first,
    output out$first__RDY);
    reg pong;
    wire element1$in$enq__RDY;
    wire element1$out$deq__RDY;
    wire [95:0]element1$out$first;
    wire element1$out$first__RDY;
    wire element2$in$enq__RDY;
    wire element2$out$deq__RDY;
    wire [95:0]element2$out$first;
    wire element2$out$first__RDY;
    l_module_OC_Fifo1 element1 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(( pong ^ 1 ) & in$enq__ENA),
        .in$enq$v(in$enq$v),
        .in$enq__RDY(element1$in$enq__RDY),
        .out$deq__ENA(( pong ^ 1 ) & out$deq__ENA),
        .out$deq__RDY(element1$out$deq__RDY),
        .out$first(element1$out$first),
        .out$first__RDY(element1$out$first__RDY));
    l_module_OC_Fifo1 element2 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(pong & in$enq__ENA),
        .in$enq$v(in$enq$v),
        .in$enq__RDY(element2$in$enq__RDY),
        .out$deq__ENA(pong & out$deq__ENA),
        .out$deq__RDY(element2$out$deq__RDY),
        .out$first(element2$out$first),
        .out$first__RDY(element2$out$first__RDY));
    assign in$enq__RDY = ( ( pong  ^ 1 ) | element2$in$enq__RDY  ) & ( pong  | element1$in$enq__RDY  );
    assign out$deq__RDY = ( ( pong  ^ 1 ) | element2$out$deq__RDY  ) & ( pong  | element1$out$deq__RDY  );
    assign out$first = { pong  ? element2$out$first[95:64]  : element1$out$first[95:64]  , pong  ? element2$out$first[63:32]  : element1$out$first[63:32]  , pong  ? element2$out$first[31:0]  : element1$out$first[31:0]  };
    assign out$first__RDY = ( ( pong  ^ 1 ) | element2$out$first__RDY  ) & ( pong  | element1$out$first__RDY  );

    always @( posedge CLK) begin
      if (!nRST) begin
        pong <= 0;
      end // nRST
      else begin
        if (out$deq__ENA) begin
            pong  <= pong ^ 1;
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module l_module_OC_IVector (input CLK, input nRST,
    input request$say__ENA,
    input [95:0]request$say$v,
    output request$say__RDY,
    output ind$heard__ENA,
    output [95:0]ind$heard$v,
    input ind$heard__RDY);
    wire fifo$out$deq__RDY;
    wire [95:0]fifo$out$first;
    wire fifo$out$first__RDY;
    wire respond__ENA;
    wire respond__RDY;
    assign respond__ENA = respond__RDY ;
    assign respond__RDY = fifo$out$deq__RDY  & fifo$out$first__RDY  & ind$heard__RDY ;
    l_module_OC_FifoPong fifo (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(request$say__ENA),
        .in$enq$v(request$say$v),
        .in$enq__RDY(request$say__RDY),
        .out$deq__ENA(respond__ENA),
        .out$deq__RDY(fifo$out$deq__RDY),
        .out$first(fifo$out$first),
        .out$first__RDY(fifo$out$first__RDY));
    assign ind$heard$v = { fifo$out$first[95:64]  , fifo$out$first[63:32]  , fifo$out$first[31:0]  };
    assign ind$heard__ENA = respond__ENA ;
endmodule 
