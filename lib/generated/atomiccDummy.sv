`include "atomicc.generated.vh"

`default_nettype none
module atomiccDummy (input wire CLK, input wire nRST,
    PipeIn.server pi,
    PipeOut.server po,
    PipeInB.server pib);
endmodule

`default_nettype wire    // set back to default value
