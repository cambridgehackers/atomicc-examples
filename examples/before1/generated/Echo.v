`include "before1.generated.vh"

`default_nettype none
module Echo (input wire CLK, input wire nRST,
    input wire request$say__ENA,
    input wire [31:0]request$say$meth,
    input wire [31:0]request$say$v,
    input wire request$say2__ENA,
    input wire [31:0]request$say2$meth,
    input wire [31:0]request$say2$v,
    output wire request$say2__RDY,
    output wire request$say__RDY,
    input wire swap$x2y__ENA,
    output wire swap$x2y__RDY,
    input wire swap$y2x__ENA,
    output wire swap$y2x__RDY,
    input wire swap$y2xnull__ENA,
    output wire swap$y2xnull__RDY,
    output wire indication$heard__ENA,
    output wire [31:0]indication$heard$meth,
    output wire [31:0]indication$heard$v,
    input wire indication$heard__RDY);
    reg busy;
    reg busy_delay;
    reg [31:0]meth_delay;
    reg [31:0]meth_temp;
    reg [31:0]v_delay;
    reg [31:0]v_temp;
    reg [31:0]x;
    reg [31:0]y;
    assign indication$heard$meth = meth_delay;
    assign indication$heard$v = v_delay;
    assign indication$heard__ENA = busy_delay;
    assign request$say2__RDY = !busy;
    assign request$say__RDY = !busy;
    assign swap$x2y__RDY = 1'd1;
    assign swap$y2x__RDY = 1'd1;
    assign swap$y2xnull__RDY = 1'd1;

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
        if (busy & ( !busy_delay )) begin // RULE$delay_rule__ENA
            busy <= 0;
            busy_delay <= 1;
            meth_delay <= meth_temp;
            v_delay <= v_temp;
            $display( "delay_rule: Echo" );
        end; // End of RULE$delay_rule__ENA
        if (busy_delay & indication$heard__RDY) begin // RULE$respond_rule__ENA
            busy_delay <= 0;
            $display( "respond_rule: Echo" );
        end; // End of RULE$respond_rule__ENA
        if (request$say2__ENA & ( !busy )) begin // request$say2__ENA
            meth_temp <= request$say2$meth;
            v_temp <= request$say2$v;
            busy <= 1;
            $display( "[%s:%d]Echo" , "request$say2" , 194 );
        end; // End of request$say2__ENA
        if (request$say__ENA & ( !busy )) begin // request$say__ENA
            meth_temp <= request$say$meth;
            v_temp <= request$say$v;
            busy <= 1;
            $display( "[%s:%d]Echo" , "request$say" , 188 );
        end; // End of request$say__ENA
        if (swap$x2y__ENA) begin // swap$x2y__ENA
            y <= x;
            $display( "[%s:%d]Echo" , "swap$x2y" , 208 );
        end; // End of swap$x2y__ENA
        if (swap$y2x__ENA) begin // swap$y2x__ENA
            x <= y;
            $display( "[%s:%d]Echo" , "swap$y2x" , 200 );
        end; // End of swap$y2x__ENA
        if (swap$y2xnull__ENA) begin // swap$y2xnull__ENA
            $display( "[%s:%d]Echo" , "swap$y2xnull" , 204 );
        end; // End of swap$y2xnull__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
