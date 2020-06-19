`include "printf.generated.vh"

`default_nettype none
module ___M2PEchoIndication (input wire CLK, input wire nRST,
    input wire method$heard__ENA,
    input wire [32 - 1:0]method$heard$v,
    output wire method$heard__RDY,
    input wire method$heard2__ENA,
    input wire [16 - 1:0]method$heard2$a,
    input wire [16 - 1:0]method$heard2$b,
    output wire method$heard2__RDY,
    input wire method$heard3__ENA,
    input wire [16 - 1:0]method$heard3$a,
    input wire [32 - 1:0]method$heard3$b,
    input wire [32 - 1:0]method$heard3$c,
    input wire [16 - 1:0]method$heard3$d,
    output wire method$heard3__RDY,
    output wire pipe$enq__ENA,
    output wire [(16 + 128) - 1:0]pipe$enq$v,
    input wire pipe$enq__RDY);
    assign method$heard2__RDY = pipe$enq__RDY;
    assign method$heard3__RDY = pipe$enq__RDY;
    assign method$heard__RDY = pipe$enq__RDY;
    assign pipe$enq$v = ( ( method$heard__ENA && pipe$enq__RDY ) ? ( { 16'd0, 16'd5, method$heard$v, 64'd0, 16'd2} ) : 144'd0 ) | ( ( method$heard2__ENA && pipe$enq__RDY ) ? ( { 16'd1, 16'd5, method$heard2$a, method$heard2$b, 64'd0, 16'd2} ) : 144'd0 ) | ( ( method$heard3__ENA && pipe$enq__RDY ) ? ( { 16'd2, 16'd5, method$heard3$a, method$heard3$b, method$heard3$c, method$heard3$d, 16'd4} ) : 144'd0 );
    assign pipe$enq__ENA = method$heard__ENA || method$heard2__ENA || method$heard3__ENA;

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (method$heard2__ENA && pipe$enq__RDY) begin // method$heard2__ENA
            $display( "DISPLAYM2P %x" , { 16'd1, 16'd5, method$heard2$a, method$heard2$b, 64'd0, 16'd2} );
        end; // End of method$heard2__ENA
        if (method$heard3__ENA && pipe$enq__RDY) begin // method$heard3__ENA
            $display( "DISPLAYM2P %x" , { 16'd2, 16'd5, method$heard3$a, method$heard3$b, method$heard3$c, method$heard3$d, 16'd4} );
        end; // End of method$heard3__ENA
        if (method$heard__ENA && pipe$enq__RDY) begin // method$heard__ENA
            $display( "DISPLAYM2P %x" , { 16'd0, 16'd5, method$heard$v, 64'd0, 16'd2} );
        end; // End of method$heard__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
