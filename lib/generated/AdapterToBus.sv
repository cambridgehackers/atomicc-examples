`include "adapter.generated.vh"

`default_nettype none
module AdapterToBus #(
    parameter integer width = 128,
    parameter integer owidth = 32)(
    input wire CLK, input wire nRST,
    PipeInLength.server in,
    PipeInLast.client out);
    reg [width - 1:0]buffer;
    reg [16 - 1:0]remain;
    logic RULE$copyRule__ENA;
    logic RULE$copyRule__RDY;
    logic [owidth - 1:0]_RULE$copyRule$outVal;
    // Extra assigments, not to output wires
    assign RULE$copyRule__ENA = !( ( remain == 0 ) || ( !out.enq__RDY ) );
    assign RULE$copyRule__RDY = !( ( remain == 0 ) || ( !out.enq__RDY ) );
    assign _RULE$copyRule$outVal = buffer[ ( width - 1 ) : ( width - owidth ) ];
    assign in.enq__RDY = remain == 0;
    assign out.enq$last = !( ( remain == 0 ) || ( !( remain <= 16'(owidth) ) ) );
    assign out.enq$v = ( !( remain == 0 ) ) ? buffer[ ( width - 1 ) : ( width - owidth ) ] : 0;
    assign out.enq__ENA = !( remain == 0 );

    always @( posedge CLK) begin
      if (!nRST) begin
        buffer <= 0;
        remain <= 0;
      end // nRST
      else begin
        if (RULE$copyRule__ENA && RULE$copyRule__RDY) begin // RULE$copyRule__ENA
            buffer <= buffer << owidth;
            if (!( 0 == 0 ))
            $display( "adapterTOout %x remain %x" , _RULE$copyRule$outVal , remain );
            if (!( remain <= 16'(owidth) ))
            remain <= remain - ( (16'(owidth)) );
            if (remain <= 16'(owidth))
            remain <= 16'd0;
        end; // End of RULE$copyRule__ENA
        if (in.enq__ENA && ( remain == 0 )) begin // in.enq__ENA
            buffer <= in.enq$v;
            remain <= in.enq$size;
            if (!( 0 == 0 ))
            $display( "adapterTOin %x length %x" , in.enq$v , in.enq$size );
        end; // End of in.enq__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
