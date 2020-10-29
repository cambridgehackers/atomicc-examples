`include "rulec.generated.vh"

`default_nettype none
module Echo (input wire CLK, input wire nRST,
    EchoRequest.server request,
    EchoIndication.client indication);
    reg [16 - 1:0]a_delay;
    reg [16 - 1:0]a_temp;
    reg [16 - 1:0]b_delay;
    reg [16 - 1:0]b_temp;
    reg busy;
    reg busy_delay;
    reg [32 - 1:0]v_delay;
    reg [32 - 1:0]v_temp;
    reg [32 - 1:0]v_type;
    logic RULE$delay_rule__ENA;
    logic RULE$delay_rule__RDY;
    logic RULE$respond_rule__ENA;
    logic RULE$respond_rule__RDY;
    // Extra assigments, not to output wires
    assign RULE$delay_rule__ENA = !( ( ( busy != 0 ) & ( busy_delay == 0 ) ) == 0 );
    assign RULE$delay_rule__RDY = !( ( ( busy != 0 ) & ( busy_delay == 0 ) ) == 0 );
    assign RULE$respond_rule__ENA = !( ( busy_delay == 0 ) || ( !( ( indication.heard__RDY && ( ( v_type == 1 ) || indication.heard2__RDY ) ) || ( ( !indication.heard__RDY ) && ( !( ( v_type == 1 ) || ( !indication.heard2__RDY ) ) ) ) ) ) );
    assign RULE$respond_rule__RDY = !( ( busy_delay == 0 ) || ( !( ( indication.heard__RDY && ( ( v_type == 1 ) || indication.heard2__RDY ) ) || ( ( !indication.heard__RDY ) && ( !( ( v_type == 1 ) || ( !indication.heard2__RDY ) ) ) ) ) ) );
    assign indication.heard$v = ( !( ( busy_delay == 0 ) || ( !( v_type == 1 ) ) ) ) ? v_delay : 32'd0;
    assign indication.heard2$a = ( !( ( v_type == 1 ) || ( busy_delay == 0 ) ) ) ? a_delay : 16'd0;
    assign indication.heard2$b = ( !( ( v_type == 1 ) || ( busy_delay == 0 ) ) ) ? b_delay : 16'd0;
    assign indication.heard2__ENA = !( ( v_type == 1 ) || ( busy_delay == 0 ) );
    assign indication.heard__ENA = !( ( busy_delay == 0 ) || ( !( v_type == 1 ) ) );
    assign request.say2__RDY = !( 0 == ( ( busy != 0 ) ^ 1 ) );
    assign request.say__RDY = !( 0 == ( ( busy != 0 ) ^ 1 ) );
    assign request.setLeds__RDY = 1'd1;

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
        if (RULE$delay_rule__RDY && RULE$delay_rule__ENA) begin // RULE$delay_rule__ENA
            busy <= 1'd0;
            busy_delay <= 1'd1;
            v_delay <= v_temp;
            a_delay <= a_temp;
            b_delay <= b_temp;
        end; // End of RULE$delay_rule__ENA
        if (RULE$respond_rule__RDY && RULE$respond_rule__ENA) begin // RULE$respond_rule__ENA
            busy_delay <= 1'd0;
        end; // End of RULE$respond_rule__ENA
        if (request.say2__RDY && request.say2__ENA) begin // request.say2__ENA
            a_temp <= request.say2$a;
            b_temp <= request.say2$b;
            busy <= 1'd1;
            v_type <= 32'd2;
        end; // End of request.say2__ENA
        if (request.say__RDY && request.say__ENA) begin // request.say__ENA
            v_temp <= request.say$v;
            busy <= 1'd1;
            v_type <= 32'd1;
            $display( "request$say %x" , request.say$v );
        end; // End of request.say__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
