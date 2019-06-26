`include "configCounter.generated.vh"

`default_nettype none
module ConfigCounter #(
    parameter integer count_sz = 10)(
    input wire CLK, input wire nRST,
    input wire ifc$decrement__ENA,
    input wire [count_sz - 1:0]ifc$decrement$v,
    output wire ifc$decrement__RDY,
    input wire ifc$increment__ENA,
    input wire [count_sz - 1:0]ifc$increment$v,
    output wire ifc$increment__RDY,
    output wire ifc$maybeDecrement,
    input wire ifc$maybeDecrement__ENA,
    input wire [count_sz - 1:0]ifc$maybeDecrement$v,
    output wire ifc$maybeDecrement__RDY,
    output wire ifc$positive,
    output wire ifc$positive__RDY,
    output wire [count_sz - 1:0]ifc$read,
    output wire ifc$read__RDY);
    reg [count_sz - 1:0]cnt;
    reg positive_reg;
    wire [count_sz - 1:0]dec_wire;
    wire ifc$maybeDecrement$retval;
    wire [count_sz - 1:0]inc_wire;
    assign ifc$decrement__RDY = 1;
    assign ifc$increment__RDY = 1;
    assign ifc$maybeDecrement = ifc$maybeDecrement$retval;
    assign ifc$maybeDecrement__RDY = 1;
    assign ifc$positive = positive_reg;
    assign ifc$positive__RDY = 1;
    assign ifc$read = cnt;
    assign ifc$read__RDY = 1;
    // Extra assigments, not to output wires
    assign dec_wire = ifc$decrement$v;
    assign ifc$maybeDecrement$retval = ( cnt >= ifc$maybeDecr$v ) ? 1'd1 : 1'd0;
    assign inc_wire = ifc$increment$v;

    always @( posedge CLK) begin
      if (!nRST) begin
        cnt <= 0;
        positive_reg <= 0;
      end // nRST
      else begin
        // RULE$react__ENA
            cnt <= ( cnt + inc_wire ) - dec_wire;
            positive_reg <= ( ( cnt + inc_wire ) - dec_wire ) > 0;
        // End of RULE$react__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
