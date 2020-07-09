`include "out2in.generated.vh"

`default_nettype none
module Out2InBase #(
    parameter integer width = 999999)(
    input wire CLK, input wire nRST,
    output wire in$deq__ENA,
    input wire in$deq__RDY,
    input wire [width - 1:0]in$first,
    input wire in$first__RDY,
    output wire out$enq__ENA,
    output wire [width - 1:0]out$enq$v,
    input wire out$enq__RDY);
    assign in$deq__ENA = in$first__RDY && out$enq__RDY;
    assign out$enq$v = in$first;
    assign out$enq__ENA = in$first__RDY && in$deq__RDY;
endmodule 

`default_nettype wire    // set back to default value
