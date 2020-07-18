`include "sizedFifo.generated.vh"

`default_nettype none
module SizedFifoBase #(
    parameter integer depth = 20,
    parameter integer width = 128,
    parameter integer bypass = 999)(
    input wire CLK, input wire nRST,
    input wire in$enq__ENA,
    input wire [width - 1:0]in$enq$v,
    output wire in$enq__RDY,
    input wire out$deq__ENA,
    output wire out$deq__RDY,
    output wire [width - 1:0]out$first,
    output wire out$first__RDY);
    reg [$clog2( depth + 0 )+1 - 1:0]c;
    reg [width - 1:0]q [depth - 1:0];
    wire [width - 1:0]x_wire;
    genvar __inst$Genvar1;
    assign in$enq__RDY = !( c == depth );
    assign out$deq__RDY = !( c == 0 );
    assign out$first = q[ 0 ];
    assign out$first__RDY = 1;
    // Extra assigments, not to output wires
    assign x_wire = in$enq$v;

    always @( posedge CLK) begin
      if (!nRST) begin
        c <= 0;
      end // nRST
      else begin
        if (in$enq__ENA && in$enq__RDY) begin // in$enq__ENA
            if (( bypass == 0 ) || ( out$deq__ENA == 0 )) begin
            q[c] <= in$enq$v;
            c <= c + 1;
            end;
        end; // End of in$enq__ENA
        if (out$deq__ENA && out$deq__RDY) begin // out$deq__ENA
            if (( bypass == 0 ) || ( in$enq__ENA == 0 ))
            c <= c + ( -1 );
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)

    for(__inst$Genvar1 = 0; ( __inst$Genvar1 + 1 ) < depth; __inst$Genvar1 = __inst$Genvar1 + 1) begin

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (out$deq__ENA && out$deq__RDY) begin // out$deq__ENA
            q[__inst$Genvar1] <= ( !( ( ( __inst$Genvar1 == ( c - 1 ) ) & ( bypass != 0 ) & in$enq__ENA ) == 0 ) ) ? x_wire : q[__inst$Genvar1 + 1];
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)
   end // end of forloop
endmodule 

`default_nettype wire    // set back to default value
