`include "ivector.generated.vh"

module l_module_OC_Fifo1 (input CLK, input nRST,
    input in$enq__ENA,
    input [703:0]in$enq$v,
    output in$enq__RDY,
    input out$deq__ENA,
    output out$deq__RDY,
    output [703:0]out$first,
    output out$first__RDY);
    reg [31:0]element$a;
    reg [31:0]element$b;
    reg [31:0]element$c0;
    reg [31:0]element$c1;
    reg [31:0]element$c10;
    reg [31:0]element$c11;
    reg [31:0]element$c12;
    reg [31:0]element$c13;
    reg [31:0]element$c14;
    reg [31:0]element$c15;
    reg [31:0]element$c16;
    reg [31:0]element$c17;
    reg [31:0]element$c18;
    reg [31:0]element$c19;
    reg [31:0]element$c2;
    reg [31:0]element$c3;
    reg [31:0]element$c4;
    reg [31:0]element$c5;
    reg [31:0]element$c6;
    reg [31:0]element$c7;
    reg [31:0]element$c8;
    reg [31:0]element$c9;
    reg full;
    assign in$enq__RDY = 0 == full ;
    assign out$deq__RDY = 0 != full ;
    assign out$first = { element$c19  , element$c18  , element$c17  , element$c16  , element$c15  , element$c14  , element$c13  , element$c12  , element$c11  , element$c10  , element$c9  , element$c8  , element$c7  , element$c6  , element$c5  , element$c4  , element$c3  , element$c2  , element$c1  , element$c0  , element$b  , element$a  };
    assign out$first__RDY = 0 != full ;

    always @( posedge CLK) begin
      if (!nRST) begin
        element$a <= 0;
        element$b <= 0;
        element$c0 <= 0;
        element$c1 <= 0;
        element$c10 <= 0;
        element$c11 <= 0;
        element$c12 <= 0;
        element$c13 <= 0;
        element$c14 <= 0;
        element$c15 <= 0;
        element$c16 <= 0;
        element$c17 <= 0;
        element$c18 <= 0;
        element$c19 <= 0;
        element$c2 <= 0;
        element$c3 <= 0;
        element$c4 <= 0;
        element$c5 <= 0;
        element$c6 <= 0;
        element$c7 <= 0;
        element$c8 <= 0;
        element$c9 <= 0;
        full <= 0;
      end // nRST
      else begin
        if (in$enq__ENA) begin
            { element$c19  , element$c18  , element$c17  , element$c16  , element$c15  , element$c14  , element$c13  , element$c12  , element$c11  , element$c10  , element$c9  , element$c8  , element$c7  , element$c6  , element$c5  , element$c4  , element$c3  , element$c2  , element$c1  , element$c0  , element$b  , element$a  } <= in$enq$v;
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
    input [703:0]in$enq$v,
    output in$enq__RDY,
    input out$deq__ENA,
    output out$deq__RDY,
    output [703:0]out$first,
    output out$first__RDY);
    reg pong;
    wire element1$in$enq__RDY;
    wire element1$out$deq__RDY;
    wire [703:0]element1$out$first;
    wire element1$out$first__RDY;
    wire element2$in$enq__RDY;
    wire element2$out$deq__RDY;
    wire [703:0]element2$out$first;
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
    assign out$first = { pong  ? element2$out$first[703:672]  : element1$out$first[703:672]  , pong  ? element2$out$first[671:640]  : element1$out$first[671:640]  , pong  ? element2$out$first[639:608]  : element1$out$first[639:608]  , pong  ? element2$out$first[607:576]  : element1$out$first[607:576]  , pong  ? element2$out$first[575:544]  : element1$out$first[575:544]  , pong  ? element2$out$first[543:512]  : element1$out$first[543:512]  , pong  ? element2$out$first[511:480]  : element1$out$first[511:480]  , pong  ? element2$out$first[479:448]  : element1$out$first[479:448]  , pong  ? element2$out$first[447:416]  : element1$out$first[447:416]  , pong  ? element2$out$first[415:384]  : element1$out$first[415:384]  , pong  ? element2$out$first[383:352]  : element1$out$first[383:352]  , pong  ? element2$out$first[351:320]  : element1$out$first[351:320]  , pong  ? element2$out$first[319:288]  : element1$out$first[319:288]  , pong  ? element2$out$first[287:256]  : element1$out$first[287:256]  , pong  ? element2$out$first[255:224]  : element1$out$first[255:224]  , pong  ? element2$out$first[223:192]  : element1$out$first[223:192]  , pong  ? element2$out$first[191:160]  : element1$out$first[191:160]  , pong  ? element2$out$first[159:128]  : element1$out$first[159:128]  , pong  ? element2$out$first[127:96]  : element1$out$first[127:96]  , pong  ? element2$out$first[95:64]  : element1$out$first[95:64]  , pong  ? element2$out$first[63:32]  : element1$out$first[63:32]  , pong  ? element2$out$first[31:0]  : element1$out$first[31:0]  };
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
    input [703:0]request$say$v,
    output request$say__RDY,
    output ind$heard__ENA,
    output [703:0]ind$heard$v,
    input ind$heard__RDY);
    wire fifo$out$deq__RDY;
    wire [703:0]fifo$out$first;
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
    assign ind$heard$v = { fifo$out$first[703:672]  , fifo$out$first[671:640]  , fifo$out$first[639:608]  , fifo$out$first[607:576]  , fifo$out$first[575:544]  , fifo$out$first[543:512]  , fifo$out$first[511:480]  , fifo$out$first[479:448]  , fifo$out$first[447:416]  , fifo$out$first[415:384]  , fifo$out$first[383:352]  , fifo$out$first[351:320]  , fifo$out$first[319:288]  , fifo$out$first[287:256]  , fifo$out$first[255:224]  , fifo$out$first[223:192]  , fifo$out$first[191:160]  , fifo$out$first[159:128]  , fifo$out$first[127:96]  , fifo$out$first[95:64]  , fifo$out$first[63:32]  , fifo$out$first[31:0]  };
    assign ind$heard__ENA = respond__ENA ;
endmodule 

