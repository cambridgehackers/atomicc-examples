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
    wire RULE$delay_rule__RDY;
    wire RULE$respond_rule__RDY;
    assign indication.heard$v = v_delay;
    assign indication.heard2$a = a_delay;
    assign indication.heard2$b = b_delay;
    assign indication.heard2__ENA = !( ( v_type == 1 ) || ( !RULE$respond_rule__RDY ) );
    assign indication.heard3$a = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign indication.heard3$b = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign indication.heard3$c = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign indication.heard3$d = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign indication.heard3__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign indication.heard__ENA = RULE$respond_rule__RDY && ( v_type == 1 );
    assign request.say2__RDY = !( 0 == ( ( busy != 0 ) ^ 1 ) );
    assign request.say__RDY = !( 0 == ( ( busy != 0 ) ^ 1 ) );
    assign request.setLeds__RDY = 1;
    // Extra assigments, not to output wires
    assign RULE$delay_rule__RDY = !( ( ( busy != 0 ) & ( busy_delay == 0 ) ) == 0 );
    assign RULE$respond_rule__RDY = !( ( busy_delay == 0 ) || ( !( ( indication.heard__RDY && ( ( v_type == 1 ) || indication.heard2__RDY ) ) || ( ( !indication.heard__RDY ) && ( !( ( v_type == 1 ) || ( !indication.heard2__RDY ) ) ) ) ) ) );

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
        if (RULE$delay_rule__RDY) begin // RULE$delay_rule__ENA
            busy <= 0;
            busy_delay <= 1;
            v_delay <= v_temp;
            a_delay <= a_temp;
            b_delay <= b_temp;
        end; // End of RULE$delay_rule__ENA
        if (RULE$respond_rule__RDY) begin // RULE$respond_rule__ENA
            busy_delay <= 0;
        end; // End of RULE$respond_rule__ENA
        if (request.say2__ENA && request.say2__RDY) begin // request.say2__ENA
            a_temp <= request.say2$a;
            b_temp <= request.say2$b;
            busy <= 1;
            v_type <= 2;
        end; // End of request.say2__ENA
        if (request.say__ENA && request.say__RDY) begin // request.say__ENA
            v_temp <= request.say$v;
            busy <= 1;
            v_type <= 1;
            $display( "request.say %x" , request.say$v );
        end; // End of request.say__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
