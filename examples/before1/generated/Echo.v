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
    wire RULEdelay_rule__ENA;
    wire RULEdelay_rule__RDY;
    wire RULErespond_rule__ENA;
    wire RULErespond_rule__RDY;
    assign RULEdelay_rule__ENA = ( busy & ( !busy_delay ) ) != 0;
    assign RULErespond_rule__ENA = busy_delay & indication$heard__RDY;
    assign indication$heard$meth = meth_delay;
    assign indication$heard$v = v_delay;
    assign indication$heard__ENA = busy_delay;
    assign request$say2__RDY = !busy;
    assign request$say__RDY = !busy;
    assign swap$x2y__RDY = 1;
    assign swap$y2x__RDY = 1;
    assign swap$y2xnull__RDY = 1;
    // Extra assigments, not to output wires
    assign RULEdelay_rule__RDY = ( busy & ( !busy_delay ) ) != 0;
    assign RULErespond_rule__RDY = busy_delay & indication$heard__RDY;

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
        if (RULEdelay_rule__ENA & RULEdelay_rule__RDY) begin
            busy <= 0;
            busy_delay <= 1;
            meth_delay <= meth_temp;
            v_delay <= v_temp;
            $display( "delay_rule: Echo" );
        end; // End of RULEdelay_rule__ENA
        if (RULErespond_rule__ENA & RULErespond_rule__RDY) begin
            busy_delay <= 0;
            $display( "respond_rule: Echo" );
        end; // End of RULErespond_rule__ENA
        if (request$say2__ENA & request$say2__RDY) begin
            meth_temp <= request$say2$meth;
            v_temp <= request$say2$v;
            busy <= 1;
            $display( "[%s:%d]Echo" , "request$say2" , 192 );
        end; // End of request$say2__ENA
        if (request$say__ENA & request$say__RDY) begin
            meth_temp <= request$say$meth;
            v_temp <= request$say$v;
            busy <= 1;
            $display( "[%s:%d]Echo" , "request$say" , 186 );
        end; // End of request$say__ENA
        if (swap$x2y__ENA & swap$x2y__RDY) begin
            y <= x;
            $display( "[%s:%d]Echo" , "swap$x2y" , 206 );
        end; // End of swap$x2y__ENA
        if (swap$y2x__ENA & swap$y2x__RDY) begin
            x <= y;
            $display( "[%s:%d]Echo" , "swap$y2x" , 198 );
        end; // End of swap$y2x__ENA
        if (swap$y2xnull__ENA & swap$y2xnull__RDY) begin
            $display( "[%s:%d]Echo" , "swap$y2xnull" , 202 );
        end; // End of swap$y2xnull__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
