`include "atomicc.generated.vh"
`default_nettype none
module MuxPipe (input wire CLK, input wire nRST,
    PipeIn.server in,
    PipeIn.server forward,
    PipeIn.client out);
    PipeIn#(.width(144)) forwardFifo$in();
    PipeOut#(.width(144)) forwardFifo$out();
    Fifo1Base#(.width(144)) forwardFifo (.CLK(CLK), .nRST(nRST),
        .in(forwardFifo$in),
        .out(forwardFifo$out));
    // Extra assigments, not to output wires
    assign forward.enq__RDY = forwardFifo$in.enq__RDY;
    assign forwardFifo$in.enq$v = forward.enq$v;
    assign forwardFifo$in.enq__ENA = forward.enq__ENA;
    assign forwardFifo$out.deq__ENA = ( !in.enq__ENA ) && forwardFifo$out.first__RDY && out.enq__RDY;
    assign in.enq__RDY = ( !forwardFifo$out.first__RDY ) && out.enq__RDY;
    assign out.enq__ENA = in.enq__ENA | ( ( !in.enq__ENA ) && forwardFifo$out.first__RDY && forwardFifo$out.deq__RDY );
    always_comb begin
    out.enq$v = 0;
    unique case(1'b1)
    in.enq__ENA: out.enq$v = in.enq$v;
    ( !in.enq__ENA ) && forwardFifo$out.first__RDY && forwardFifo$out.deq__RDY: out.enq$v = forwardFifo$out.first;
    default:;
    endcase
    end
endmodule

`default_nettype wire    // set back to default value
