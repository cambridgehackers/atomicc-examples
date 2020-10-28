`include "selectout.generated.vh"

`default_nettype none
module SelectOut #(
    parameter integer funnelWidth = 8,
    parameter integer width = 16)(
    input wire CLK, input wire nRST,
    input wire select__ENA,
    input wire [32 - 1:0]select$v,
    output wire select__RDY,
    PipeOut.client in[funnelWidth - 1:0],
    PipeOut.server out);
    reg [4 - 1:0]index;
    logic in__deq__RDY_or [funnelWidth - 1:0];
    logic in__deq__RDY_or1;
    logic in__first__RDY_or [funnelWidth - 1:0];
    logic in__first__RDY_or1;
    logic [width - 1:0]in__first_or [funnelWidth - 1:0];
    logic [width - 1:0]in__first_or1;
    genvar __inst$Genvar1;
    SelectIndex#(.width(1),.funnelWidth(funnelWidth)) in__deq__RDY_orCC (
        .out(in__deq__RDY_or1),
        .in(in__deq__RDY_or),
        .index(index));
    SelectIndex#(.width(width),.funnelWidth(funnelWidth)) in__first_orCC (
        .out(in__first_or1),
        .in(in__first_or),
        .index(index));
    SelectIndex#(.width(1),.funnelWidth(funnelWidth)) in__first__RDY_orCC (
        .out(in__first__RDY_or1),
        .in(in__first__RDY_or),
        .index(index));
    assign select__RDY = 1'd1;
    // Extra assigments, not to output wires
    assign out.deq__RDY = in__deq__RDY_or1;
    assign out.first = in__first_or1;
    assign out.first__RDY = in__first__RDY_or1;
for(__inst$Genvar1 = 0; __inst$Genvar1 < funnelWidth; __inst$Genvar1 = __inst$Genvar1 + 1) begin
    assign in[__inst$Genvar1].deq__ENA = out.deq__ENA && ( index == __inst$Genvar1 );
    assign in__deq__RDY_or[__inst$Genvar1] = in[__inst$Genvar1].deq__RDY;
    assign in__first__RDY_or[__inst$Genvar1] = in[__inst$Genvar1].first__RDY;
    assign in__first_or[__inst$Genvar1] = in[__inst$Genvar1].first;
    end;

    always @( posedge CLK) begin
      if (!nRST) begin
        index <= 0;
      end // nRST
      else begin
        if (select__ENA) begin // select__ENA
            index <= (4'(select$v));
        end; // End of select__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
