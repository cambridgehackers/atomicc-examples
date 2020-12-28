`include "atomicc.generated.vh"
`include "connect.generated.vh"
`default_nettype none
module Echo (input wire CLK, input wire nRST,
    EchoRequest.server request,
    EchoIndication.client indication);
    // Extra assigments, not to output wires
    assign indication.heard$meth = request.say$meth;
    assign indication.heard$v = request.say$v;
    assign indication.heard__ENA = request.say__ENA;
    assign request.say__RDY = indication.heard__RDY;
endmodule

`default_nettype wire    // set back to default value
