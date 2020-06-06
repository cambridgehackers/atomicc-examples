`include "adapter.generated.vh"

`default_nettype none
module AdapterToBus #(
    parameter integer width = 32)(
    input wire CLK, input wire nRST,
    input wire in$enq__ENA,
    input wire [(16 + 128) - 1:0]in$enq$v,
    output wire in$enq__RDY,
    output wire out$enq__ENA,
    output wire [width - 1:0]out$enq$v,
    output wire out$enq$last,
    input wire out$enq__RDY);
    reg [144 - 1:0]buffer;
    reg [16 - 1:0]remain;
    wire [width - 1:0]RULE$copyRule$outVal;
    wire RULE$copyRule__RDY;
    assign in$enq__RDY = remain == 0;
    assign out$enq$last = remain == 1;
    assign out$enq$v = RULE$copyRule$outVal;
    assign out$enq__ENA = RULE$copyRule__RDY;
    // Extra assigments, not to output wires
    assign RULE$copyRule$outVal = buffer[ ( width - 1 ) : 0 ];
    assign RULE$copyRule__RDY = !( ( remain == 0 ) || ( !out$enq__RDY ) );

    always @( posedge CLK) begin
      if (!nRST) begin
        buffer <= 0;
        remain <= 0;
      end // nRST
      else begin
        if (RULE$copyRule__RDY) begin // RULE$copyRule__ENA
            remain <= remain + ( -1 );
            buffer <= buffer >> width;
            $display( "adapterTOout %x remain %x" , RULE$copyRule$outVal , remain );
        end; // End of RULE$copyRule__ENA
        if (in$enq__ENA && in$enq__RDY) begin // in$enq__ENA
            buffer <= in$enq$v[ ( (15 + 128) ) : 16 ];
            remain <= in$enq$v[ ( (-1 + 16) ) : 0 ];
            $display( "adapterTOin %x length %x" , in$enq$v[ ( (15 + 128) ) : 16 ] , in$enq$v[ ( (-1 + 16) ) : 0 ] );
        end; // End of in$enq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
