`include "atomicc.generated.vh"
`default_nettype none
module SyncFF (
    input wire CLK,
    input wire nRST,
    output wire out,
    input wire in);
    reg [3 - 1:0]flag;
    assign out = flag[ 1 ] && ( flag[ 2 ] == 0 );

    always @( posedge CLK) begin
      if (!nRST) begin
        flag <= 3'd0;
      end // nRST
      else begin
        // RULE$init__ENA
            flag <= { flag[ 1 : 0 ] , in };
        // End of RULE$init__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
