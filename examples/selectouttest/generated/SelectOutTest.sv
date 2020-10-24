`include "selectouttest.generated.vh"

`default_nettype none
module SelectOutTest (input wire CLK, input wire nRST,
    SelectOutRequest.server request,
    SelectOutIndication.client indication);
    reg [8 - 1:0]index;
    reg [8 - 1:0]rindex;
    logic RULE$rotateRule__RDY;
    PipeIn#(.width(32)) fifo$in [4 - 1:0]();
    logic [ 4 - 1:0]fifo$in__enq__RDY_or;
    logic fifo$in__enq__RDY_or1;
    PipeOut#(.width(32)) fifo$out [4 - 1:0]();
    PipeOut#(.width(32)) funnel$in [4 - 1:0]();
    PipeOut#(.width(32)) funnel$out();
    genvar __inst$Genvar1;
    Fifo1Base#(.width(32)) fifo [4 - 1:0] (.CLK(CLK), .nRST(nRST),
        .in(fifo$in),
        .out(fifo$out));
    SelectOut#(.funnelWidth(4),.width(32)) funnel (.CLK(CLK), .nRST(nRST),
        .select__ENA(RULE$rotateRule__RDY),
        .select$v(RULE$rotateRule__RDY ? rindex : 8'd0),
        .select__RDY(RULE$rotateRule__RDY),
        .in(funnel$in),
        .out(funnel$out));
    // Extra assigments, not to output wires
    assign fifo$in__enq__RDY_or1 = |fifo$in__enq__RDY_or;
    assign funnel$out.deq__ENA = funnel$out.first__RDY && indication.heard__RDY;
    assign indication.heard$rindex = ( funnel$out.first__RDY && funnel$out.deq__RDY ) ? rindex : 8'd0;
    assign indication.heard$v = ( funnel$out.first__RDY && funnel$out.deq__RDY ) ? funnel$out.first : 0;
    assign indication.heard__ENA = funnel$out.first__RDY && funnel$out.deq__RDY;
    assign request.say__RDY = fifo$in__enq__RDY_or1;
for(__inst$Genvar1 = 0; __inst$Genvar1 < 4; __inst$Genvar1 = __inst$Genvar1 + 1) begin
    assign fifo$in[__inst$Genvar1].enq$v = ( request.say__ENA && ( index == __inst$Genvar1 ) ) ? request.say$v : 0;
    assign fifo$in[__inst$Genvar1].enq__ENA = request.say__ENA && ( index == __inst$Genvar1 );
    assign fifo$in__enq__RDY_or[__inst$Genvar1] = fifo$in[__inst$Genvar1].enq__RDY;
    assign fifo$out[ __inst$Genvar1 ].deq__ENA = funnel$in[ __inst$Genvar1 ].deq__ENA;
    assign fifo$out[ __inst$Genvar1 ].first = funnel$in[ __inst$Genvar1 ].first;
    assign funnel$in[ __inst$Genvar1 ].deq__RDY = fifo$out[ __inst$Genvar1 ].deq__RDY;
    assign funnel$in[ __inst$Genvar1 ].first__RDY = fifo$out[ __inst$Genvar1 ].first__RDY;
    end;

    always @( posedge CLK) begin
      if (!nRST) begin
        index <= 0;
        rindex <= 0;
      end // nRST
      else begin
        if (funnel$out.first__RDY && indication.heard__RDY && funnel$out.deq__RDY) begin // RULE$respondRule__ENA
            $display( "[%s:%d] rindex %d limit %d increment %d" , "RULE$respondRule_block_invoke" , 53 , rindex , 0 , 0 );
        end; // End of RULE$respondRule__ENA
        if (RULE$rotateRule__RDY) begin // RULE$rotateRule__ENA
            if (!( rindex >= ( 4 - 1 ) ))
            rindex <= rindex + 8'd1;
            if (rindex >= ( 4 - 1 ))
            rindex <= 8'd0;
        end; // End of RULE$rotateRule__ENA
        if (request.say__ENA && fifo$in__enq__RDY_or1) begin // request.say__ENA
            $display( "request$say %x index %d limit %d increment %d" , request.say$v , index , 0 , 0 );
            if (!( index >= ( 4 - 1 ) ))
            index <= index + 8'd1;
            if (index >= ( 4 - 1 ))
            index <= 8'd0;
        end; // End of request.say__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
