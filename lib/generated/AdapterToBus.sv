`include "adapter.generated.vh"

`default_nettype none
module AdapterToBus #(
    parameter integer width = 32)(
    input wire CLK, input wire nRST,
    PipeIn.server in,
    PipeInB.client out);
    reg [128 - 1:0]buffer;
    reg [16 - 1:0]remain;
    wire [width - 1:0]RULE$copyRule$outVal;
    wire RULE$copyRule__RDY;
    NOCDataH temp;
    // Extra assigments, not to output wires
    assign RULE$copyRule$outVal = buffer[ ( 128 - 1 ) : ( 128 - width ) ];
    assign RULE$copyRule__RDY = !( ( remain == 0 ) || ( !out.enq__RDY ) );
    assign in.enq__RDY = remain == 0;
    assign out.enq$last = remain == 1;
    assign out.enq$v = buffer[ ( 128 - 1 ) : ( 128 - width ) ];
    assign out.enq__ENA = RULE$copyRule__RDY;
    assign temp = in.enq$v;

    always @( posedge CLK) begin
      if (!nRST) begin
        buffer <= 0;
        remain <= 0;
      end // nRST
      else begin
        if (RULE$copyRule__RDY) begin // RULE$copyRule__ENA
            remain <= remain + ( -1 );
            buffer <= buffer << width;
            if (!( 0 == 0 ))
            $display( "adapterTOout %x remain %x" , RULE$copyRule$outVal , remain );
        end; // End of RULE$copyRule__ENA
        if (in.enq__ENA && ( remain == 0 )) begin // in.enq__ENA
            buffer <= temp.data;
            remain <= temp.length;
            if (!( 0 == 0 ))
            $display( "adapterTOin %x length %x" , temp.data , temp.length );
        end; // End of in.enq__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
