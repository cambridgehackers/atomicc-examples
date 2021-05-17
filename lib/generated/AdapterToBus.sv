`include "atomicc.generated.vh"
`default_nettype none
module AdapterToBus #(
    parameter integer width = 128,
    parameter integer owidth = 32)(
    input wire CLK, input wire nRST,
    input wire clear__ENA,
    output wire clear__RDY,
    PipeInLength.server in,
    PipeOutLast.server out);
    reg [width - 1:0]buffer;
    reg [16 - 1:0]remain;
    assign clear__RDY = 1'd1;
    // Extra assigments, not to output wires
    assign in.enq__RDY = ( remain == 0 ) || clear__ENA;
    assign out.deq__RDY = clear__ENA || ( remain != 0 );
    assign out.first = buffer[ ( width - 1 ) : ( width - owidth ) ];
    assign out.first__RDY = clear__ENA || ( remain != 0 );
    assign out.last = remain <= ( ( 16 ) ' ( owidth ) );
    assign out.last__RDY = clear__ENA || ( remain != 0 );

    always @( posedge CLK) begin
      if (!nRST) begin
        buffer <= (width) ' ('d0);
        remain <= 16'd0;
      end // nRST
      else begin
        if (clear__ENA) begin // clear__ENA
            remain <= 16'd0;
        end; // End of clear__ENA
        if (( ( remain == 0 ) && in.enq__ENA ) || ( ( remain != 0 ) && clear__ENA && in.enq__ENA )) begin // in.enq__ENA
            buffer <= in.enq$v;
            remain <= in.enq$size;
            if (0 != 0)
            $display( "adapterTOin %x length %x" , in.enq$v , in.enq$size );
        end; // End of in.enq__ENA
        if (( clear__ENA && out.deq__ENA ) || ( ( !clear__ENA ) && ( remain != 0 ) && out.deq__ENA )) begin // out.deq__ENA
            buffer <= buffer << owidth;
            if (!( remain <= ( ( 16 ) ' ( owidth ) ) ))
            remain <= remain - ( ((16)'(owidth)) );
            if (0 != 0)
            $display( "adapterTOout remain %x" , remain );
            if (remain <= ( ( 16 ) ' ( owidth ) ))
            remain <= 16'd0;
        end; // End of out.deq__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
