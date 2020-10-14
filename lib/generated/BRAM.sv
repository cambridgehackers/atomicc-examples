`include "bram.generated.vh"

`default_nettype none
module BRAM #(
    parameter integer width = 4,
    parameter integer depth = 1024)(
    input wire CLK, input wire nRST,
    input wire write__ENA,
    input wire [$clog2(depth) - 1:0]write$addr,
    input wire [width - 1:0]write$data,
    output wire write__RDY,
    input wire read__ENA,
    input wire [$clog2(depth) - 1:0]read$addr,
    output wire read__RDY,
    output wire [width - 1:0]dataOut,
    output wire dataOut__RDY);
    reg [width - 1:0]RAM [depth - 1:0];
    reg [width - 1:0]readB;
    reg writeEnable;
    assign dataOut = readB;
    assign dataOut__RDY = !( 0 == ( ( read__ENA != 0 ) ^ 1 ) );
    assign read__RDY = 1'd1;
    assign write__RDY = 1'd1;

    always @( posedge CLK) begin
      if (!nRST) begin
        readB <= 0;
        writeEnable <= 0;
      end // nRST
      else begin
        // RULE$init__ENA
            writeEnable <= 1'd1;
        // End of RULE$init__ENA
        if (read__ENA) begin // read__ENA
            readB <= RAM[ read$addr ];
        end; // End of read__ENA
        if (write__ENA) begin // write__ENA
            if (!( writeEnable == 0 ))
            RAM[ write$addr ] <= write$data;
        end; // End of write__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
