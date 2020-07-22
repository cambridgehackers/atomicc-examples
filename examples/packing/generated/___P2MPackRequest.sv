`include "packing.generated.vh"

`default_nettype none
module ___P2MPackRequest (input wire CLK, input wire nRST,
    output wire method$say__ENA,
    output wire [32 - 1:0]method$say$v,
    output wire [8 - 1:0]method$say$seqno,
    input wire method$say__RDY,
    input wire pipe$enq__ENA,
    input wire [(16 + 128) - 1:0]pipe$enq$v,
    output wire pipe$enq__RDY);
    assign method$say$seqno = pipe$enq$v[((16 + 128) - 32-24 - 32) -1 :(((16 + 128) - 32-24 - 32) - 8)];
    assign method$say$v = pipe$enq$v[(16 + 128) - 32-24 -1 :((16 + 128) - 32-24 - 32)];
    assign method$say__ENA = pipe$enq__ENA && ( pipe$enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0 );
    assign pipe$enq__RDY = method$say__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (pipe$enq__ENA && method$say__RDY) begin // pipe$enq__ENA
            $display( "DISPLAYP2M %x" , pipe$enq$v );
        end; // End of pipe$enq__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
