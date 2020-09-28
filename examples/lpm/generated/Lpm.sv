`include "lpm.generated.vh"

`default_nettype none
module Lpm (input wire CLK, input wire nRST,
    input wire enter__ENA,
    input wire [32 - 1:0]enter$x,
    output wire enter__RDY,
    PipeIn.client outQ);
    ProcessData _RULE$enter$agg_2e_tmp;
    logic [32 - 1:0]_RULE$enter$x;
    logic [32 - 1:0]_RULE$exitr$x;
    ProcessData _RULE$exitr$y;
    ProcessData _RULE$recirc$agg_2e_tmp;
    ProcessData _RULE$recirc$y;
    PipeIn#(.width(23)) fifo$in();
    PipeOut#(.width(23)) fifo$out();
    PipeIn#(.width(32)) inQ$in();
    PipeOut#(.width(32)) inQ$out();
    logic [32 - 1:0]mem$req$v;
    logic mem$req__ENA;
    logic mem$req__RDY;
    logic mem$resAccept__ENA;
    logic mem$resAccept__RDY;
    logic mem$resValue__RDY;
    BufTicket compBuf (.CLK(CLK), .nRST(nRST),
        .getTicket(),
        .getTicket__RDY(),
        .allocateTicket__ENA(0),
        .allocateTicket__RDY());
    Fifo1Base#(.width(32)) inQ (.CLK(CLK), .nRST(nRST),
        .in(inQ$in),
        .out(inQ$out));
    FifoB1Base#(.width(23)) fifo (.CLK(CLK), .nRST(nRST),
        .in(fifo$in),
        .out(fifo$out));
    LpmMemory mem (.CLK(CLK), .nRST(nRST),
        .req__ENA(mem$req__ENA),
        .req$v(mem$req$v),
        .req__RDY(mem$req__RDY),
        .resAccept__ENA(mem$resAccept__ENA),
        .resAccept__RDY(mem$resAccept__RDY),
        .resValue(_RULE$exitr$x),
        .resValue__RDY(mem$resValue__RDY));
    assign enter__RDY = inQ$in.enq__RDY;
    assign mem$req__ENA = ( !( ( 0 == ( ( ( _RULE$exitr$x & 1 ) == 1 ) ^ 1 ) ) || ( !( mem$resValue__RDY && fifo$out.first__RDY && mem$resAccept__RDY && fifo$out.deq__RDY && fifo$in.enq__RDY ) ) ) ) | ( !( ( 0 == ( ( ( !( ( 0 == ( ( ( _RULE$exitr$x & 1 ) == 1 ) ^ 1 ) ) || ( !( mem$resValue__RDY && fifo$out.first__RDY && mem$resAccept__RDY && 1 && fifo$out.deq__RDY && fifo$in.enq__RDY ) ) ) ) != 0 ) ^ 1 ) ) || ( !( inQ$out.first__RDY && inQ$out.deq__RDY && fifo$in.enq__RDY ) ) ) );
    assign mem$resAccept__ENA = ( !( ( 0 == ( ( ( _RULE$exitr$x & 1 ) == 1 ) ^ 1 ) ) || ( !( mem$resValue__RDY && fifo$out.first__RDY && mem$req__RDY && fifo$out.deq__RDY && fifo$in.enq__RDY ) ) ) ) | ( ( ( _RULE$exitr$x & 1 ) == 1 ) && ( ( !( ( 0 == ( ( ( _RULE$exitr$x & 1 ) == 1 ) ^ 1 ) ) || ( !( mem$resValue__RDY && fifo$out.first__RDY && 1 && mem$req__RDY && fifo$out.deq__RDY && fifo$in.enq__RDY ) ) ) ) == 0 ) && mem$resValue__RDY && fifo$out.first__RDY && fifo$out.deq__RDY && outQ.enq__RDY );
    // Extra assigments, not to output wires
    assign _RULE$enter$agg_2e_tmp.IPA = _RULE$enter$x[ 15 : 0 ];
    assign _RULE$enter$agg_2e_tmp.state = 0;
    assign _RULE$enter$agg_2e_tmp.ticket = 4'd0;
    assign _RULE$enter$x = inQ$out.first;
    assign _RULE$exitr$y = fifo$out.first;
    assign _RULE$recirc$agg_2e_tmp.IPA = _RULE$recirc$y.IPA;
    assign _RULE$recirc$agg_2e_tmp.state = _RULE$recirc$y.state + 3'd1;
    assign _RULE$recirc$agg_2e_tmp.ticket = _RULE$recirc$y.ticket;
    assign _RULE$recirc$y = fifo$out.first;
    assign fifo$in.enq__ENA = ( !( ( 0 == ( ( ( _RULE$exitr$x & 1 ) == 1 ) ^ 1 ) ) || ( !( mem$resValue__RDY && fifo$out.first__RDY && mem$resAccept__RDY && mem$req__RDY && fifo$out.deq__RDY ) ) ) ) | ( !( ( 0 == ( ( ( !( ( 0 == ( ( ( _RULE$exitr$x & 1 ) == 1 ) ^ 1 ) ) || ( !( mem$resValue__RDY && fifo$out.first__RDY && mem$resAccept__RDY && mem$req__RDY && fifo$out.deq__RDY && 1 ) ) ) ) != 0 ) ^ 1 ) ) || ( !( inQ$out.first__RDY && inQ$out.deq__RDY && mem$req__RDY ) ) ) );
    assign fifo$out.deq__ENA = ( !( ( 0 == ( ( ( _RULE$exitr$x & 1 ) == 1 ) ^ 1 ) ) || ( !( mem$resValue__RDY && fifo$out.first__RDY && mem$resAccept__RDY && mem$req__RDY && fifo$in.enq__RDY ) ) ) ) | ( ( ( _RULE$exitr$x & 1 ) == 1 ) && ( ( !( ( 0 == ( ( ( _RULE$exitr$x & 1 ) == 1 ) ^ 1 ) ) || ( !( mem$resValue__RDY && fifo$out.first__RDY && mem$resAccept__RDY && mem$req__RDY && 1 && fifo$in.enq__RDY ) ) ) ) == 0 ) && mem$resValue__RDY && fifo$out.first__RDY && mem$resAccept__RDY && outQ.enq__RDY );
    assign inQ$in.enq$v = enter__ENA ? enter$x : 32'd0;
    assign inQ$in.enq__ENA = enter__ENA;
    assign inQ$out.deq__ENA = !( ( 0 == ( ( ( !( ( 0 == ( ( ( _RULE$exitr$x & 1 ) == 1 ) ^ 1 ) ) || ( !( mem$resValue__RDY && fifo$out.first__RDY && mem$resAccept__RDY && mem$req__RDY && fifo$out.deq__RDY && fifo$in.enq__RDY ) ) ) ) != 0 ) ^ 1 ) ) || ( !( inQ$out.first__RDY && fifo$in.enq__RDY && mem$req__RDY ) ) );
    assign outQ.enq$v = ( ( ( _RULE$exitr$x & 1 ) == 1 ) && ( ( !( ( 0 == ( ( ( _RULE$exitr$x & 1 ) == 1 ) ^ 1 ) ) || ( !( mem$resValue__RDY && fifo$out.first__RDY && mem$resAccept__RDY && mem$req__RDY && fifo$out.deq__RDY && fifo$in.enq__RDY ) ) ) ) == 0 ) && mem$resValue__RDY && fifo$out.first__RDY && mem$resAccept__RDY && fifo$out.deq__RDY ) ? _RULE$exitr$x : 32'd0;
    assign outQ.enq__ENA = ( ( _RULE$exitr$x & 1 ) == 1 ) && ( ( !( ( 0 == ( ( ( _RULE$exitr$x & 1 ) == 1 ) ^ 1 ) ) || ( !( mem$resValue__RDY && fifo$out.first__RDY && mem$resAccept__RDY && mem$req__RDY && fifo$out.deq__RDY && fifo$in.enq__RDY ) ) ) ) == 0 ) && mem$resValue__RDY && fifo$out.first__RDY && mem$resAccept__RDY && fifo$out.deq__RDY;
    always_comb begin
    fifo$in.enq$v = 0;
    unique case(1'b1)
    !( ( 0 == ( ( ( _RULE$exitr$x & 1 ) == 1 ) ^ 1 ) ) || ( !( mem$resValue__RDY && fifo$out.first__RDY && mem$resAccept__RDY && mem$req__RDY && fifo$out.deq__RDY ) ) ): fifo$in.enq$v = _RULE$recirc$agg_2e_tmp;
    !( ( 0 == ( ( ( !( ( 0 == ( ( ( _RULE$exitr$x & 1 ) == 1 ) ^ 1 ) ) || ( !( mem$resValue__RDY && fifo$out.first__RDY && mem$resAccept__RDY && mem$req__RDY && fifo$out.deq__RDY && 1 ) ) ) ) != 0 ) ^ 1 ) ) || ( !( inQ$out.first__RDY && inQ$out.deq__RDY && mem$req__RDY ) ) ): fifo$in.enq$v = _RULE$enter$agg_2e_tmp;
    endcase
    end
    always_comb begin
    mem$req$v = 0;
    unique case(1'b1)
    !( ( 0 == ( ( ( _RULE$exitr$x & 1 ) == 1 ) ^ 1 ) ) || ( !( mem$resValue__RDY && fifo$out.first__RDY && mem$resAccept__RDY && fifo$out.deq__RDY && fifo$in.enq__RDY ) ) ): mem$req$v = _RULE$exitr$x + ( ( _RULE$recirc$y.state == 1 ) ? _RULE$recirc$y.IPA[ 15 : 8 ] : _RULE$recirc$y.IPA[ 7 : 0 ] );
    !( ( 0 == ( ( ( !( ( 0 == ( ( ( _RULE$exitr$x & 1 ) == 1 ) ^ 1 ) ) || ( !( mem$resValue__RDY && fifo$out.first__RDY && mem$resAccept__RDY && 1 && fifo$out.deq__RDY && fifo$in.enq__RDY ) ) ) ) != 0 ) ^ 1 ) ) || ( !( inQ$out.first__RDY && inQ$out.deq__RDY && fifo$in.enq__RDY ) ) ): mem$req$v = 0 + _RULE$enter$x[ 31 : 16 ];
    endcase
    end
endmodule

`default_nettype wire    // set back to default value
