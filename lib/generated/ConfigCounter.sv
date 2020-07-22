`include "configCounter.generated.vh"

`default_nettype none
module ConfigCounter #(
    parameter integer count_sz = 10)(
    input wire CLK, input wire nRST,
    input wire decrement__ENA,
    input wire [count_sz - 1:0]decrement$v,
    output wire decrement__RDY,
    output wire maybeDecrement,
    input wire maybeDecrement__ENA,
    input wire [count_sz - 1:0]maybeDecrement$v,
    output wire maybeDecrement__RDY,
    input wire increment__ENA,
    input wire [count_sz - 1:0]increment$v,
    output wire increment__RDY,
    output wire [count_sz - 1:0]read,
    output wire read__RDY,
    output wire positive,
    output wire positive__RDY);
    reg [count_sz - 1:0]cnt;
    reg positive_reg;
    wire [count_sz - 1:0]RULE$react$new_count;
    wire [count_sz - 1:0]dec_wire;
    wire [count_sz - 1:0]inc_wire;
    wire maybeDecrement$retval;
    assign decrement__RDY = 1;
    assign increment__RDY = 1;
    assign maybeDecrement = maybeDecrement$retval;
    assign maybeDecrement__RDY = 1;
    assign positive = positive_reg;
    assign positive__RDY = 1;
    assign read = cnt;
    assign read__RDY = 1;
    // Extra assigments, not to output wires
    assign RULE$react$new_count = ( cnt + inc_wire ) - dec_wire;
    assign dec_wire = ( decrement__ENA ? decrement$v : 0 ) | ( ( maybeDecrement__ENA && ( cnt >= maybeDecrement$v ) ) ? maybeDecrement$v : 0 );
    assign inc_wire = increment$v;
    assign maybeDecrement$retval = 1 && ( cnt >= maybeDecrement$v );

    always @( posedge CLK) begin
      if (!nRST) begin
        cnt <= 0;
        positive_reg <= 0;
      end // nRST
      else begin
        // RULE$react__ENA
            cnt <= RULE$react$new_count;
            positive_reg <= RULE$react$new_count > 0;
        // End of RULE$react__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
