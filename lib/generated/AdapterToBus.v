`include "adapter.generated.vh"

`default_nettype none
module AdapterToBus (input wire CLK, input wire nRST,
    input wire in$enq__ENA,
    input wire [128 - 1:0]in$enq$v,
    input wire [16 - 1:0]in$enq$length,
    output wire in$enq__RDY,
    output wire out$enq__ENA,
    output wire [32 - 1:0]out$enq$v,
    output wire out$enq$last,
    input wire out$enq__RDY);
    reg [128 - 1:0]buffer;
    reg [16 - 1:0]remain;
    wire RULE$copyRule__RDY;
    assign in$enq__RDY = remain == 0;
    assign out$enq$last = remain == 1;
    assign out$enq$v = buffer[ 31 : 0 ];
    assign out$enq__ENA = RULE$copyRule__RDY;
    // Extra assigments, not to output wires
    assign RULE$copyRule__RDY = !( ( remain == 0 ) || ( !out$enq__RDY ) );

    always @( posedge CLK) begin
      if (!nRST) begin
        buffer <= 0;
        remain <= 0;
      end // nRST
      else begin
        if (RULE$copyRule__RDY) begin // RULE$copyRule__ENA
            remain <= remain + ( -1 );
            buffer <= buffer >> 32;
        end; // End of RULE$copyRule__ENA
        if (in$enq__ENA && in$enq__RDY) begin // in$enq__ENA
            buffer <= in$enq$v;
            remain <= in$enq$length;
        end; // End of in$enq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
