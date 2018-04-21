`include "precision.generated.vh"

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
    assign in$enq__RDY = full  ^ 1;
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

module l_module_OC_Fifo1_OC_0 (
    input CLK,
    input nRST,
    input in$enq__ENA,
    input [9:0]in$enq$v,
    output in$enq__RDY,
    input out$deq__ENA,
    output out$deq__RDY,
    output [9:0]out$first,
    output out$first__RDY);
    reg [5:0]element$a;
    reg [3:0]element$b;
    reg [7:0]full;
    assign in$enq__RDY = full  ^ 1;
    assign out$deq__RDY = full ;
    assign out$first = { element$a  , element$b  };
    assign out$first__RDY = full ;

    always @( posedge CLK) begin
      if (!nRST) begin
        element$a <= 0;
        element$b <= 0;
        full <= 0;
      end // nRST
      else begin
        if (in$enq__ENA) begin
            { element$a  , element$b  } <= in$enq$v;
            full  <= 1;
        end; // End of in$enq__ENA
        if (out$deq__ENA) begin
            full  <= 0;
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
    output ind$heard__ENA,
    output [5:0]ind$heard$meth,
    output [3:0]ind$heard$v,
    input ind$heard__RDY);
    reg [8:0]counter;
    reg [7:0]fcounter;
    reg [8:0]gcounter;
    wire fifo$out$deq__RDY;
    wire [9:0]fifo$out$first;
    wire fifo$out$first__RDY;
    wire respond__ENA;
    wire respond__RDY;
    assign respond__ENA = respond__RDY ;
    assign respond__RDY = fifo$out$first__RDY  & fifo$out$deq__RDY  & ind$heard__RDY ;
    l_module_OC_Fifo1_OC_0 fifo (
        CLK,
        nRST,
        request$say__ENA,
        { request$say$meth , request$say$v },
        request$say__RDY,
        respond__ENA,
        fifo$out$deq__RDY,
        fifo$out$first,
        fifo$out$first__RDY);
    assign ind$heard$meth = fifo$out$first[5:0] ;
    assign ind$heard$v = fifo$out$first[9:6] ;
    assign ind$heard__ENA = respond__ENA ;

    always @( posedge CLK) begin
      if (!nRST) begin
        counter <= 0;
        fcounter <= 0;
        gcounter <= 0;
      end // nRST
    end // always @ (posedge CLK)
endmodule 

