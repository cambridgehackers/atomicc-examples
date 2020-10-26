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
    assign select__RDY = 1'd1;
    // Extra assigments, not to output wires
    logic [width-1: 0] firstArray[funnelWidth - 1: 0];
    logic              deqRDY[funnelWidth - 1: 0];
    logic              firstRDY[funnelWidth - 1: 0];
    SelectIndex#(.width(width), .funnelWidth(funnelWidth)) sel1(.out(out.first), .in(firstArray), .index(index));
    SelectIndex#(.width(1),     .funnelWidth(funnelWidth)) sel2(.out(out.deq__RDY), .in(deqRDY), .index(index));
    SelectIndex#(.width(1),     .funnelWidth(funnelWidth)) sel3(.out(out.first__RDY), .in(firstRDY), .index(index));

genvar __inst$Genvar1;
for(__inst$Genvar1 = 0; __inst$Genvar1 < funnelWidth; __inst$Genvar1 = __inst$Genvar1 + 1) begin
    assign firstArray[__inst$Genvar1] = in[__inst$Genvar1].first;
    assign deqRDY[__inst$Genvar1] = in[__inst$Genvar1].deq__RDY;
    assign firstRDY[__inst$Genvar1] = in[__inst$Genvar1].first__RDY;
    assign in[__inst$Genvar1].deq__ENA = out.deq__ENA && ( index == __inst$Genvar1 );
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
