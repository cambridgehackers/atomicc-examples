`include "atomicc.generated.vh"
`default_nettype none
module Printf (input wire CLK, input wire nRST,
    input wire enq__ENA,
    input wire [144 - 1:0]enq$v,
    output wire enq__RDY);
    assign enq__RDY = 1'd1;
endmodule

`default_nettype wire    // set back to default value
