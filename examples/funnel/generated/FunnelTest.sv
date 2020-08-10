`include "funnel.generated.vh"

`default_nettype none
module FunnelTest (input wire CLK, input wire nRST,
    input wire request$say__ENA,
    input wire [32 - 1:0]request$say$v,
    output wire request$say__RDY,
    output wire indication$heard__ENA,
    output wire [32 - 1:0]indication$heard$v,
    input wire indication$heard__RDY);
    reg [8 - 1:0]index;
    wire RULE$respond_rule__RDY;
    wire [32 - 1:0]fifo$in$enq$v [4 - 1:0];
    wire fifo$in$enq__ENA [4 - 1:0];
    wire fifo$in$enq__RDY [4 - 1:0];
    wire [ 4 - 1:0]fifo$in$enq__RDY_or;
    wire fifo$in$enq__RDY_or1;
    wire [32 - 1:0]fifo$out$enq$v [4 - 1:0];
    wire fifo$out$enq__ENA [4 - 1:0];
    wire fifo$out$enq__RDY [4 - 1:0];
    wire [32 - 1:0]funnel$in$enq$v [4 - 1:0];
    wire funnel$in$enq__ENA [4 - 1:0];
    wire funnel$in$enq__RDY [4 - 1:0];
    wire [32 - 1:0]funnel$out$enq$v;
    wire funnel$out$enq__ENA;
    wire result$in$enq__RDY;
    wire result$out$deq__ENA;
    wire result$out$deq__RDY;
    wire result$out$first__RDY;
    genvar __inst$Genvar1;
    FifoPBase#(.width(32)) fifo [4 - 1:0] (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(fifo$in$enq__ENA),
        .in$enq$v(fifo$in$enq$v),
        .in$enq__RDY(fifo$in$enq__RDY),
        .out$enq__ENA(fifo$out$enq__ENA),
        .out$enq$v(fifo$out$enq$v),
        .out$enq__RDY(fifo$out$enq__RDY));
    FunnelBufferedBase#(.funnelWidth(4),.dataWidth(32)) funnel (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(funnel$in$enq__ENA),
        .in$enq$v(funnel$in$enq$v),
        .in$enq__RDY(funnel$in$enq__RDY),
        .out$enq__ENA(funnel$out$enq__ENA),
        .out$enq$v(funnel$out$enq$v),
        .out$enq__RDY(result$in$enq__RDY));
    Fifo1Base#(.width(32)) result (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(funnel$out$enq__ENA),
        .in$enq$v(funnel$out$enq$v),
        .in$enq__RDY(result$in$enq__RDY),
        .out$deq__ENA(result$out$deq__ENA),
        .out$deq__RDY(result$out$deq__RDY),
        .out$first(indication$heard$v),
        .out$first__RDY(result$out$first__RDY));
    assign indication$heard__ENA = result$out$first__RDY && result$out$deq__RDY;
    assign request$say__RDY = fifo$in$enq__RDY_or1;
    assign result$out$deq__ENA = result$out$first__RDY && indication$heard__RDY;
    // Extra assigments, not to output wires
    assign RULE$respond_rule__RDY = result$out$first__RDY && indication$heard__RDY && result$out$deq__RDY;
    assign fifo$in$enq__RDY_or1 = |fifo$in$enq__RDY_or;
for(__inst$Genvar1 = 0; __inst$Genvar1 < 4; __inst$Genvar1 = __inst$Genvar1 + 1) begin
        assign fifo$in$enq$v[__inst$Genvar1] = request$say$v;
        assign fifo$in$enq__ENA[__inst$Genvar1] = request$say__ENA && ( index == __inst$Genvar1 );
        assign fifo$in$enq__RDY_or[__inst$Genvar1] = fifo$in$enq__RDY[ __inst$Genvar1 ];
        assign fifo$out$enq__RDY[ __inst$Genvar1 ] = funnel$in$enq__RDY[ __inst$Genvar1 ];
        assign funnel$in$enq$v[ __inst$Genvar1 ] = fifo$out$enq$v[ __inst$Genvar1 ];
        assign funnel$in$enq__ENA[ __inst$Genvar1 ] = fifo$out$enq__ENA[ __inst$Genvar1 ];
    end;

    always @( posedge CLK) begin
      if (!nRST) begin
        index <= 0;
      end // nRST
      else begin
        if (RULE$respond_rule__RDY) begin // RULE$respond_rule__ENA
            $display( "[%s:%d] index %d" , "RULE$respond_rule_block_invoke" , 55 , index );
        end; // End of RULE$respond_rule__ENA
        if (request$say__ENA && request$say__RDY) begin // request$say__ENA
            $display( "request.say %x index %d" , request$say$v , index );
            if (!( index >= ( 4 - 1 ) ))
            index <= index + 1;
            if (index >= ( 4 - 1 ))
            index <= 0;
        end; // End of request$say__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
