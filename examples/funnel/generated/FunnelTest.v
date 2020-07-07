`include "funnel.generated.vh"

`default_nettype none
module FunnelTest (input wire CLK, input wire nRST,
    input wire request$say__ENA,
    input wire [32 - 1:0]request$say$v,
    output wire request$say__RDY,
    output wire indication$heard__ENA,
    output wire [32 - 1:0]indication$heard$v,
    input wire indication$heard__RDY);
    reg busy;
    reg busy_delay;
    reg [2 - 1:0]index;
    wire RULE$respond_rule__RDY;
    wire [32 - 1:0]fifoA$in$enq$v;
    wire fifoA$in$enq__ENA;
    wire fifoA$in$enq__RDY;
    wire fifoA$out$deq__RDY;
    wire [32 - 1:0]fifoA$out$first;
    wire fifoA$out$first__RDY;
    wire [32 - 1:0]fifoB$in$enq$v;
    wire fifoB$in$enq__ENA;
    wire fifoB$in$enq__RDY;
    wire fifoB$out$deq__RDY;
    wire [32 - 1:0]fifoB$out$first;
    wire fifoB$out$first__RDY;
    wire [32 - 1:0]fifoC$in$enq$v;
    wire fifoC$in$enq__ENA;
    wire fifoC$in$enq__RDY;
    wire fifoC$out$deq__RDY;
    wire [32 - 1:0]fifoC$out$first;
    wire fifoC$out$first__RDY;
    wire [32 - 1:0]fifoD$in$enq$v;
    wire fifoD$in$enq__ENA;
    wire fifoD$in$enq__RDY;
    wire fifoD$out$deq__RDY;
    wire [32 - 1:0]fifoD$out$first;
    wire fifoD$out$first__RDY;
    wire [32 - 1:0]funnel$out$enq$v;
    wire funnel$out$enq__ENA;
    wire iA$in$deq__ENA;
    wire [32 - 1:0]iA$out$enq$v;
    wire iA$out$enq__ENA;
    wire iB$in$deq__ENA;
    wire [32 - 1:0]iB$out$enq$v;
    wire iB$out$enq__ENA;
    wire iC$in$deq__ENA;
    wire [32 - 1:0]iC$out$enq$v;
    wire iC$out$enq__ENA;
    wire iD$in$deq__ENA;
    wire [32 - 1:0]iD$out$enq$v;
    wire iD$out$enq__ENA;
    wire result$in$enq__RDY;
    wire result$out$deq__RDY;
    wire result$out$first__RDY;
    Fifo1Base#(.width(32)) fifoA (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(fifoA$in$enq__ENA),
        .in$enq$v(fifoA$in$enq$v),
        .in$enq__RDY(fifoA$in$enq__RDY),
        .out$deq__ENA(iA$in$deq__ENA),
        .out$deq__RDY(fifoA$out$deq__RDY),
        .out$first(fifoA$out$first),
        .out$first__RDY(fifoA$out$first__RDY));
    Fifo1Base#(.width(32)) fifoB (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(fifoB$in$enq__ENA),
        .in$enq$v(fifoB$in$enq$v),
        .in$enq__RDY(fifoB$in$enq__RDY),
        .out$deq__ENA(iB$in$deq__ENA),
        .out$deq__RDY(fifoB$out$deq__RDY),
        .out$first(fifoB$out$first),
        .out$first__RDY(fifoB$out$first__RDY));
    Fifo1Base#(.width(32)) fifoC (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(fifoC$in$enq__ENA),
        .in$enq$v(fifoC$in$enq$v),
        .in$enq__RDY(fifoC$in$enq__RDY),
        .out$deq__ENA(iC$in$deq__ENA),
        .out$deq__RDY(fifoC$out$deq__RDY),
        .out$first(fifoC$out$first),
        .out$first__RDY(fifoC$out$first__RDY));
    Fifo1Base#(.width(32)) fifoD (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(fifoD$in$enq__ENA),
        .in$enq$v(fifoD$in$enq$v),
        .in$enq__RDY(fifoD$in$enq__RDY),
        .out$deq__ENA(iD$in$deq__ENA),
        .out$deq__RDY(fifoD$out$deq__RDY),
        .out$first(fifoD$out$first),
        .out$first__RDY(fifoD$out$first__RDY));
    Out2In iA (.CLK(CLK), .nRST(nRST),
        .in$deq__ENA(iA$in$deq__ENA),
        .in$deq__RDY(fifoA$out$deq__RDY),
        .in$first(fifoA$out$first),
        .in$first__RDY(fifoA$out$first__RDY),
        .out$enq__ENA(iA$out$enq__ENA),
        .out$enq$v(iA$out$enq$v),
        .out$enq__RDY(funnel$in$enq__RDY[ 0 ]));
    Out2In iB (.CLK(CLK), .nRST(nRST),
        .in$deq__ENA(iB$in$deq__ENA),
        .in$deq__RDY(fifoB$out$deq__RDY),
        .in$first(fifoB$out$first),
        .in$first__RDY(fifoB$out$first__RDY),
        .out$enq__ENA(iB$out$enq__ENA),
        .out$enq$v(iB$out$enq$v),
        .out$enq__RDY(funnel$in$enq__RDY[ 1 ]));
    Out2In iC (.CLK(CLK), .nRST(nRST),
        .in$deq__ENA(iC$in$deq__ENA),
        .in$deq__RDY(fifoC$out$deq__RDY),
        .in$first(fifoC$out$first),
        .in$first__RDY(fifoC$out$first__RDY),
        .out$enq__ENA(iC$out$enq__ENA),
        .out$enq$v(iC$out$enq$v),
        .out$enq__RDY(funnel$in$enq__RDY[ 2 ]));
    Out2In iD (.CLK(CLK), .nRST(nRST),
        .in$deq__ENA(iD$in$deq__ENA),
        .in$deq__RDY(fifoD$out$deq__RDY),
        .in$first(fifoD$out$first),
        .in$first__RDY(fifoD$out$first__RDY),
        .out$enq__ENA(iD$out$enq__ENA),
        .out$enq$v(iD$out$enq$v),
        .out$enq__RDY(funnel$in$enq__RDY[ 3 ]));
    Funnel#(.funnelWidth(4)) funnel (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(0),
        .in$enq$v(0),
        .in$enq__RDY(),
        .out$enq__ENA(funnel$out$enq__ENA),
        .out$enq$v(funnel$out$enq$v),
        .out$enq__RDY(result$in$enq__RDY));
    Fifo1Base#(.width(32)) result (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(funnel$out$enq__ENA),
        .in$enq$v(funnel$out$enq$v),
        .in$enq__RDY(result$in$enq__RDY),
        .out$deq__ENA(RULE$respond_rule__RDY),
        .out$deq__RDY(result$out$deq__RDY),
        .out$first(indication$heard$v),
        .out$first__RDY(result$out$first__RDY));
    assign fifoA$in$enq$v = request$say$v;
    assign fifoA$in$enq__ENA = request$say__ENA && request$say__RDY && ( index == 0 );
    assign fifoB$in$enq$v = request$say$v;
    assign fifoB$in$enq__ENA = request$say__ENA && request$say__RDY && ( index == 1 );
    assign fifoC$in$enq$v = request$say$v;
    assign fifoC$in$enq__ENA = request$say__ENA && request$say__RDY && ( index == 2 );
    assign fifoD$in$enq$v = request$say$v;
    assign fifoD$in$enq__ENA = request$say__ENA && request$say__RDY && ( index == 3 );
    assign indication$heard__ENA = RULE$respond_rule__RDY;
    assign request$say__RDY = !( busy || ( !( ( fifoA$in$enq__RDY && ( ( fifoB$in$enq__RDY && ( ( fifoC$in$enq__RDY && ( fifoD$in$enq__RDY || ( !( index == 3 ) ) ) ) || ( ( !fifoC$in$enq__RDY ) && ( !( ( fifoD$in$enq__RDY && ( index == 2 ) ) || ( ( !fifoD$in$enq__RDY ) && ( ( index == 3 ) || ( index == 2 ) ) ) ) ) ) ) ) || ( ( !fifoB$in$enq__RDY ) && ( !( ( fifoC$in$enq__RDY && ( ( fifoD$in$enq__RDY && ( index == 1 ) ) || ( ( !fifoD$in$enq__RDY ) && ( ( index == 3 ) || ( index == 1 ) ) ) ) ) || ( ( !fifoC$in$enq__RDY ) && ( ( fifoD$in$enq__RDY && ( ( index == 2 ) || ( index == 1 ) ) ) || ( ( !fifoD$in$enq__RDY ) && ( ( index == 3 ) || ( index == 2 ) || ( index == 1 ) ) ) ) ) ) ) ) ) ) || ( ( !fifoA$in$enq__RDY ) && ( !( ( fifoB$in$enq__RDY && ( ( fifoC$in$enq__RDY && ( ( fifoD$in$enq__RDY && ( index == 0 ) ) || ( ( !fifoD$in$enq__RDY ) && ( ( index == 3 ) || ( index == 0 ) ) ) ) ) || ( ( !fifoC$in$enq__RDY ) && ( ( fifoD$in$enq__RDY && ( ( index == 2 ) || ( index == 0 ) ) ) || ( ( !fifoD$in$enq__RDY ) && ( ( index == 3 ) || ( index == 2 ) || ( index == 0 ) ) ) ) ) ) ) || ( ( !fifoB$in$enq__RDY ) && ( ( fifoC$in$enq__RDY && ( ( fifoD$in$enq__RDY && ( ( index == 1 ) || ( index == 0 ) ) ) || ( ( !fifoD$in$enq__RDY ) && ( ( index == 3 ) || ( index == 1 ) || ( index == 0 ) ) ) ) ) || ( ( !fifoC$in$enq__RDY ) && ( ( fifoD$in$enq__RDY && ( ( index == 2 ) || ( index == 1 ) || ( index == 0 ) ) ) || ( ( !fifoD$in$enq__RDY ) && ( ( index == 3 ) || ( index == 2 ) || ( index == 1 ) || ( index == 0 ) ) ) ) ) ) ) ) ) ) ) ) );
    // Extra assigments, not to output wires
    assign RULE$respond_rule__RDY = result$out$first__RDY && indication$heard__RDY && result$out$deq__RDY;
    assign funnel$in$enq$v[ 0 ] = iA$out$enq$v;
    assign funnel$in$enq$v[ 1 ] = iB$out$enq$v;
    assign funnel$in$enq$v[ 2 ] = iC$out$enq$v;
    assign funnel$in$enq$v[ 3 ] = iD$out$enq$v;
    assign funnel$in$enq__ENA[ 0 ] = iA$out$enq__ENA;
    assign funnel$in$enq__ENA[ 1 ] = iB$out$enq__ENA;
    assign funnel$in$enq__ENA[ 2 ] = iC$out$enq__ENA;
    assign funnel$in$enq__ENA[ 3 ] = iD$out$enq__ENA;

    always @( posedge CLK) begin
      if (!nRST) begin
        busy <= 0;
        busy_delay <= 0;
        index <= 0;
      end // nRST
      else begin
        if (RULE$respond_rule__RDY) begin // RULE$respond_rule__ENA
            $display( "[%s:%d] index %d" , "RULE$respond_rule_block_invoke" , 75 , index );
        end; // End of RULE$respond_rule__ENA
        if (request$say__ENA && request$say__RDY) begin // request$say__ENA
            index <= index + 1;
            $display( "request.say %x index %d" , request$say$v , index );
        end; // End of request$say__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
