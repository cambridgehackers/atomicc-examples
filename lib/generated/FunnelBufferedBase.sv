`include "funnel.generated.vh"

`default_nettype none
module FunnelBufferedBase #(
    parameter integer funnelWidth = 4,
    parameter integer width = 32)(
    input wire CLK, input wire nRST,
    PipeIn.server in [funnelWidth - 1: 0],
    PipeIn.client out);
    genvar __inst$Genvar1;

    PipeIn#(.width(width)) buffer$in [funnelWidth - 1:0]();
    PipeIn#(.width(width)) buffer$out [funnelWidth - 1:0]();
    FifoPBase#(.width(width)) buffer [funnelWidth - 1:0] (.CLK(CLK), .nRST(nRST),
        .in(in), //buffer$in),
        .out(buffer$out));

    //PipeIn#(.width(width)) base$in [funnelWidth - 1:0]();
    FunnelBase#(.funnelWidth ( funnelWidth),.width ( width)) base (.CLK(CLK), .nRST(nRST),
        .in(buffer$out), //base$in),
        .out(out));

for(__inst$Genvar1 = 0; __inst$Genvar1 < funnelWidth; __inst$Genvar1 = __inst$Genvar1 + 1) begin
        //assign buffer$in[ __inst$Genvar1 ].enq__ENA = in[ __inst$Genvar1 ].enq__ENA;
        //assign buffer$in[ __inst$Genvar1 ].enq$v = in[ __inst$Genvar1 ].enq$v;
        //assign buffer$in[ __inst$Genvar1 ].enq__RDY = in[ __inst$Genvar1 ].enq__RDY;
        //assign buffer$out[ __inst$Genvar1 ].enq__ENA = base$in[ __inst$Genvar1 ].enq__ENA;
        //assign buffer$out[ __inst$Genvar1 ].enq$v = base$in[ __inst$Genvar1 ].enq$v;
        //assign buffer$out[ __inst$Genvar1 ].enq__RDY = base$in[ __inst$Genvar1 ].enq__RDY;
    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (in[__inst$Genvar1].enq__ENA //&& in[__inst$Genvar1].enq__RDY
) begin
            $display( "funnelin %d = %x", __inst$Genvar1, in[__inst$Genvar1].enq$v);
        end;
        if (buffer$out[__inst$Genvar1].enq__ENA //&& buffer$out[__inst$Genvar1].enq__RDY
) begin
            $display( "funnelbufferout %d = %x", __inst$Genvar1, buffer$out[__inst$Genvar1].enq$v);
        end;
      end
    end // always @ (posedge CLK)

    end;
endmodule

`default_nettype wire    // set back to default value
