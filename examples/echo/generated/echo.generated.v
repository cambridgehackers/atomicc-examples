`include "echo.generated.vh"

module Echo (input CLK, input nRST,
    input sout$say__ENA,
    input [31:0]sout$say$v,
    output sout$say__RDY,
    output ind$heard__ENA,
    output [31:0]ind$heard$v,
    input ind$heard__RDY);
    wire CLK, nRST;
    wire fifo$out$deq__RDY;
    wire fifo$out$first__RDY;
    wire respond_rule__ENA;
    wire respond_rule__RDY;
    assign respond_rule__ENA = respond_rule__RDY ;
    assign respond_rule__RDY = fifo$out$deq__RDY  & fifo$out$first__RDY  & ind$heard__RDY ;
    Fifo1_OC_3 fifo (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(sout$say__ENA),
        .in$enq$v(sout$say$v),
        .in$enq__RDY(sout$say__RDY),
        .out$deq__ENA(respond_rule__ENA),
        .out$deq__RDY(fifo$out$deq__RDY),
        .out$first(ind$heard$v),
        .out$first__RDY(fifo$out$first__RDY));
    assign ind$heard__ENA = respond_rule__ENA ;
endmodule 

module Fifo1 (input CLK, input nRST,
    input in$enq__ENA,
    input [127:0]in$enq$v,
    output in$enq__RDY,
    input out$deq__ENA,
    output out$deq__RDY,
    output [127:0]out$first,
    output out$first__RDY);
    wire CLK, nRST;
    reg [31:0]element$data0;
    reg [31:0]element$data1;
    reg [31:0]element$data2;
    reg [31:0]element$data3;
    reg full;
    assign in$enq__RDY = 1;
    assign out$deq__RDY = 1;
    assign out$first = { element$data3  , element$data2  , element$data1  , element$data0  };
    assign out$first__RDY = 1;

    always @( posedge CLK) begin
      if (!nRST) begin
        element$data0 <= 0;
        element$data1 <= 0;
        element$data2 <= 0;
        element$data3 <= 0;
        full <= 0;
      end // nRST
      else begin
        if (in$enq__ENA) begin
            { element$data3  , element$data2  , element$data1  , element$data0  } <= in$enq$v;
            full  <= 1;
        end; // End of in$enq__ENA
        if (out$deq__ENA) begin
            full  <= 0;
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module Fifo1_OC_3 (input CLK, input nRST,
    input in$enq__ENA,
    input [31:0]in$enq$v,
    output in$enq__RDY,
    input out$deq__ENA,
    output out$deq__RDY,
    output [31:0]out$first,
    output out$first__RDY);
    wire CLK, nRST;
    reg [31:0]element;
    reg full;
    assign in$enq__RDY = !full ;
    assign out$deq__RDY = full ;
    assign out$first = element ;
    assign out$first__RDY = full ;

    always @( posedge CLK) begin
      if (!nRST) begin
        element <= 0;
        full <= 0;
      end // nRST
      else begin
        if (in$enq__ENA) begin
            element  <= in$enq$v;
            full  <= 1;
        end; // End of in$enq__ENA
        if (out$deq__ENA) begin
            full  <= 0;
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module MuxPipe (input CLK, input nRST,
    input in$enq__ENA,
    input [127:0]in$enq$v,
    output in$enq__RDY,
    input forward$enq__ENA,
    input [127:0]forward$enq$v,
    output forward$enq__RDY,
    output out$enq__ENA,
    output [127:0]out$enq$v,
    input out$enq__RDY);
    wire CLK, nRST;
    wire fifoRule__ENA;
    wire fifoRule__RDY;
    wire forwardFifo$out$deq__RDY;
    wire [127:0]forwardFifo$out$first;
    wire forwardFifo$out$first__RDY;
    assign fifoRule__ENA = fifoRule__RDY ;
    assign fifoRule__RDY = forwardFifo$out$first__RDY  & out$enq__RDY  & forwardFifo$out$deq__RDY ;
    Fifo1 forwardFifo (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(forward$enq__ENA),
        .in$enq$v(forward$enq$v),
        .in$enq__RDY(forward$enq__RDY),
        .out$deq__ENA(fifoRule__ENA),
        .out$deq__RDY(forwardFifo$out$deq__RDY),
        .out$first(forwardFifo$out$first),
        .out$first__RDY(forwardFifo$out$first__RDY));
    assign in$enq__RDY = out$enq__RDY ;
    assign out$enq$v = fifoRule__ENA  ? { forwardFifo$out$first[127:96]  , forwardFifo$out$first[95:64]  , forwardFifo$out$first[63:32]  , forwardFifo$out$first[31:0]  } : in$enq$v ;
    assign out$enq__ENA = fifoRule__ENA  || in$enq__ENA ;
endmodule 

