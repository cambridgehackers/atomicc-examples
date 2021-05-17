`include "atomicc.generated.vh"
`default_nettype none
module MIMOBase #(
    parameter integer widthIn = 32,
    parameter integer widthOut = 128)(
    input wire CLK, input wire nRST,
    PipeIn.server in,
    PipeOut.server out);
    reg [widthOut+widthIn - 1:0]buffer;
    reg [$clog2(widthOut+widthIn)+1 - 1:0]c;
    logic [widthIn - 1:0]m;
    // Extra assigments, not to output wires
    assign in.enq__RDY = !( c >= ( (($clog2(widthOut+widthIn)+1)'(widthOut)) ) );
    assign m = in.enq__ENA ? in.enq$v : ( (widthIn) ' ('d0) );
    assign out.deq__RDY = ( c >= widthOut ) != 0;
    assign out.first = buffer;
    assign out.first__RDY = ( c >= widthOut ) != 0;

    always @( posedge CLK) begin
      if (!nRST) begin
        buffer <= (widthOut+widthIn) ' ('d0);
        c <= ($clog2(widthOut+widthIn)+1) ' ('d0);
      end // nRST
      else begin
        if (( !( c >= ( ( $clog2( widthOut + widthIn ) + 1 ) ' ( widthOut ) ) ) ) && in.enq__ENA) begin // in.enq__ENA
            c <= c + ( (($clog2(widthOut+widthIn)+1)'(widthIn)) );
        end; // End of in.enq__ENA
        if (( ( c >= widthOut ) != 0 ) && out.deq__ENA) begin // out.deq__ENA
            buffer <= buffer[ ( ( widthOut + widthIn ) - 1 ) : widthOut ];
            if (!( c <= ( ( $clog2( widthOut + widthIn ) + 1 ) ' ( widthOut ) ) ))
            c <= c - ( (($clog2(widthOut+widthIn)+1)'(widthOut)) );
            if (c <= ( ( $clog2( widthOut + widthIn ) + 1 ) ' ( widthOut ) ))
            c <= ($clog2(widthOut+widthIn)+1) ' ('d0);
        end; // End of out.deq__ENA
      end
    end // always @ (posedge CLK)

    for(genvar __inst$Genvar1 = 0; __inst$Genvar1 < widthOut; __inst$Genvar1 = __inst$Genvar1 + 1) begin

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (( !( c >= ( ( $clog2( widthOut + widthIn ) + 1 ) ' ( widthOut ) ) ) ) && in.enq__ENA) begin // in.enq__ENA
            if (( widthOut - __inst$Genvar1 ) == c)
            buffer[ ( ( __inst$Genvar1 + widthIn ) - 1 ) : __inst$Genvar1 ] <= m;
        end; // End of in.enq__ENA
      end
    end // always @ (posedge CLK)
   end // end of forloop
endmodule

`default_nettype wire    // set back to default value
