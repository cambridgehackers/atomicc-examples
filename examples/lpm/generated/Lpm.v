`include "lpm.generated.vh"

`default_nettype none
module Lpm (input wire CLK, input wire nRST,
    output wire ind$heard__ENA,
    output wire [31:0]ind$heard$meth,
    output wire [31:0]ind$heard$v,
    input wire ind$heard__RDY,
    input wire request$say__ENA,
    input wire [31:0]request$say$meth,
    input wire [31:0]request$say$v,
    output wire request$say__RDY);
    reg [31:0]doneCount;
    wire enter__ENA;
    wire exit_rule__ENA;
    wire fifo$in$enq__RDY;
    wire fifo$out$deq__RDY;
    wire [95:0]fifo$out$first;
    wire fifo$out$first__RDY;
    wire inQ$in$enq__RDY;
    wire inQ$out$deq__RDY;
    wire [95:0]inQ$out$first;
    wire inQ$out$first__RDY;
    wire mem$ifc$req__RDY;
    wire mem$ifc$resAccept__RDY;
    wire [95:0]mem$ifc$resValue;
    wire mem$ifc$resValue__RDY;
    wire outQ$in$enq__RDY;
    wire outQ$out$deq__RDY;
    wire [95:0]outQ$out$first;
    wire outQ$out$first__RDY;
    wire recirc__ENA;
    wire [31:0]request$say__ENA$temp$c;
    wire respond__ENA;
    assign enter__ENA = inQ$out$first__RDY & inQ$out$deq__RDY & fifo$in$enq__RDY & mem$ifc$req__RDY;
    assign exit_rule__ENA = fifo$out$first__RDY & mem$ifc$resValue__RDY & mem$ifc$resAccept__RDY & fifo$out$deq__RDY & outQ$in$enq__RDY;
    assign recirc__ENA = fifo$out$first__RDY & mem$ifc$resValue__RDY & mem$ifc$resAccept__RDY & fifo$out$deq__RDY & fifo$in$enq__RDY & mem$ifc$req__RDY;
    assign respond__ENA = outQ$out$first__RDY & outQ$out$deq__RDY & ind$heard__RDY;
    Fifo1_OC_2 inQ (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(request$say__ENA),
        .in$enq$v({ request$say__ENA$temp$c , request$say$v , request$say$meth }),
        .in$enq__RDY(request$say__RDY),
        .out$deq__ENA(inQ$out$first__RDY & fifo$in$enq__RDY & mem$ifc$req__RDY),
        .out$deq__RDY(inQ$out$deq__RDY),
        .out$first(inQ$out$first),
        .out$first__RDY(inQ$out$first__RDY));
    Fifo2 fifo (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(( inQ$out$first__RDY & inQ$out$deq__RDY & mem$ifc$req__RDY ) || ( fifo$out$first__RDY & mem$ifc$resValue__RDY & mem$ifc$resAccept__RDY & fifo$out$deq__RDY & mem$ifc$req__RDY )),
        .in$enq$v(( enter__ENA & inQ$out$first__RDY & inQ$out$deq__RDY & fifo$in$enq__RDY & mem$ifc$req__RDY ) ? { inQ$out$first [ 95 : 64 ] , inQ$out$first [ 63 : 32 ] , inQ$out$first [ 31 : 0 ] } : { mem$ifc$resValue [ 95 : 64 ] , mem$ifc$resValue [ 63 : 32 ] , mem$ifc$resValue [ 31 : 0 ] }),
        .in$enq__RDY(fifo$in$enq__RDY),
        .out$deq__ENA(( fifo$out$first__RDY & mem$ifc$resValue__RDY & mem$ifc$resAccept__RDY & outQ$in$enq__RDY ) || ( fifo$out$first__RDY & mem$ifc$resValue__RDY & mem$ifc$resAccept__RDY & fifo$in$enq__RDY & mem$ifc$req__RDY )),
        .out$deq__RDY(fifo$out$deq__RDY),
        .out$first(fifo$out$first),
        .out$first__RDY(fifo$out$first__RDY));
    Fifo1_OC_2 outQ (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(fifo$out$first__RDY & mem$ifc$resValue__RDY & mem$ifc$resAccept__RDY & fifo$out$deq__RDY),
        .in$enq$v({ fifo$out$first [ 95 : 64 ] , fifo$out$first [ 63 : 32 ] , fifo$out$first [ 31 : 0 ] }),
        .in$enq__RDY(outQ$in$enq__RDY),
        .out$deq__ENA(outQ$out$first__RDY & ind$heard__RDY),
        .out$deq__RDY(outQ$out$deq__RDY),
        .out$first(outQ$out$first),
        .out$first__RDY(outQ$out$first__RDY));
    LpmMemory mem (.CLK(CLK), .nRST(nRST),
        .ifc$req__ENA(( inQ$out$first__RDY & inQ$out$deq__RDY & fifo$in$enq__RDY ) || ( fifo$out$first__RDY & mem$ifc$resValue__RDY & mem$ifc$resAccept__RDY & fifo$out$deq__RDY & fifo$in$enq__RDY )),
        .ifc$req$v(( enter__ENA & inQ$out$first__RDY & inQ$out$deq__RDY & fifo$in$enq__RDY & mem$ifc$req__RDY ) ? { inQ$out$first [ 95 : 64 ] , inQ$out$first [ 63 : 32 ] , inQ$out$first [ 31 : 0 ] } : { fifo$out$first [ 95 : 64 ] , fifo$out$first [ 63 : 32 ] , fifo$out$first [ 31 : 0 ] }),
        .ifc$req__RDY(mem$ifc$req__RDY),
        .ifc$resAccept__ENA(( fifo$out$first__RDY & mem$ifc$resValue__RDY & fifo$out$deq__RDY & outQ$in$enq__RDY ) || ( fifo$out$first__RDY & mem$ifc$resValue__RDY & fifo$out$deq__RDY & fifo$in$enq__RDY & mem$ifc$req__RDY )),
        .ifc$resAccept__RDY(mem$ifc$resAccept__RDY),
        .ifc$resValue(mem$ifc$resValue),
        .ifc$resValue__RDY(mem$ifc$resValue__RDY));
    assign ind$heard$meth = outQ$out$first[31:0];
    assign ind$heard$v = outQ$out$first[63:32];
    assign ind$heard__ENA = outQ$out$first__RDY & outQ$out$deq__RDY;
    assign request$say__RDY = inQ$in$enq__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
        doneCount <= 0;
      end // nRST
      else begin
        if (enter__ENA & inQ$out$first__RDY & inQ$out$deq__RDY & fifo$in$enq__RDY & mem$ifc$req__RDY) begin
            $display( "enter: (%d, %d)" , inQ$out$first[31:0] , inQ$out$first[63:32] );
        end; // End of enter__ENA
        if (exit_rule__ENA & fifo$out$first__RDY & mem$ifc$resValue__RDY & mem$ifc$resAccept__RDY & fifo$out$deq__RDY & outQ$in$enq__RDY) begin
            $display( "exit: (%d, %d)" , fifo$out$first[31:0] , fifo$out$first[63:32] );
        end; // End of exit_rule__ENA
        if (recirc__ENA & fifo$out$first__RDY & mem$ifc$resValue__RDY & mem$ifc$resAccept__RDY & fifo$out$deq__RDY & fifo$in$enq__RDY & mem$ifc$req__RDY) begin
            $display( "recirc: (%d, %d)" , fifo$out$first[31:0] , fifo$out$first[63:32] );
        end; // End of recirc__ENA
        if (request$say__ENA & request$say__RDY) begin
            $display( "[%s:%d] (%d, %d)" , "request$say" , 90 , request$say$meth , request$say$v );
        end; // End of request$say__ENA
        if (respond__ENA & outQ$out$first__RDY & outQ$out$deq__RDY & ind$heard__RDY) begin
            $display( "respond: (%d, %d)" , outQ$out$first[31:0] , outQ$out$first[63:32] );
        end; // End of respond__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
