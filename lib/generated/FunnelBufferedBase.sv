`include "funnel.generated.vh"

`default_nettype none
module FunnelBufferedBase #(
    parameter integer funnelWidth = 4,
    parameter integer width = 32)(
    input wire CLK, input wire nRST,
    PipeIn.server in[funnelWidth - 1:0],
    PipeIn.client out);
    PipeIn#(.width(width)) base$in [funnelWidth - 1:0]();
    PipeIn#(.width(width)) base$out();
    PipeIn#(.width(width)) buffer$in [funnelWidth - 1:0]();
    PipeIn#(.width(width)) buffer$out [funnelWidth - 1:0]();
    genvar __inst$Genvar1;
    FifoPBase#(.width(width)) buffer [funnelWidth - 1:0] (.CLK(CLK), .nRST(nRST),
        .in(buffer$in),
        .out(buffer$out));
    FunnelBase#(.funnelWidth(funnelWidth),.width(width)) base (.CLK(CLK), .nRST(nRST),
        .in(base$in),
        .out(out));
for(__inst$Genvar1 = 0; __inst$Genvar1 < funnelWidth; __inst$Genvar1 = __inst$Genvar1 + 1) begin
    assign base$in[ __inst$Genvar1 ].enq$v = buffer$out[ __inst$Genvar1 ].enq$v;
    assign base$in[ __inst$Genvar1 ].enq__ENA = buffer$out[ __inst$Genvar1 ].enq__ENA;
    assign buffer$in[ __inst$Genvar1 ].enq$v = in[ __inst$Genvar1 ].enq$v;
    assign buffer$in[ __inst$Genvar1 ].enq__ENA = in[ __inst$Genvar1 ].enq__ENA;
    assign buffer$out[ __inst$Genvar1 ].enq__RDY = base$in[ __inst$Genvar1 ].enq__RDY;
    assign in[ __inst$Genvar1 ].enq__RDY = buffer$in[ __inst$Genvar1 ].enq__RDY;
    end;
endmodule

`default_nettype wire    // set back to default value
