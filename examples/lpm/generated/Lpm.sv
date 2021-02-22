`include "atomicc.generated.vh"
`include "lpm.generated.vh"
`default_nettype none
module Lpm (input wire CLK, input wire nRST,
    input wire enter__ENA,
    input wire [32 - 1:0]enter$x,
    output wire enter__RDY,
    input wire write__ENA,
    input wire [32 - 1:0]write$addr,
    input wire [32 - 1:0]write$data,
    output wire write__RDY,
    PipeIn.client outQ);
    logic RULE$enterRule__ENA;
    logic RULE$enterRule__RDY;
    logic RULE$exitRule__ENA;
    logic RULE$exitRule__RDY;
    logic RULE$recircRule__ENA;
    logic RULE$recircRule__RDY;
    ProcessData _RULE$enterRule$agg_2e_tmp;
    logic [4 - 1:0]_RULE$enterRule$ticket;
    logic [32 - 1:0]_RULE$enterRule$x;
    logic [32 - 1:0]_RULE$exitRule$x;
    ProcessData _RULE$exitRule$y;
    ProcessData _RULE$recircRule$agg_2e_tmp;
    logic [32 - 1:0]_RULE$recircRule$x;
    ProcessData _RULE$recircRule$y;
    logic compBuf$allocateTicket__RDY;
    logic compBuf$getTicket__RDY;
    PipeIn#(.width(23)) fifo$in();
    PipeOut#(.width(23)) fifo$out();
    PipeIn#(.width(32)) inQ$in();
    PipeOut#(.width(32)) inQ$out();
    PipeOut#(.width(32)) mem$out();
    logic [32 - 1:0]mem$read$addr;
    logic mem$read__RDY;
    Fifo1Base#(.width(32)) inQ (.CLK(CLK), .nRST(nRST),
        .in(inQ$in),
        .out(inQ$out));
    BufTicket compBuf (.CLK(CLK), .nRST(nRST),
        .getTicket(_RULE$enterRule$ticket),
        .getTicket__RDY(compBuf$getTicket__RDY),
        .allocateTicket__ENA(( ( ( mem$out.first & 1 ) == 1 ) && mem$read__RDY && inQ$out.first__RDY && compBuf$getTicket__RDY && inQ$out.deq__RDY && fifo$in.enq__RDY ) || ( ( ( mem$out.first & 1 ) != 1 ) && ( ( !mem$out.first__RDY ) || ( ( ( !fifo$out.first__RDY ) || ( ( ( !mem$out.deq__RDY ) || ( ( !fifo$out.deq__RDY ) && inQ$out.first__RDY && compBuf$getTicket__RDY && inQ$out.deq__RDY && fifo$in.enq__RDY && mem$read__RDY ) ) && ( mem$out.deq__RDY || ( mem$read__RDY && inQ$out.first__RDY && compBuf$getTicket__RDY && inQ$out.deq__RDY && fifo$in.enq__RDY ) ) ) ) && ( fifo$out.first__RDY || ( mem$read__RDY && inQ$out.first__RDY && compBuf$getTicket__RDY && inQ$out.deq__RDY && fifo$in.enq__RDY ) ) ) ) && ( mem$out.first__RDY || ( mem$read__RDY && inQ$out.first__RDY && compBuf$getTicket__RDY && inQ$out.deq__RDY && fifo$in.enq__RDY ) ) )),
        .allocateTicket__RDY(compBuf$allocateTicket__RDY));
    FifoPipeline1Base#(.width(23)) fifo (.CLK(CLK), .nRST(nRST),
        .in(fifo$in),
        .out(fifo$out));
    LpmMem mem (.CLK(CLK), .nRST(nRST),
        .read__ENA(( ( ( ( mem$out.first & 1 ) == 1 ) && inQ$out.first__RDY && compBuf$getTicket__RDY && compBuf$allocateTicket__RDY && inQ$out.deq__RDY && fifo$in.enq__RDY ) || ( ( ( mem$out.first & 1 ) != 1 ) && ( ( !mem$out.first__RDY ) || ( ( ( !fifo$out.first__RDY ) || ( ( ( !mem$out.deq__RDY ) || ( ( !fifo$out.deq__RDY ) && inQ$out.first__RDY && compBuf$getTicket__RDY && compBuf$allocateTicket__RDY && inQ$out.deq__RDY && fifo$in.enq__RDY ) ) && ( mem$out.deq__RDY || ( inQ$out.first__RDY && compBuf$getTicket__RDY && compBuf$allocateTicket__RDY && inQ$out.deq__RDY && fifo$in.enq__RDY ) ) ) ) && ( fifo$out.first__RDY || ( inQ$out.first__RDY && compBuf$getTicket__RDY && compBuf$allocateTicket__RDY && inQ$out.deq__RDY && fifo$in.enq__RDY ) ) ) ) && ( mem$out.first__RDY || ( inQ$out.first__RDY && compBuf$getTicket__RDY && compBuf$allocateTicket__RDY && inQ$out.deq__RDY && fifo$in.enq__RDY ) ) ) ) | ( ( ( mem$out.first & 1 ) != 1 ) && mem$out.first__RDY && fifo$out.first__RDY && mem$out.deq__RDY && fifo$out.deq__RDY )),
        .read$addr(mem$read$addr),
        .read__RDY(mem$read__RDY),
        .write__ENA(write__ENA),
        .write$addr(write$addr),
        .write$data(write$data),
        .write__RDY(write__RDY),
        .out(mem$out));
    assign enter__RDY = inQ$in.enq__RDY;
    // Extra assigments, not to output wires
    assign RULE$enterRule__ENA = ( !RULE$recircRule__ENA ) && inQ$out.first__RDY && compBuf$getTicket__RDY && compBuf$allocateTicket__RDY && inQ$out.deq__RDY && fifo$in.enq__RDY && mem$read__RDY;
    assign RULE$enterRule__RDY = ( !RULE$recircRule__ENA ) && inQ$out.first__RDY && compBuf$getTicket__RDY && compBuf$allocateTicket__RDY && inQ$out.deq__RDY && fifo$in.enq__RDY && mem$read__RDY;
    assign RULE$exitRule__ENA = ( !RULE$recircRule__ENA ) && mem$out.first__RDY && fifo$out.first__RDY && ( ( mem$out.first & 1 ) == 1 ) && outQ.enq__RDY && mem$out.deq__RDY && fifo$out.deq__RDY;
    assign RULE$exitRule__RDY = ( !RULE$recircRule__ENA ) && mem$out.first__RDY && fifo$out.first__RDY && ( ( mem$out.first & 1 ) == 1 ) && outQ.enq__RDY && mem$out.deq__RDY && fifo$out.deq__RDY;
    assign RULE$recircRule__ENA = ( ( mem$out.first & 1 ) != 1 ) && mem$out.first__RDY && fifo$out.first__RDY && mem$out.deq__RDY && mem$read__RDY && fifo$out.deq__RDY;
    assign RULE$recircRule__RDY = ( ( mem$out.first & 1 ) != 1 ) && mem$out.first__RDY && fifo$out.first__RDY && mem$out.deq__RDY && mem$read__RDY && fifo$out.deq__RDY;
    assign _RULE$enterRule$agg_2e_tmp.IPA = _RULE$enterRule$x[ ( 6 - 1 ) : 0 ];
    assign _RULE$enterRule$agg_2e_tmp.state = 0;
    assign _RULE$enterRule$agg_2e_tmp.ticket = _RULE$enterRule$ticket;
    assign _RULE$enterRule$x = inQ$out.first;
    assign _RULE$exitRule$x = mem$out.first;
    assign _RULE$exitRule$y = fifo$out.first;
    assign _RULE$recircRule$agg_2e_tmp.IPA = _RULE$recircRule$y.IPA;
    assign _RULE$recircRule$agg_2e_tmp.state = _RULE$recircRule$y.state + 3'd1;
    assign _RULE$recircRule$agg_2e_tmp.ticket = _RULE$recircRule$y.ticket;
    assign _RULE$recircRule$x = mem$out.first;
    assign _RULE$recircRule$y = fifo$out.first;
    assign fifo$in.enq__ENA = ( ( ( ( mem$out.first & 1 ) == 1 ) && mem$read__RDY && inQ$out.first__RDY && compBuf$getTicket__RDY && compBuf$allocateTicket__RDY && inQ$out.deq__RDY ) || ( ( ( mem$out.first & 1 ) != 1 ) && ( ( !mem$out.first__RDY ) || ( ( ( !fifo$out.first__RDY ) || ( ( ( !mem$out.deq__RDY ) || ( ( !fifo$out.deq__RDY ) && inQ$out.first__RDY && compBuf$getTicket__RDY && compBuf$allocateTicket__RDY && inQ$out.deq__RDY && mem$read__RDY ) ) && ( mem$out.deq__RDY || ( mem$read__RDY && inQ$out.first__RDY && compBuf$getTicket__RDY && compBuf$allocateTicket__RDY && inQ$out.deq__RDY ) ) ) ) && ( fifo$out.first__RDY || ( mem$read__RDY && inQ$out.first__RDY && compBuf$getTicket__RDY && compBuf$allocateTicket__RDY && inQ$out.deq__RDY ) ) ) ) && ( mem$out.first__RDY || ( mem$read__RDY && inQ$out.first__RDY && compBuf$getTicket__RDY && compBuf$allocateTicket__RDY && inQ$out.deq__RDY ) ) ) ) | ( ( ( mem$out.first & 1 ) != 1 ) && mem$out.first__RDY && fifo$out.first__RDY && mem$out.deq__RDY && mem$read__RDY && fifo$out.deq__RDY );
    assign fifo$out.deq__ENA = ( ( ( mem$out.first & 1 ) != 1 ) && mem$out.first__RDY && fifo$out.first__RDY && mem$out.deq__RDY && mem$read__RDY ) | ( ( ( mem$out.first & 1 ) == 1 ) && mem$out.first__RDY && fifo$out.first__RDY && mem$out.deq__RDY && outQ.enq__RDY );
    assign inQ$in.enq$v = enter$x;
    assign inQ$in.enq__ENA = enter__ENA;
    assign inQ$out.deq__ENA = ( ( ( mem$out.first & 1 ) == 1 ) && mem$read__RDY && inQ$out.first__RDY && compBuf$getTicket__RDY && compBuf$allocateTicket__RDY && fifo$in.enq__RDY ) || ( ( ( mem$out.first & 1 ) != 1 ) && ( ( !mem$out.first__RDY ) || ( ( ( !fifo$out.first__RDY ) || ( ( ( !mem$out.deq__RDY ) || ( ( !fifo$out.deq__RDY ) && inQ$out.first__RDY && compBuf$getTicket__RDY && compBuf$allocateTicket__RDY && fifo$in.enq__RDY && mem$read__RDY ) ) && ( mem$out.deq__RDY || ( mem$read__RDY && inQ$out.first__RDY && compBuf$getTicket__RDY && compBuf$allocateTicket__RDY && fifo$in.enq__RDY ) ) ) ) && ( fifo$out.first__RDY || ( mem$read__RDY && inQ$out.first__RDY && compBuf$getTicket__RDY && compBuf$allocateTicket__RDY && fifo$in.enq__RDY ) ) ) ) && ( mem$out.first__RDY || ( mem$read__RDY && inQ$out.first__RDY && compBuf$getTicket__RDY && compBuf$allocateTicket__RDY && fifo$in.enq__RDY ) ) );
    assign mem$out.deq__ENA = ( ( ( mem$out.first & 1 ) != 1 ) && mem$out.first__RDY && fifo$out.first__RDY && mem$read__RDY && fifo$out.deq__RDY ) | ( ( ( mem$out.first & 1 ) == 1 ) && mem$out.first__RDY && fifo$out.first__RDY && fifo$out.deq__RDY && outQ.enq__RDY );
    assign outQ.enq$v = mem$out.first;
    assign outQ.enq__ENA = ( ( mem$out.first & 1 ) == 1 ) && mem$out.first__RDY && fifo$out.first__RDY && mem$out.deq__RDY && fifo$out.deq__RDY;
    always_comb begin
    fifo$in.enq$v = 0;
    unique case(1'b1)
    ( ( ( mem$out.first & 1 ) == 1 ) && mem$read__RDY && inQ$out.first__RDY && compBuf$getTicket__RDY && compBuf$allocateTicket__RDY && inQ$out.deq__RDY ) || ( ( ( mem$out.first & 1 ) != 1 ) && ( ( !mem$out.first__RDY ) || ( ( ( !fifo$out.first__RDY ) || ( ( ( !mem$out.deq__RDY ) || ( ( !fifo$out.deq__RDY ) && inQ$out.first__RDY && compBuf$getTicket__RDY && compBuf$allocateTicket__RDY && inQ$out.deq__RDY && mem$read__RDY ) ) && ( mem$out.deq__RDY || ( mem$read__RDY && inQ$out.first__RDY && compBuf$getTicket__RDY && compBuf$allocateTicket__RDY && inQ$out.deq__RDY ) ) ) ) && ( fifo$out.first__RDY || ( mem$read__RDY && inQ$out.first__RDY && compBuf$getTicket__RDY && compBuf$allocateTicket__RDY && inQ$out.deq__RDY ) ) ) ) && ( mem$out.first__RDY || ( mem$read__RDY && inQ$out.first__RDY && compBuf$getTicket__RDY && compBuf$allocateTicket__RDY && inQ$out.deq__RDY ) ) ): fifo$in.enq$v = _RULE$enterRule$agg_2e_tmp;
    ( ( mem$out.first & 1 ) != 1 ) && mem$out.first__RDY && fifo$out.first__RDY && mem$out.deq__RDY && mem$read__RDY && fifo$out.deq__RDY: fifo$in.enq$v = _RULE$recircRule$agg_2e_tmp;
    default:;
    endcase
    end
    always_comb begin
    mem$read$addr = 0;
    unique case(1'b1)
    ( ( ( mem$out.first & 1 ) == 1 ) && inQ$out.first__RDY && compBuf$getTicket__RDY && compBuf$allocateTicket__RDY && inQ$out.deq__RDY && fifo$in.enq__RDY ) || ( ( ( mem$out.first & 1 ) != 1 ) && ( ( !mem$out.first__RDY ) || ( ( ( !fifo$out.first__RDY ) || ( ( ( !mem$out.deq__RDY ) || ( ( !fifo$out.deq__RDY ) && inQ$out.first__RDY && compBuf$getTicket__RDY && compBuf$allocateTicket__RDY && inQ$out.deq__RDY && fifo$in.enq__RDY ) ) && ( mem$out.deq__RDY || ( inQ$out.first__RDY && compBuf$getTicket__RDY && compBuf$allocateTicket__RDY && inQ$out.deq__RDY && fifo$in.enq__RDY ) ) ) ) && ( fifo$out.first__RDY || ( inQ$out.first__RDY && compBuf$getTicket__RDY && compBuf$allocateTicket__RDY && inQ$out.deq__RDY && fifo$in.enq__RDY ) ) ) ) && ( mem$out.first__RDY || ( inQ$out.first__RDY && compBuf$getTicket__RDY && compBuf$allocateTicket__RDY && inQ$out.deq__RDY && fifo$in.enq__RDY ) ) ): mem$read$addr = 0 + _RULE$enterRule$x[ 9 : 6 ];
    ( ( mem$out.first & 1 ) != 1 ) && mem$out.first__RDY && fifo$out.first__RDY && mem$out.deq__RDY && fifo$out.deq__RDY: mem$read$addr = mem$out.first + ( ( _RULE$recircRule$y.state == 1 ) ? _RULE$recircRule$y.IPA[ ( 6 - 1 ) : 3 ] : _RULE$recircRule$y.IPA[ ( 3 - 1 ) : 0 ] );
    default:;
    endcase
    end

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (RULE$enterRule__RDY && RULE$enterRule__ENA) begin // RULE$enterRule__ENA
            $display( "enterRule: in %x ticket %x" , _RULE$enterRule$x , _RULE$enterRule$ticket );
        end; // End of RULE$enterRule__ENA
        if (RULE$exitRule__RDY && RULE$exitRule__ENA) begin // RULE$exitRule__ENA
            $display( "exitRule: mem %x fifo: ticket %x IPA %x state %x" , _RULE$exitRule$x , _RULE$exitRule$y.ticket , _RULE$exitRule$y.IPA , _RULE$exitRule$y.state );
        end; // End of RULE$exitRule__ENA
        if (RULE$recircRule__RDY && RULE$recircRule__ENA) begin // RULE$recircRule__ENA
            $display( "recircRule: mem %x fifo: ticket %x IPA %x state %x" , _RULE$recircRule$x , _RULE$recircRule$y.ticket , _RULE$recircRule$y.IPA , _RULE$recircRule$y.state );
        end; // End of RULE$recircRule__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
