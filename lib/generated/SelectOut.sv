`include "selectout.generated.vh"

`default_nettype none
module SelectOut #(
    parameter integer funnelWidth = 16,
    parameter integer width = 32)(
    input wire CLK, input wire nRST,
    input wire select__ENA,
    input wire [32 - 1:0]select$v,
    output wire select__RDY,
    PipeOut.client in[funnelWidth - 1:0],
    PipeOut.server out);
    reg [$clog2(funnelWidth) - 1:0]index;
    logic [ funnelWidth - 1:0]in__deq__RDY_or;
    logic in__deq__RDY_or1;
    logic [ funnelWidth - 1:0]in__first__RDY_or;
    logic in__first__RDY_or1;
    assign select__RDY = 1'd1;
    // Extra assigments, not to output wires
    assign in__deq__RDY_or1 = |in__deq__RDY_or;
    assign in__first__RDY_or1 = |in__first__RDY_or;
    assign out.deq__RDY = in__deq__RDY_or1;
    assign out.first__RDY = in__first__RDY_or1;
    logic [width-1: 0] firstval[funnelWidth - 1: 0];
function [width-1:0] encode;
    input [width-1: 0] firstval[funnelWidth - 1: 0];
    input [$clog2(funnelWidth) - 1:0]index;
integer i;
begin : _encode
encode = width'(0);
for (i = 0; i < funnelWidth; i = i + 1) begin
    if (i == index) begin
        encode = firstval[i];
        disable _encode;
    end
end
end
endfunction
    assign out.first = encode(firstval, index);

genvar __inst$Genvar1;
for(__inst$Genvar1 = 0; __inst$Genvar1 < funnelWidth; __inst$Genvar1 = __inst$Genvar1 + 1) begin
assign firstval[__inst$Genvar1] = in[__inst$Genvar1].first;
    assign in[__inst$Genvar1].deq__ENA = out.deq__ENA && ( index == __inst$Genvar1 );
    assign in__deq__RDY_or[__inst$Genvar1] = in[__inst$Genvar1].deq__RDY && ( index == __inst$Genvar1 );
    assign in__first__RDY_or[__inst$Genvar1] = in[__inst$Genvar1].first__RDY && ( index == __inst$Genvar1 );
    end;

    always @( posedge CLK) begin
      if (!nRST) begin
        index <= 0;
      end // nRST
      else begin
        if (select__ENA) begin // select__ENA
            index <= select$v;
        end; // End of select__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
