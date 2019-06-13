`include "scounter.generated.vh"

`default_nettype none
module PulseWire (input wire CLK, input wire nRST,
    input wire ifc$send__ENA,
    output wire ifc$send__RDY,
    output wire ifc$value,
    output wire ifc$value__RDY);
    assign ifc$send__RDY = 1;
    assign ifc$value = 0;
    assign ifc$value__RDY = 1;
endmodule 

`default_nettype wire    // set back to default value
