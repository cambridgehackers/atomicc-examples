`include "adapter.generated.vh"

`default_nettype none
module AdapterToBus #(
    parameter integer width = 32)(
    input wire CLK, input wire nRST,
    PipeIn.server in,
    PipeInB.client out);
    reg [128 - 1:0]buffer;
    reg [16 - 1:0]remain;
    wire RULE$copyRule__RDY;
    wire [width - 1:0]_RULE$copyRule$outVal;
    NOCDataH _in$enq$temp$v;
    // Extra assigments, not to output wires
    assign RULE$copyRule__RDY = !( ( remain == 0 ) || ( !out.enq__RDY ) );
    assign _RULE$copyRule$outVal = buffer[ ( 128 - 1 ) : ( 128 - width ) ];
    assign _in$enq$temp$v = in.enq$v;
    assign in.enq__RDY = remain == 0;
    assign out.enq$last = remain == 1;
    assign out.enq$v = buffer[ ( 128 - 1 ) : ( 128 - width ) ];
    assign out.enq__ENA = RULE$copyRule__RDY;

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
            $display( "adapterTOout %x remain %x" , _RULE$copyRule$outVal , remain );
        end; // End of RULE$copyRule__ENA
        if (in.enq__ENA && ( remain == 0 )) begin // in.enq__ENA
            buffer <= _in$enq$temp$v.data;
            remain <= _in$enq$temp$v.length;
            if (!( 0 == 0 ))
            $display( "adapterTOin %x length %x" , _in$enq$temp$v.data , _in$enq$temp$v.length );
        end; // End of in.enq__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
