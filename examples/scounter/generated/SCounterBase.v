`include "scounter.generated.vh"

`default_nettype none
module SCounterBase #(
    parameter integer depth = 10,
    parameter integer width = 999,
    parameter integer bypass = 444)(
    input wire CLK, input wire nRST,
    input wire in$enq__ENA,
    input wire [width - 1:0]in$enq$v,
    output wire in$enq__RDY,
    input wire out$deq__ENA,
    output wire out$deq__RDY,
    output wire [width - 1:0]out$first,
    output wire out$first__RDY);
    reg [depth - 1:0]c;
    reg [width - 1:0]q [depth:0];
    genvar __inst$Genvar1;
    assign in$enq__RDY = !( c == depth );
    assign out$deq__RDY = !( c == 0 );
    assign out$first = q[ 0 ];
    assign out$first__RDY = 1;

    always @( posedge CLK) begin
      if (!nRST) begin
        c <= 0;
      end // nRST
      else begin
        if (!( ( c == depth ) | ( !in$enq__ENA ) )) begin // in$enq__ENA
            if (( out$deq__ENA == 0 ) | ( !( bypass == bypass ) )) begin
            q <= in$enq$v;
            c <= c + 1;
            end;
        end; // End of in$enq__ENA
        if (!( ( c == 0 ) | ( !out$deq__ENA ) )) begin // out$deq__ENA
            c <= c + ( -1 );
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)

    for(__inst$Genvar1 = 0; ( __inst$Genvar1 + 1 ) < depth; __inst$Genvar1 = __inst$Genvar1 + 1) begin

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (!( ( c == 0 ) | ( !out$deq__ENA ) )) begin // out$deq__ENA
            q[__inst$Genvar1] <= ( !( ( ( __inst$Genvar1 == ( c - 1 ) ) & ( bypass == bypass ) & in$enq__ENA ) == 0 ) ) ? in$enq$v : q[__inst$Genvar1 + 1];
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)
   end // end of generate
endmodule 

`default_nettype wire    // set back to default value
