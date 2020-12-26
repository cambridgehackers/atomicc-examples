`include "hdmi.generated.vh"

`default_nettype none
module HdmiData #(
    parameter integer widthAddr = 12,
    parameter integer heightAddr = 13)(
    input wire CLK, input wire nRST,
    input wire setXY__ENA,
    input wire [widthAddr - 1:0]setXY$x,
    input wire [heightAddr - 1:0]setXY$y,
    input wire setXY$dataEnable,
    output wire setXY__RDY);
    assign setXY__RDY = 1'd1;
endmodule

`default_nettype wire    // set back to default value
