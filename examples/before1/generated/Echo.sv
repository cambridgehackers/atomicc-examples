`include "before1.generated.vh"

`default_nettype none
module Echo (input wire CLK, input wire nRST,
    EchoRequest.server request,
    Swap.server swap,
    EchoIndication.client indication);
    reg busy;
    reg busy_delay;
    reg [32 - 1:0]meth_delay;
    reg [32 - 1:0]meth_temp;
    reg [32 - 1:0]v_delay;
    reg [32 - 1:0]v_temp;
    reg [32 - 1:0]x;
    reg [32 - 1:0]y;
    logic RULE$delay_rule__ENA;
    logic RULE$delay_rule__RDY;
    logic RULE$respond_rule__ENA;
    // Extra assigments, not to output wires
    assign RULE$delay_rule__ENA = ( busy & ( !busy_delay ) ) != 0;
    assign RULE$delay_rule__RDY = ( busy & ( !busy_delay ) ) != 0;
    assign RULE$respond_rule__ENA = busy_delay && indication.heard__RDY;
    assign indication.heard$meth = meth_delay;
    assign indication.heard$v = v_delay;
    assign indication.heard__ENA = busy_delay;
    assign request.say2__RDY = !busy;
    assign request.say__RDY = !busy;
    assign swap.x2y__RDY = 1'd1;
    assign swap.y2x__RDY = 1'd1;
    assign swap.y2xnull__RDY = 1'd1;

    always @( posedge CLK) begin
      if (!nRST) begin
        busy <= 0;
        busy_delay <= 0;
        meth_delay <= 0;
        meth_temp <= 0;
        v_delay <= 0;
        v_temp <= 0;
        x <= 0;
        y <= 0;
      end // nRST
      else begin
        if (RULE$delay_rule__RDY && RULE$delay_rule__ENA) begin // RULE$delay_rule__ENA
            busy <= 0 != 0;
            busy_delay <= 1 != 0;
            meth_delay <= meth_temp;
            v_delay <= v_temp;
            $display( "delay_rule: Echo" );
        end; // End of RULE$delay_rule__ENA
        if (busy_delay && indication.heard__RDY && RULE$respond_rule__ENA) begin // RULE$respond_rule__ENA
            busy_delay <= 0 != 0;
            $display( "respond_rule: Echo" );
        end; // End of RULE$respond_rule__ENA
        if (( !busy ) && request.say2__ENA) begin // request.say2__ENA
            meth_temp <= request.say2$meth;
            v_temp <= request.say2$v;
            busy <= 1 != 0;
            $display( "[%s:%d]Echo" , "request$say2" , 211 );
        end; // End of request.say2__ENA
        if (( !busy ) && request.say__ENA) begin // request.say__ENA
            meth_temp <= request.say$meth;
            v_temp <= request.say$v;
            busy <= 1 != 0;
            $display( "[%s:%d]Echo" , "request$say" , 205 );
        end; // End of request.say__ENA
        if (swap.x2y__ENA) begin // swap.x2y__ENA
            y <= x;
            $display( "[%s:%d]Echo" , "swap$x2y" , 225 );
        end; // End of swap.x2y__ENA
        if (swap.y2x__ENA) begin // swap.y2x__ENA
            x <= y;
            $display( "[%s:%d]Echo" , "swap$y2x" , 217 );
        end; // End of swap.y2x__ENA
        if (swap.y2xnull__ENA) begin // swap.y2xnull__ENA
            $display( "[%s:%d]Echo" , "swap$y2xnull" , 221 );
        end; // End of swap.y2xnull__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
