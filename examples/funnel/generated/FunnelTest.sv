`include "funneltest.generated.vh"

`default_nettype none
module FunnelTest (input wire CLK, input wire nRST,
    FunnelRequest.server request,
    FunnelIndication.client indication);
    reg [8 - 1:0]index;
    PipeIn#(.width(32)) fifo$in [4 - 1:0]();
    logic [ 4 - 1:0]fifo$in__enq__RDY_or;
    logic fifo$in__enq__RDY_or1;
    PipeIn#(.width(32)) fifo$out [4 - 1:0]();
    PipeIn#(.width(32)) funnel$in [4 - 1:0]();
    PipeIn#(.width(32)) funnel$out();
    PipeIn#(.width(32)) result$in();
    PipeOut#(.width(32)) result$out();
    genvar __inst$Genvar1;
    FifoPBase#(.width(32)) fifo [4 - 1:0] (.CLK(CLK), .nRST(nRST),
        .in(fifo$in),
        .out(fifo$out));
    FunnelBufferedBase#(.funnelWidth(4),.width(32)) funnel (.CLK(CLK), .nRST(nRST),
        .in(funnel$in),
        .out(funnel$out));
    Fifo1Base#(.width(32)) result (.CLK(CLK), .nRST(nRST),
        .in(funnel$out),
        .out(result$out));
    // Extra assigments, not to output wires
    assign fifo$in__enq__RDY_or1 = |fifo$in__enq__RDY_or;
    assign indication.heard$v = ( result$out.first__RDY && result$out.deq__RDY ) ? result$out.first : 0;
    assign indication.heard__ENA = result$out.first__RDY && result$out.deq__RDY;
    assign request.say__RDY = fifo$in__enq__RDY_or1;
    assign result$out.deq__ENA = result$out.first__RDY && indication.heard__RDY;
for(__inst$Genvar1 = 0; __inst$Genvar1 < 4; __inst$Genvar1 = __inst$Genvar1 + 1) begin
    assign fifo$in[__inst$Genvar1].enq$v = ( request.say__ENA && ( index == __inst$Genvar1 ) ) ? request.say$v : 0;
    assign fifo$in[__inst$Genvar1].enq__ENA = request.say__ENA && ( index == __inst$Genvar1 );
    assign fifo$in__enq__RDY_or[__inst$Genvar1] = fifo$in[__inst$Genvar1].enq__RDY;
    assign fifo$out[ __inst$Genvar1 ].enq__RDY = funnel$in[ __inst$Genvar1 ].enq__RDY;
    assign funnel$in[ __inst$Genvar1 ].enq$v = fifo$out[ __inst$Genvar1 ].enq$v;
    assign funnel$in[ __inst$Genvar1 ].enq__ENA = fifo$out[ __inst$Genvar1 ].enq__ENA;
    end;

    always @( posedge CLK) begin
      if (!nRST) begin
        index <= 0;
      end // nRST
      else begin
        if (result$out.first__RDY && indication.heard__RDY && result$out.deq__RDY) begin // RULE$respond_rule__ENA
            $display( "[%s:%d] index %d" , "RULE$respond_rule_block_invoke" , 55 , index );
        end; // End of RULE$respond_rule__ENA
        if (request.say__ENA && fifo$in__enq__RDY_or1) begin // request.say__ENA
            $display( "request$say %x index %d" , request.say$v , index );
            if (!( index >= ( 4 - 1 ) ))
            index <= index + 1;
            if (index >= ( 4 - 1 ))
            index <= 0;
        end; // End of request.say__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
