`include "bscant.generated.vh"

`default_nettype none
module Btest (input wire CLK, input wire nRST,
    input wire request$say__ENA,
    input wire [32 - 1:0]request$say$v,
    output wire request$say__RDY,
    input wire request$say2__ENA,
    input wire [16 - 1:0]request$say2$a,
    input wire [16 - 1:0]request$say2$b,
    output wire request$say2__RDY,
    input wire request$setLeds__ENA,
    input wire [8 - 1:0]request$setLeds$v,
    output wire request$setLeds__RDY,
    output wire indication$heard__ENA,
    output wire [32 - 1:0]indication$heard$v,
    input wire indication$heard__RDY,
    output wire indication$heard2__ENA,
    output wire [16 - 1:0]indication$heard2$a,
    output wire [16 - 1:0]indication$heard2$b,
    input wire indication$heard2__RDY,
    output wire indication$heard3__ENA,
    output wire [16 - 1:0]indication$heard3$a,
    output wire [32 - 1:0]indication$heard3$b,
    output wire [32 - 1:0]indication$heard3$c,
    output wire [16 - 1:0]indication$heard3$d,
    input wire indication$heard3__RDY);
    reg [16 - 1:0]a_delay;
    reg [16 - 1:0]a_temp;
    reg [16 - 1:0]b_delay;
    reg [16 - 1:0]b_temp;
    reg busy;
    reg busy_delay;
    reg [32 - 1:0]fromB;
    reg fromReady;
    reg [32 - 1:0]toB;
    reg toReady;
    reg [32 - 1:0]v_delay;
    reg [32 - 1:0]v_temp;
    reg [32 - 1:0]v_type;
    wire RULE$requestRule__RDY;
    wire RULE$respond_rule__RDY;
    wire [32 - 1:0]bscan$fromBscan$enq$v;
    wire bscan$fromBscan$enq__ENA;
    wire [32 - 1:0]bscan$toBscan$enq$v;
    wire bscan$toBscan$enq__RDY;
    Bscan#(32) bscan (.CLK(CLK), .nRST(nRST),
        .toBscan$enq__ENA(RULE$requestRule__RDY),
        .toBscan$enq$v(bscan$toBscan$enq$v),
        .toBscan$enq__RDY(bscan$toBscan$enq__RDY),
        .fromBscan$enq__ENA(bscan$fromBscan$enq__ENA),
        .fromBscan$enq$v(bscan$fromBscan$enq$v),
        .fromBscan$enq__RDY(1));
    assign bscan$toBscan$enq$v = toB;
    assign indication$heard$v = fromB;
    assign indication$heard2$a = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign indication$heard2$b = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign indication$heard2__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign indication$heard3$a = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign indication$heard3$b = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign indication$heard3$c = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign indication$heard3$d = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign indication$heard3__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign indication$heard__ENA = RULE$respond_rule__RDY;
    assign request$say2__RDY = !busy;
    assign request$say__RDY = !busy;
    assign request$setLeds__RDY = 1;
    // Extra assigments, not to output wires
    assign RULE$requestRule__RDY = toReady && bscan$toBscan$enq__RDY;
    assign RULE$respond_rule__RDY = fromReady && indication$heard__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
        a_delay <= 0;
        a_temp <= 0;
        b_delay <= 0;
        b_temp <= 0;
        busy <= 0;
        busy_delay <= 0;
        fromB <= 0;
        fromReady <= 0;
        toB <= 0;
        toReady <= 0;
        v_delay <= 0;
        v_temp <= 0;
        v_type <= 0;
      end // nRST
      else begin
        if (RULE$requestRule__RDY) begin // RULE$requestRule__ENA
            toReady <= 0;
        end; // End of RULE$requestRule__ENA
        if (RULE$respond_rule__RDY) begin // RULE$respond_rule__ENA
            fromReady <= 0;
        end; // End of RULE$respond_rule__ENA
        if (bscan$fromBscan$enq__ENA) begin // readUser$enq__ENA
            fromB <= bscan$fromBscan$enq$v;
            fromReady <= 1;
        end; // End of readUser$enq__ENA
        if (request$say__ENA && request$say__RDY) begin // request$say__ENA
            toB <= request$say$v;
            toReady <= 1;
        end; // End of request$say__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
