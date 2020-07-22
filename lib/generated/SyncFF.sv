`include "syncFF.generated.vh"

`default_nettype none
module SyncFF (
    input wire CLK,
    input wire nRST,
    output wire out,
    input wire in);
    reg one;
    reg two;
    assign out = two;

    always @( posedge CLK) begin
      if (!nRST) begin
        one <= 0;
        two <= 0;
      end // nRST
      else begin
        // RULE$init__ENA
            one <= in;
            two <= one;
        // End of RULE$init__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
