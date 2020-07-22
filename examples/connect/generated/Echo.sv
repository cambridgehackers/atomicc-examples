`include "connect.generated.vh"

`default_nettype none
module Echo (input wire CLK, input wire nRST,
    input wire request$say__ENA,
    input wire [32 - 1:0]request$say$meth,
    input wire [32 - 1:0]request$say$v,
    output wire request$say__RDY,
    output wire indication$heard__ENA,
    output wire [32 - 1:0]indication$heard$meth,
    output wire [32 - 1:0]indication$heard$v,
    input wire indication$heard__RDY);
    assign indication$heard$meth = request$say$meth;
    assign indication$heard$v = request$say$v;
    assign indication$heard__ENA = request$say__ENA;
    assign request$say__RDY = indication$heard__RDY;
endmodule

`default_nettype wire    // set back to default value
