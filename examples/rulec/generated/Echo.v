`include "rulec.generated.vh"

`default_nettype none
module Echo (input wire CLK, input wire nRST,
    input wire request$say__ENA,
    input wire [31:0]request$say$v,
    input wire request$say2__ENA,
    input wire [15:0]request$say2$a,
    input wire [15:0]request$say2$b,
    output wire request$say2__RDY,
    output wire request$say__RDY,
    input wire request$setLeds__ENA,
    input wire [7:0]request$setLeds$v,
    output wire request$setLeds__RDY,
    output wire indication$heard__ENA,
    output wire [31:0]indication$heard$v,
    output wire indication$heard2__ENA,
    output wire [15:0]indication$heard2$a,
    output wire [15:0]indication$heard2$b,
    input wire indication$heard2__RDY,
    output wire indication$heard3__ENA,
    output wire [15:0]indication$heard3$a,
    output wire [31:0]indication$heard3$b,
    output wire [31:0]indication$heard3$c,
    output wire [15:0]indication$heard3$d,
    input wire indication$heard3__RDY,
    input wire indication$heard__RDY);
    reg [15:0]a_delay;
    reg [15:0]a_temp;
    reg [15:0]b_delay;
    reg [15:0]b_temp;
    reg busy;
    reg busy_delay;
    reg [31:0]v_delay;
    reg [31:0]v_temp;
    reg [31:0]v_type;
    wire RULE$respond_rule__ENA;
    wire RULE$respond_rule__RDY;
    assign indication$heard$v = v_delay;
    assign indication$heard2$a = a_delay;
    assign indication$heard2$b = b_delay;
    assign indication$heard2__ENA = ( v_type != 32'd1 ) & busy_delay;
    assign indication$heard3$a = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign indication$heard3$b = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign indication$heard3$c = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign indication$heard3$d = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign indication$heard3__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign indication$heard__ENA = ( v_type == 32'd1 ) & busy_delay;
    assign request$say2__RDY = !busy;
    assign request$say__RDY = !busy;
    assign request$setLeds__RDY = 1;
    // Extra assigments, not to output wires
    assign RULE$respond_rule__ENA = busy_delay & ( ( v_type != 32'd1 ) | indication$heard__RDY ) & ( ( v_type == 32'd1 ) | indication$heard2__RDY );
    assign RULE$respond_rule__RDY = busy_delay & ( ( v_type != 32'd1 ) | indication$heard__RDY ) & ( ( v_type == 32'd1 ) | indication$heard2__RDY );

    always @( posedge CLK) begin
      if (!nRST) begin
        a_delay <= 0;
        a_temp <= 0;
        b_delay <= 0;
        b_temp <= 0;
        busy <= 0;
        busy_delay <= 0;
        v_delay <= 0;
        v_temp <= 0;
        v_type <= 0;
      end // nRST
      else begin
        if (busy & ( !busy_delay )) begin // RULE$delay_rule__ENA
            busy <= 0;
            busy_delay <= 1;
            v_delay <= v_temp;
            a_delay <= a_temp;
            b_delay <= b_temp;
        end; // End of RULE$delay_rule__ENA
        if (RULE$respond_rule__ENA & RULE$respond_rule__RDY) begin // RULE$respond_rule__ENA
            busy_delay <= 0;
        end; // End of RULE$respond_rule__ENA
        if (request$say2__ENA & ( !busy )) begin // request$say2__ENA
            a_temp <= request$say2$a;
            b_temp <= request$say2$b;
            busy <= 1;
            v_type <= 2;
        end; // End of request$say2__ENA
        if (request$say__ENA & ( !busy )) begin // request$say__ENA
            v_temp <= request$say$v;
            busy <= 1;
            v_type <= 1;
        end; // End of request$say__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
