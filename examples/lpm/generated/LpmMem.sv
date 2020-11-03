`include "lpm.generated.vh"

`default_nettype none
module LpmMem (input wire CLK, input wire nRST,
    input wire read__ENA,
    input wire [32 - 1:0]read$addr,
    output wire read__RDY,
    input wire write__ENA,
    input wire [32 - 1:0]write$addr,
    input wire [32 - 1:0]write$data,
    output wire write__RDY,
    PipeOut.server out);
    reg valid;
    logic RAM$dataOut__RDY;
    logic RAM$read__RDY;
    BRAM#(.width(32),.depth(1024)) RAM (.CLK(CLK), .nRST(nRST),
        .write__ENA(write__ENA),
        .write$addr(write__ENA ? write$addr : 32'd0),
        .write$data(write__ENA ? write$data : 32'd0),
        .write__RDY(write__RDY),
        .read__ENA(read__ENA),
        .read$addr(read__ENA ? read$addr : 32'd0),
        .read__RDY(RAM$read__RDY),
        .dataOut(out.first),
        .dataOut__RDY(RAM$dataOut__RDY));
    assign read__RDY = !( ( 0 == ( valid ^ 1 ) ) || ( !RAM$read__RDY ) );
    // Extra assigments, not to output wires
    assign out.deq__RDY = !( 0 == valid );
    assign out.first__RDY = !( ( 0 == valid ) || ( !RAM$dataOut__RDY ) );

    always @( posedge CLK) begin
      if (!nRST) begin
        valid <= 0;
      end // nRST
      else begin
        if (!( ( 0 == valid ) || ( !out.deq__ENA ) )) begin // out.deq__ENA
            valid <= 1'd0;
            $display( "LpmMem out$deq:" );
        end; // End of out.deq__ENA
        if (read__RDY && read__ENA) begin // read__ENA
            valid <= 1'd1;
            $display( "LpmMem read: %x" , read$addr );
        end; // End of read__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
