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
    wire RULEexit_rule__ENA;
    wire RULEexit_rule__RDY;
    wire RULErecirc__ENA;
    wire RULErecirc__RDY;
    wire [95:0]fifo$in$enq$v;
    wire fifo$in$enq__ENA;
    wire fifo$in$enq__RDY;
    wire fifo$out$deq__ENA;
    wire fifo$out$deq__RDY;
    wire [95:0]fifo$out$first;
    wire fifo$out$first__RDY;
    wire inQ$in$enq__RDY;
    wire inQ$out$deq__RDY;
    wire [95:0]inQ$out$first;
    wire inQ$out$first__RDY;
    wire [95:0]mem$ifc$req$v;
    wire mem$ifc$req__ENA;
    wire mem$ifc$req__RDY;
    wire mem$ifc$resAccept__ENA;
    wire mem$ifc$resAccept__RDY;
    wire [95:0]mem$ifc$resValue;
    wire mem$ifc$resValue__RDY;
    wire outQ$in$enq__RDY;
    wire outQ$out$deq__RDY;
    wire [95:0]outQ$out$first;
    wire outQ$out$first__RDY;
    wire [31:0]request$say__ENA$temp$c;
    Fifo1old_OC_5 inQ (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(request$say__ENA),
        .in$enq$v({ request$say__ENA$temp$c , request$say$v , request$say$meth }),
        .in$enq__RDY(inQ$in$enq__RDY),
        .out$deq__ENA(inQ$out$first__RDY & fifo$in$enq__RDY & mem$ifc$req__RDY),
        .out$deq__RDY(inQ$out$deq__RDY),
        .out$first(inQ$out$first),
        .out$first__RDY(inQ$out$first__RDY));
    Fifo2 fifo (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(fifo$in$enq__ENA),
        .in$enq$v(fifo$in$enq$v),
        .in$enq__RDY(fifo$in$enq__RDY),
        .out$deq__ENA(fifo$out$deq__ENA),
        .out$deq__RDY(fifo$out$deq__RDY),
        .out$first(fifo$out$first),
        .out$first__RDY(fifo$out$first__RDY));
    Fifo1old_OC_5 outQ (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(fifo$out$first__RDY & mem$ifc$resValue__RDY & mem$ifc$resAccept__RDY & fifo$out$deq__RDY),
        .in$enq$v({ fifo$out$first[ 95 : 64 ] , fifo$out$first[ 63 : 32 ] , fifo$out$first[ 31 : 0 ] }),
        .in$enq__RDY(outQ$in$enq__RDY),
        .out$deq__ENA(outQ$out$first__RDY & ind$heard__RDY),
        .out$deq__RDY(outQ$out$deq__RDY),
        .out$first(outQ$out$first),
        .out$first__RDY(outQ$out$first__RDY));
    LpmMemory mem (.CLK(CLK), .nRST(nRST),
        .ifc$req__ENA(mem$ifc$req__ENA),
        .ifc$req$v(mem$ifc$req$v),
        .ifc$req__RDY(mem$ifc$req__RDY),
        .ifc$resAccept__ENA(mem$ifc$resAccept__ENA),
        .ifc$resAccept__RDY(mem$ifc$resAccept__RDY),
        .ifc$resValue(mem$ifc$resValue),
        .ifc$resValue__RDY(mem$ifc$resValue__RDY));
    assign fifo$in$enq$v = ( ( inQ$out$first__RDY & inQ$out$deq__RDY & fifo$in$enq__RDY & mem$ifc$req__RDY ) ? { inQ$out$first[ 95 : 64 ] , inQ$out$first[ 63 : 32 ] , inQ$out$first[ 31 : 0 ] } : 0 ) | ( ( fifo$out$first__RDY & mem$ifc$resValue__RDY & mem$ifc$resAccept__RDY & fifo$out$deq__RDY & fifo$in$enq__RDY & mem$ifc$req__RDY ) ? { mem$ifc$resValue[ 95 : 64 ] , mem$ifc$resValue[ 63 : 32 ] , mem$ifc$resValue[ 31 : 0 ] } : 0 );
    assign fifo$in$enq__ENA = ( ( inQ$out$first__RDY & inQ$out$deq__RDY ) | ( fifo$out$first__RDY & mem$ifc$resValue__RDY & mem$ifc$resAccept__RDY & fifo$out$deq__RDY ) ) & mem$ifc$req__RDY;
    assign fifo$out$deq__ENA = ( fifo$out$first__RDY & mem$ifc$resValue__RDY & mem$ifc$resAccept__RDY & outQ$in$enq__RDY ) | ( fifo$out$first__RDY & mem$ifc$resValue__RDY & mem$ifc$resAccept__RDY & fifo$in$enq__RDY & mem$ifc$req__RDY );
    assign ind$heard$meth = outQ$out$first[ 31 : 0 ];
    assign ind$heard$v = outQ$out$first[ 63 : 32 ];
    assign ind$heard__ENA = outQ$out$first__RDY & outQ$out$deq__RDY;
    assign mem$ifc$req$v = ( ( inQ$out$first__RDY & inQ$out$deq__RDY & fifo$in$enq__RDY & mem$ifc$req__RDY ) ? { inQ$out$first[ 95 : 64 ] , inQ$out$first[ 63 : 32 ] , inQ$out$first[ 31 : 0 ] } : 0 ) | ( ( fifo$out$first__RDY & mem$ifc$resValue__RDY & mem$ifc$resAccept__RDY & fifo$out$deq__RDY & fifo$in$enq__RDY & mem$ifc$req__RDY ) ? { fifo$out$first[ 95 : 64 ] , fifo$out$first[ 63 : 32 ] , fifo$out$first[ 31 : 0 ] } : 0 );
    assign mem$ifc$req__ENA = ( ( inQ$out$first__RDY & inQ$out$deq__RDY ) | ( fifo$out$first__RDY & mem$ifc$resValue__RDY & mem$ifc$resAccept__RDY & fifo$out$deq__RDY ) ) & fifo$in$enq__RDY;
    assign mem$ifc$resAccept__ENA = ( fifo$out$first__RDY & mem$ifc$resValue__RDY & fifo$out$deq__RDY & outQ$in$enq__RDY ) | ( fifo$out$first__RDY & mem$ifc$resValue__RDY & fifo$out$deq__RDY & fifo$in$enq__RDY & mem$ifc$req__RDY );
    assign request$say__RDY = inQ$in$enq__RDY;
    // Extra assigments, not to output wires
    assign RULEexit_rule__ENA = fifo$out$first__RDY & mem$ifc$resValue__RDY & mem$ifc$resAccept__RDY & fifo$out$deq__RDY & outQ$in$enq__RDY;
    assign RULEexit_rule__RDY = fifo$out$first__RDY & mem$ifc$resValue__RDY & mem$ifc$resAccept__RDY & fifo$out$deq__RDY & outQ$in$enq__RDY;
    assign RULErecirc__ENA = fifo$out$first__RDY & mem$ifc$resValue__RDY & mem$ifc$resAccept__RDY & fifo$out$deq__RDY & fifo$in$enq__RDY & mem$ifc$req__RDY;
    assign RULErecirc__RDY = fifo$out$first__RDY & mem$ifc$resValue__RDY & mem$ifc$resAccept__RDY & fifo$out$deq__RDY & fifo$in$enq__RDY & mem$ifc$req__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
        doneCount <= 0;
      end // nRST
      else begin
        if (inQ$out$first__RDY & inQ$out$deq__RDY & fifo$in$enq__RDY & mem$ifc$req__RDY) begin // RULEenter__ENA
            $display( "enter: (%d, %d)" , inQ$out$first[ 31 : 0 ] , inQ$out$first[ 63 : 32 ] );
        end; // End of RULEenter__ENA
        if (RULEexit_rule__ENA & RULEexit_rule__RDY) begin // RULEexit_rule__ENA
            $display( "exit: (%d, %d)" , fifo$out$first[ 31 : 0 ] , fifo$out$first[ 63 : 32 ] );
        end; // End of RULEexit_rule__ENA
        if (RULErecirc__ENA & RULErecirc__RDY) begin // RULErecirc__ENA
            $display( "recirc: (%d, %d)" , fifo$out$first[ 31 : 0 ] , fifo$out$first[ 63 : 32 ] );
        end; // End of RULErecirc__ENA
        if (outQ$out$first__RDY & outQ$out$deq__RDY & ind$heard__RDY) begin // RULErespond__ENA
            $display( "respond: (%d, %d)" , outQ$out$first[ 31 : 0 ] , outQ$out$first[ 63 : 32 ] );
        end; // End of RULErespond__ENA
        if (request$say__ENA & inQ$in$enq__RDY) begin // request$say__ENA
            $display( "[%s:%d] (%d, %d)" , "request$say" , 90 , request$say$meth , request$say$v );
        end; // End of request$say__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
