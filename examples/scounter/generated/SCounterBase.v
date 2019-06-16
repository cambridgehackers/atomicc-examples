`include "scounter.generated.vh"

`default_nettype none
module SCounterBase #(
    parameter integer depth = 10,
    parameter integer width = 999)(
    input wire CLK, input wire nRST,
    input wire in$enq__ENA,
    input wire [width - 1:0]in$enq$v,
    output wire in$enq__RDY,
    input wire out$deq__ENA,
    output wire out$deq__RDY,
    output wire [width - 1:0]out$first,
    output wire out$first__RDY);
    reg [depth - 1:0]c;
    reg [width - 1:0]q;
    wire RULE$decCtr__ENA;
    wire RULE$decCtr__RDY;
    wire RULE$incCtr__ENA;
    wire RULE$incCtr__RDY;
    wire dequeueing$ifc$send__RDY;
    wire dequeueing$ifc$value;
    wire enqueueing$ifc$send__RDY;
    wire enqueueing$ifc$value;
    PulseWire enqueueing (.CLK(CLK), .nRST(nRST),
        .ifc$send__ENA(in$enq__ENA & in$enq__RDY),
        .ifc$send__RDY(enqueueing$ifc$send__RDY),
        .ifc$value(enqueueing$ifc$value),
        .ifc$value__RDY());
    PulseWire dequeueing (.CLK(CLK), .nRST(nRST),
        .ifc$send__ENA(out$deq__ENA & out$deq__RDY),
        .ifc$send__RDY(dequeueing$ifc$send__RDY),
        .ifc$value(dequeueing$ifc$value),
        .ifc$value__RDY());
    assign in$enq__RDY = !( ( c == depth ) | ( !enqueueing$ifc$send__RDY ) );
    assign out$deq__RDY = !( ( c == 0 ) | ( !dequeueing$ifc$send__RDY ) );
    assign out$first = q[ 0 ];
    assign out$first__RDY = 1;
    // Extra assigments, not to output wires
    assign RULE$decCtr__ENA = !( 0 == ( dequeueing$ifc$value && ( enqueueing$ifc$value ^ 1 ) ) );
    assign RULE$decCtr__RDY = !( 0 == ( dequeueing$ifc$value && ( enqueueing$ifc$value ^ 1 ) ) );
    assign RULE$incCtr__ENA = !( 0 == ( enqueueing$ifc$value && ( dequeueing$ifc$value ^ 1 ) ) );
    assign RULE$incCtr__RDY = !( 0 == ( enqueueing$ifc$value && ( dequeueing$ifc$value ^ 1 ) ) );

    always @( posedge CLK) begin
      if (!nRST) begin
        c <= 0;
        q <= 0;
      end // nRST
      else begin
        if (RULE$decCtr__ENA & RULE$decCtr__RDY) begin // RULE$decCtr__ENA
            c <= c + ( -1 );
        end; // End of RULE$decCtr__ENA
        if (RULE$incCtr__ENA & RULE$incCtr__RDY) begin // RULE$incCtr__ENA
            c <= c + 1;
        end; // End of RULE$incCtr__ENA
      end
    end // always @ (posedge CLK)
// start RULE$both__ENA
    genvar __inst$Genvar1;
    for(__inst$Genvar1 = 0; __inst$Genvar1 < depth; __inst$Genvar1 = __inst$Genvar1 + 1) begin

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if(RULE$both__RDY)
            q[__inst$Genvar1] <= ( ( !( ( ( __inst$Genvar1 + 1 ) == depth ) | ( c == ( __inst$Genvar1 + 1 ) ) ) ) ? q : 0 );
      end
    end // always @ (posedge CLK)
    end;
    genvar __inst$Genvar99;
    for(__inst$Genvar99 = 0; __inst$Genvar99 < 0; __inst$Genvar99 = __inst$Genvar99 + 1) begin

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if(RULE$both__RDY & RULE$both__ENA & ( __inst$Genvar99 == ( c - 1 ) ))
            q[__inst$Genvar99] <= x_wire;
      end
    end // always @ (posedge CLK)
    end;
// end RULE$both__ENA
// start RULE$decCtr__ENA
    for(__inst$Genvar1 = 0; __inst$Genvar1 < depth; __inst$Genvar1 = __inst$Genvar1 + 1) begin

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if(RULE$decCtr__RDY)
            q[__inst$Genvar1] <= ( ( __inst$Genvar1 + 1 ) == depth ) ? 0 : q;
      end
    end // always @ (posedge CLK)
    end;
// end RULE$decCtr__ENA
// start RULE$incCtr__ENA
    for(__inst$Genvar99 = 0; __inst$Genvar99 < 0; __inst$Genvar99 = __inst$Genvar99 + 1) begin

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if(RULE$incCtr__RDY & RULE$incCtr__ENA & ( __inst$Genvar99 == c ))
            q[__inst$Genvar99] <= x_wire;
      end
    end // always @ (posedge CLK)
    end;
// end RULE$incCtr__ENA
endmodule 

`default_nettype wire    // set back to default value
