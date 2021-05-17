`include "atomicc.generated.vh"
`default_nettype none
module SizedFifoBase #(
    parameter integer depth = 20,
    parameter integer width = 128,
    parameter integer bypass = 999)(
    input wire CLK, input wire nRST,
    PipeIn.server in,
    PipeOut.server out);
    reg [$clog2(depth+0)+1 - 1:0]c;
    reg [width - 1:0]q [depth - 1:0];
    logic [width - 1:0]x_wire;
    // Extra assigments, not to output wires
    assign in.enq__RDY = c != ( (($clog2(depth+0)+1)'(depth)) );
    assign out.deq__RDY = c != 0;
    assign out.first = q[ 0 ];
    assign out.first__RDY = 1'd1;
    assign x_wire = in.enq__ENA ? in.enq$v : ( (width) ' ('d0) );

    always @( posedge CLK) begin
      if (!nRST) begin
        c <= ($clog2(depth+0)+1) ' ('d0);
      end // nRST
      else begin
        if (( c != ( ( $clog2( depth + 0 ) + 1 ) ' ( depth ) ) ) && in.enq__ENA) begin // in.enq__ENA
            if (( bypass == 0 ) || ( !out.deq__ENA )) begin
            q[ c ] <= in.enq$v;
            c <= c + ( ($clog2(depth+0)+1) ' ('d1) );
            end;
        end; // End of in.enq__ENA
        if (( c != 0 ) && out.deq__ENA) begin // out.deq__ENA
            if (( bypass == 0 ) || ( !in.enq__ENA ))
            c <= c + ( -( ($clog2(depth+0)+1) ' ('d1) ) );
        end; // End of out.deq__ENA
      end
    end // always @ (posedge CLK)

    for(genvar __inst$Genvar1 = 0; ( __inst$Genvar1 + 1 ) < depth; __inst$Genvar1 = __inst$Genvar1 + 1) begin

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (( c != 0 ) && out.deq__ENA) begin // out.deq__ENA
            q[ __inst$Genvar1 ] <= ( ( ( __inst$Genvar1 == ( c - 1 ) ) & ( bypass != 0 ) & in.enq__ENA ) != 0 ) ? x_wire : q[ __inst$Genvar1 + 1 ];
        end; // End of out.deq__ENA
      end
    end // always @ (posedge CLK)
   end // end of forloop
endmodule

`default_nettype wire    // set back to default value
