`include "bscant.generated.vh"

`default_nettype none
module ___M2PBtestIndication (input wire CLK, input wire nRST,
    input wire method$ack__ENA,
    input wire [32 - 1:0]method$ack$v,
    input wire [8 - 1:0]method$ack$seqno,
    output wire method$ack__RDY,
    input wire method$heard__ENA,
    input wire [32 - 1:0]method$heard$v,
    input wire [8 - 1:0]method$heard$writeCount,
    input wire [8 - 1:0]method$heard$readCount,
    input wire [32 - 1:0]method$heard$next,
    output wire method$heard__RDY,
    output wire pipe$enq__ENA,
    output wire [(16 + 128) - 1:0]pipe$enq$v,
    input wire pipe$enq__RDY);
    assign method$ack__RDY = pipe$enq__RDY;
    assign method$heard__RDY = pipe$enq__RDY;
    assign pipe$enq$v = ( ( method$ack__ENA && pipe$enq__RDY ) ? ( { 16'd0, 16'd5, 24'd0, method$ack$v, method$ack$seqno, 32'd0, 16'd3} ) : 144'd0 ) | ( ( method$heard__ENA && pipe$enq__RDY ) ? ( { 16'd1, 16'd5, 16'd0, method$heard$v, method$heard$writeCount, method$heard$readCount, method$heard$next, 16'd4} ) : 144'd0 );
    assign pipe$enq__ENA = method$ack__ENA || method$heard__ENA;

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (method$ack__ENA && pipe$enq__RDY) begin // method$ack__ENA
            $display( "DISPLAYM2P %x" , { 16'd0, 16'd5, 24'd0, method$ack$v, method$ack$seqno, 32'd0, 16'd3} );
        end; // End of method$ack__ENA
        if (method$heard__ENA && pipe$enq__RDY) begin // method$heard__ENA
            $display( "DISPLAYM2P %x" , { 16'd1, 16'd5, 16'd0, method$heard$v, method$heard$writeCount, method$heard$readCount, method$heard$next, 16'd4} );
        end; // End of method$heard__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
