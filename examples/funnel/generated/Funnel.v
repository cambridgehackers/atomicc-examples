`include "funnel.generated.vh"

`default_nettype none
module Funnel (input wire CLK, input wire nRST,
    input wire request$say__ENA,
    input wire [32 - 1:0]request$say$v,
    output wire request$say__RDY,
    output wire indication$heard__ENA,
    output wire [32 - 1:0]indication$heard$v,
    input wire indication$heard__RDY);
    reg busy;
    reg busy_delay;
    reg [2 - 1:0]index;
    wire RULE$respondA_rule__RDY;
    wire RULE$respondB_rule__RDY;
    wire RULE$respondC_rule__RDY;
    wire RULE$respondD_rule__RDY;
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
    Fifo1Base#(.width(32)) fifoA (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(fifoA$in$enq__ENA),
        .in$enq$v(fifoA$in$enq$v),
        .in$enq__RDY(fifoA$in$enq__RDY),
        .out$deq__ENA(RULE$respondA_rule__RDY),
        .out$deq__RDY(fifoA$out$deq__RDY),
        .out$first(fifoA$out$first),
        .out$first__RDY(fifoA$out$first__RDY));
    Fifo1Base#(.width(32)) fifoB (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(fifoB$in$enq__ENA),
        .in$enq$v(fifoB$in$enq$v),
        .in$enq__RDY(fifoB$in$enq__RDY),
        .out$deq__ENA(RULE$respondB_rule__RDY),
        .out$deq__RDY(fifoB$out$deq__RDY),
        .out$first(fifoB$out$first),
        .out$first__RDY(fifoB$out$first__RDY));
    Fifo1Base#(.width(32)) fifoC (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(fifoC$in$enq__ENA),
        .in$enq$v(fifoC$in$enq$v),
        .in$enq__RDY(fifoC$in$enq__RDY),
        .out$deq__ENA(RULE$respondC_rule__RDY),
        .out$deq__RDY(fifoC$out$deq__RDY),
        .out$first(fifoC$out$first),
        .out$first__RDY(fifoC$out$first__RDY));
    Fifo1Base#(.width(32)) fifoD (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(fifoD$in$enq__ENA),
        .in$enq$v(fifoD$in$enq$v),
        .in$enq__RDY(fifoD$in$enq__RDY),
        .out$deq__ENA(RULE$respondD_rule__RDY),
        .out$deq__RDY(fifoD$out$deq__RDY),
        .out$first(fifoD$out$first),
        .out$first__RDY(fifoD$out$first__RDY));
    assign fifoA$in$enq$v = request$say$v;
    assign fifoA$in$enq__ENA = request$say__ENA && request$say__RDY && ( index == 0 );
    assign fifoB$in$enq$v = request$say$v;
    assign fifoB$in$enq__ENA = request$say__ENA && request$say__RDY && ( index == 1 );
    assign fifoC$in$enq$v = request$say$v;
    assign fifoC$in$enq__ENA = request$say__ENA && request$say__RDY && ( index == 2 );
    assign fifoD$in$enq$v = request$say$v;
    assign fifoD$in$enq__ENA = request$say__ENA && request$say__RDY && ( index == 3 );
    assign indication$heard$v = ( RULE$respondA_rule__RDY ? fifoA$out$first : 32'd0 ) | ( RULE$respondB_rule__RDY ? fifoB$out$first : 32'd0 ) | ( RULE$respondC_rule__RDY ? fifoC$out$first : 32'd0 ) | ( RULE$respondD_rule__RDY ? fifoD$out$first : 32'd0 );
    assign indication$heard__ENA = RULE$respondA_rule__RDY || RULE$respondB_rule__RDY || RULE$respondC_rule__RDY || RULE$respondD_rule__RDY;
    assign request$say__RDY = !( busy || ( !( ( fifoA$in$enq__RDY && ( ( fifoB$in$enq__RDY && ( ( fifoC$in$enq__RDY && ( fifoD$in$enq__RDY || ( !( index == 3 ) ) ) ) || ( ( !fifoC$in$enq__RDY ) && ( !( ( fifoD$in$enq__RDY && ( index == 2 ) ) || ( ( !fifoD$in$enq__RDY ) && ( ( index == 3 ) || ( index == 2 ) ) ) ) ) ) ) ) || ( ( !fifoB$in$enq__RDY ) && ( !( ( fifoC$in$enq__RDY && ( ( fifoD$in$enq__RDY && ( index == 1 ) ) || ( ( !fifoD$in$enq__RDY ) && ( ( index == 3 ) || ( index == 1 ) ) ) ) ) || ( ( !fifoC$in$enq__RDY ) && ( ( fifoD$in$enq__RDY && ( ( index == 2 ) || ( index == 1 ) ) ) || ( ( !fifoD$in$enq__RDY ) && ( ( index == 3 ) || ( index == 2 ) || ( index == 1 ) ) ) ) ) ) ) ) ) ) || ( ( !fifoA$in$enq__RDY ) && ( !( ( fifoB$in$enq__RDY && ( ( fifoC$in$enq__RDY && ( ( fifoD$in$enq__RDY && ( index == 0 ) ) || ( ( !fifoD$in$enq__RDY ) && ( ( index == 3 ) || ( index == 0 ) ) ) ) ) || ( ( !fifoC$in$enq__RDY ) && ( ( fifoD$in$enq__RDY && ( ( index == 2 ) || ( index == 0 ) ) ) || ( ( !fifoD$in$enq__RDY ) && ( ( index == 3 ) || ( index == 2 ) || ( index == 0 ) ) ) ) ) ) ) || ( ( !fifoB$in$enq__RDY ) && ( ( fifoC$in$enq__RDY && ( ( fifoD$in$enq__RDY && ( ( index == 1 ) || ( index == 0 ) ) ) || ( ( !fifoD$in$enq__RDY ) && ( ( index == 3 ) || ( index == 1 ) || ( index == 0 ) ) ) ) ) || ( ( !fifoC$in$enq__RDY ) && ( ( fifoD$in$enq__RDY && ( ( index == 2 ) || ( index == 1 ) || ( index == 0 ) ) ) || ( ( !fifoD$in$enq__RDY ) && ( ( index == 3 ) || ( index == 2 ) || ( index == 1 ) || ( index == 0 ) ) ) ) ) ) ) ) ) ) ) ) );
    // Extra assigments, not to output wires
    assign RULE$respondA_rule__RDY = fifoA$out$first__RDY && indication$heard__RDY && fifoA$out$deq__RDY;
    assign RULE$respondB_rule__RDY = fifoB$out$first__RDY && indication$heard__RDY && fifoB$out$deq__RDY;
    assign RULE$respondC_rule__RDY = fifoC$out$first__RDY && indication$heard__RDY && fifoC$out$deq__RDY;
    assign RULE$respondD_rule__RDY = fifoD$out$first__RDY && indication$heard__RDY && fifoD$out$deq__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
        busy <= 0;
        busy_delay <= 0;
        index <= 0;
      end // nRST
      else begin
        if (RULE$respondA_rule__RDY) begin // RULE$respondA_rule__ENA
            $display( "[%s:%d] index %d" , "RULE$respondA_rule_block_invoke" , 57 , index );
        end; // End of RULE$respondA_rule__ENA
        if (RULE$respondB_rule__RDY) begin // RULE$respondB_rule__ENA
            $display( "[%s:%d]" , "RULE$respondB_rule_block_invoke" , 62 );
        end; // End of RULE$respondB_rule__ENA
        if (RULE$respondC_rule__RDY) begin // RULE$respondC_rule__ENA
            $display( "[%s:%d]" , "RULE$respondC_rule_block_invoke" , 67 );
        end; // End of RULE$respondC_rule__ENA
        if (RULE$respondD_rule__RDY) begin // RULE$respondD_rule__ENA
            $display( "[%s:%d]" , "RULE$respondD_rule_block_invoke" , 72 );
        end; // End of RULE$respondD_rule__ENA
        if (request$say__ENA && request$say__RDY) begin // request$say__ENA
            index <= index + 1;
            $display( "request.say %x index %d" , request$say$v , index );
        end; // End of request$say__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
