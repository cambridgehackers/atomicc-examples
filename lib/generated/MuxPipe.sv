`include "mux.generated.vh"

`default_nettype none
module MuxPipe (input wire CLK, input wire nRST,
    PipeIn.server in,
    PipeIn.server forward,
    PipeIn.client out);
    NOCDataH RULE$fifoRule$agg_2e_tmp;
    wire RULE$fifoRule__RDY;
    PipeIn#(.width(144)) forwardFifo$in();
    PipeOut#(.width(144)) forwardFifo$out();
    NOCDataH temp$forward$enq$v;
    NOCDataH temp$in$enq$v;
    Fifo1Base#(.width(144)) forwardFifo (.CLK(CLK), .nRST(nRST),
        .in(forwardFifo$in),
        .out(forwardFifo$out));
    // Extra assigments, not to output wires
    assign RULE$fifoRule$agg_2e_tmp = forwardFifo$out.first;
    assign RULE$fifoRule__RDY = !( ( 0 == ( ( in.enq__ENA != 0 ) ^ 1 ) ) || ( !( forwardFifo$out.first__RDY && out.enq__RDY && forwardFifo$out.deq__RDY ) ) );
    assign forward.enq__RDY = forwardFifo$in.enq__RDY;
    assign forwardFifo$in.enq$v = forward.enq$v;
    assign forwardFifo$in.enq__ENA = forward.enq__ENA;
    assign forwardFifo$out.deq__ENA = RULE$fifoRule__RDY;
    assign in.enq__RDY = !( ( 0 == ( ( forwardFifo$out.first__RDY != 0 ) ^ 1 ) ) || ( !out.enq__RDY ) );
    assign out.enq$v = ( ( in.enq__ENA && in.enq__RDY ) ? in.enq$v : 0 ) | ( RULE$fifoRule__RDY ? forwardFifo$out.first : 0 );
    assign out.enq__ENA = ( in.enq__ENA && ( in.enq__RDY || RULE$fifoRule__RDY ) ) || ( ( !in.enq__ENA ) && RULE$fifoRule__RDY );
    assign temp$forward$enq$v = forward.enq$v;
    assign temp$in$enq$v = in.enq$v;
endmodule

`default_nettype wire    // set back to default value
