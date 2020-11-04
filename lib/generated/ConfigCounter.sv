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
    logic [count_sz - 1:0]_RULE$react$new_count;
    logic [count_sz - 1:0]dec_wire;
    assign decrement__RDY = 1'd1;
    assign increment__RDY = 1'd1;
    assign maybeDecrement = cnt >= maybeDecrement$v;
    assign maybeDecrement__RDY = 1'd1;
    assign positive = positive_reg;
    assign positive__RDY = 1'd1;
    assign read = cnt;
    assign read__RDY = 1'd1;
    // Extra assigments, not to output wires
    assign _RULE$react$new_count = ( cnt + ( increment__ENA ? increment$v : 0 ) ) - dec_wire;
    always_comb begin
    dec_wire = 0;
    unique case(1'b1)
    decrement__ENA: dec_wire = decrement$v;
    cnt >= maybeDecrement$v: dec_wire = maybeDecrement$v;
    endcase
    end

    always @( posedge CLK) begin
      if (!nRST) begin
        cnt <= 0;
        positive_reg <= 0;
      end // nRST
      else begin
        // RULE$react__ENA
            cnt <= _RULE$react$new_count;
            positive_reg <= _RULE$react$new_count > 0;
        // End of RULE$react__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
