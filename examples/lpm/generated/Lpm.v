`include "lpm.generated.vh"

`default_nettype none
module Lpm (input wire CLK, input wire nRST,
    input wire request$enter__ENA,
    input wire [31:0]request$enter$addr,
    output wire request$enter__RDY,
    output wire outQ$enq__ENA,
    output wire [95:0]outQ$enq$v,
    input wire outQ$enq__RDY);
    wire RULE$exit_rule__ENA;
    wire RULE$exit_rule__RDY;
    wire RULE$recirc__ENA;
    wire RULE$recirc__RDY;
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
    wire [31:0]request$enter__ENA$temp$b;
    wire [31:0]request$enter__ENA$temp$c;
    Fifo1Base#(96) inQ (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(request$enter__ENA),
        .in$enq$v({ request$enter__ENA$temp$c , request$enter__ENA$temp$b , request$enter$addr }),
        .in$enq__RDY(inQ$in$enq__RDY),
        .out$deq__ENA(inQ$out$first__RDY & fifo$in$enq__RDY & mem$ifc$req__RDY),
        .out$deq__RDY(inQ$out$deq__RDY),
        .out$first(inQ$out$first),
        .out$first__RDY(inQ$out$first__RDY));
    Fifo1Base#(96) fifo (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(fifo$in$enq__ENA),
        .in$enq$v(fifo$in$enq$v),
        .in$enq__RDY(fifo$in$enq__RDY),
        .out$deq__ENA(fifo$out$deq__ENA),
        .out$deq__RDY(fifo$out$deq__RDY),
        .out$first(fifo$out$first),
        .out$first__RDY(fifo$out$first__RDY));
    LpmMemory mem (.CLK(CLK), .nRST(nRST),
        .ifc$req__ENA(mem$ifc$req__ENA),
        .ifc$req$v(mem$ifc$req$v),
        .ifc$req__RDY(mem$ifc$req__RDY),
        .ifc$resAccept__ENA(mem$ifc$resAccept__ENA),
        .ifc$resAccept__RDY(mem$ifc$resAccept__RDY),
        .ifc$resValue(mem$ifc$resValue),
        .ifc$resValue__RDY(mem$ifc$resValue__RDY));
    assign fifo$in$enq$v = ( ( inQ$out$first__RDY & inQ$out$deq__RDY & fifo$in$enq__RDY & mem$ifc$req__RDY ) ? { inQ$out$first[ 95 : 64 ] , inQ$out$first[ 63 : 32 ] , inQ$out$first[ 31 : 0 ] } : 96'd0 ) | ( ( fifo$out$first__RDY & mem$ifc$resValue__RDY & mem$ifc$resAccept__RDY & fifo$out$deq__RDY & fifo$in$enq__RDY & mem$ifc$req__RDY ) ? mem$ifc$resValue : 96'd0 );
    assign fifo$in$enq__ENA = ( ( inQ$out$first__RDY & inQ$out$deq__RDY ) | ( fifo$out$first__RDY & mem$ifc$resValue__RDY & mem$ifc$resAccept__RDY & fifo$out$deq__RDY ) ) & mem$ifc$req__RDY;
    assign fifo$out$deq__ENA = ( fifo$out$first__RDY & mem$ifc$resValue__RDY & mem$ifc$resAccept__RDY & outQ$enq__RDY ) | ( fifo$out$first__RDY & mem$ifc$resValue__RDY & mem$ifc$resAccept__RDY & fifo$in$enq__RDY & mem$ifc$req__RDY );
    assign mem$ifc$req$v = ( ( inQ$out$first__RDY & inQ$out$deq__RDY & fifo$in$enq__RDY & mem$ifc$req__RDY ) ? { inQ$out$first[ 95 : 64 ] , inQ$out$first[ 63 : 32 ] , inQ$out$first[ 31 : 0 ] } : 96'd0 ) | ( ( fifo$out$first__RDY & mem$ifc$resValue__RDY & mem$ifc$resAccept__RDY & fifo$out$deq__RDY & fifo$in$enq__RDY & mem$ifc$req__RDY ) ? { fifo$out$first[ 95 : 64 ] , fifo$out$first[ 63 : 32 ] , fifo$out$first[ 31 : 0 ] } : 96'd0 );
    assign mem$ifc$req__ENA = ( ( inQ$out$first__RDY & inQ$out$deq__RDY ) | ( fifo$out$first__RDY & mem$ifc$resValue__RDY & mem$ifc$resAccept__RDY & fifo$out$deq__RDY ) ) & fifo$in$enq__RDY;
    assign mem$ifc$resAccept__ENA = ( fifo$out$first__RDY & mem$ifc$resValue__RDY & fifo$out$deq__RDY & outQ$enq__RDY ) | ( fifo$out$first__RDY & mem$ifc$resValue__RDY & fifo$out$deq__RDY & fifo$in$enq__RDY & mem$ifc$req__RDY );
    assign outQ$enq$v = { fifo$out$first[ 95 : 64 ] , fifo$out$first[ 63 : 32 ] , fifo$out$first[ 31 : 0 ] };
    assign outQ$enq__ENA = fifo$out$first__RDY & mem$ifc$resValue__RDY & mem$ifc$resAccept__RDY & fifo$out$deq__RDY;
    assign request$enter__RDY = inQ$in$enq__RDY;
    // Extra assigments, not to output wires
    assign RULE$exit_rule__ENA = fifo$out$first__RDY & mem$ifc$resValue__RDY & mem$ifc$resAccept__RDY & fifo$out$deq__RDY & outQ$enq__RDY;
    assign RULE$exit_rule__RDY = fifo$out$first__RDY & mem$ifc$resValue__RDY & mem$ifc$resAccept__RDY & fifo$out$deq__RDY & outQ$enq__RDY;
    assign RULE$recirc__ENA = fifo$out$first__RDY & mem$ifc$resValue__RDY & mem$ifc$resAccept__RDY & fifo$out$deq__RDY & fifo$in$enq__RDY & mem$ifc$req__RDY;
    assign RULE$recirc__RDY = fifo$out$first__RDY & mem$ifc$resValue__RDY & mem$ifc$resAccept__RDY & fifo$out$deq__RDY & fifo$in$enq__RDY & mem$ifc$req__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (inQ$out$first__RDY & inQ$out$deq__RDY & fifo$in$enq__RDY & mem$ifc$req__RDY) begin // RULE$enter__ENA
            $display( "enter: (%d, %d)" , inQ$out$first[ 31 : 0 ] , inQ$out$first[ 63 : 32 ] );
        end; // End of RULE$enter__ENA
        if (RULE$exit_rule__ENA & RULE$exit_rule__RDY) begin // RULE$exit_rule__ENA
            $display( "exit: (%d, %d)" , fifo$out$first[ 31 : 0 ] , fifo$out$first[ 63 : 32 ] );
        end; // End of RULE$exit_rule__ENA
        if (RULE$recirc__ENA & RULE$recirc__RDY) begin // RULE$recirc__ENA
            $display( "recirc: (%d, %d)" , fifo$out$first[ 31 : 0 ] , fifo$out$first[ 63 : 32 ] );
        end; // End of RULE$recirc__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
