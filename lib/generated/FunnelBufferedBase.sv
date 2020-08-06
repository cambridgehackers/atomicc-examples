`include "funnel.generated.vh"

`default_nettype none
module FunnelBufferedBase #(
    parameter integer funnelWidth = 99,
    parameter integer dataWidth = 32)(
    input wire CLK, input wire nRST,
    input wire in$enq__ENA[funnelWidth - 1:0],
    input wire [dataWidth - 1:0]in$enq$v[funnelWidth - 1:0],
    output wire in$enq__RDY[funnelWidth - 1:0],
    output wire out$enq__ENA,
    output wire [dataWidth - 1:0]out$enq$v,
    input wire out$enq__RDY);
    wire [dataWidth - 1:0]base$in$enq$v [funnelWidth - 1:0];
    wire base$in$enq__ENA [funnelWidth - 1:0];
    wire base$in$enq__RDY [funnelWidth - 1:0];
    wire [dataWidth - 1:0]buffer$in$enq$v [funnelWidth - 1:0];
    wire buffer$in$enq__ENA [funnelWidth - 1:0];
    wire buffer$in$enq__RDY [funnelWidth - 1:0];
    wire [dataWidth - 1:0]buffer$out$enq$v [funnelWidth - 1:0];
    wire buffer$out$enq__ENA [funnelWidth - 1:0];
    wire buffer$out$enq__RDY [funnelWidth - 1:0];
    genvar __inst$Genvar1;
    FifoPBase#(.width(dataWidth)) buffer [funnelWidth - 1:0] (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(buffer$in$enq__ENA),
        .in$enq$v(buffer$in$enq$v),
        .in$enq__RDY(buffer$in$enq__RDY),
        .out$enq__ENA(buffer$out$enq__ENA),
        .out$enq$v(buffer$out$enq$v),
        .out$enq__RDY(buffer$out$enq__RDY));
    FunnelBase#(.funnelWidth ( funnelWidth),.dataWidth ( dataWidth)) base (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(base$in$enq__ENA),
        .in$enq$v(base$in$enq$v),
        .in$enq__RDY(base$in$enq__RDY),
        .out$enq__ENA(out$enq__ENA),
        .out$enq$v(out$enq$v),
        .out$enq__RDY(out$enq__RDY));
for(__inst$Genvar1 = 0; __inst$Genvar1 < funnelWidth; __inst$Genvar1 = __inst$Genvar1 + 1) begin
        assign base$in$enq$v[ __inst$Genvar1 ] = buffer$out$enq$v[ __inst$Genvar1 ];
        assign base$in$enq__ENA[ __inst$Genvar1 ] = buffer$out$enq__ENA[ __inst$Genvar1 ];
        assign buffer$in$enq$v[ __inst$Genvar1 ] = in$enq$v[ __inst$Genvar1 ];
        assign buffer$in$enq__ENA[ __inst$Genvar1 ] = in$enq__ENA[ __inst$Genvar1 ];
        assign buffer$out$enq__RDY[ __inst$Genvar1 ] = base$in$enq__RDY[ __inst$Genvar1 ];
        assign in$enq__RDY[ __inst$Genvar1 ] = buffer$in$enq__RDY[ __inst$Genvar1 ];
    end;
endmodule

`default_nettype wire    // set back to default value
