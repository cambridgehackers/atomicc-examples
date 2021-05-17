`include "atomicc.generated.vh"
`include "lpm.generated.vh"
`default_nettype none
module BufTicket (input wire CLK, input wire nRST,
    output wire [4 - 1:0]getTicket,
    output wire getTicket__RDY,
    input wire allocateTicket__ENA,
    output wire allocateTicket__RDY);
    reg [4 - 1:0]current;
    assign allocateTicket__RDY = 1'd1;
    assign getTicket = current;
    assign getTicket__RDY = 1'd1;

    always @( posedge CLK) begin
      if (!nRST) begin
        current <= 4'd0;
      end // nRST
      else begin
        if (allocateTicket__ENA) begin // allocateTicket__ENA
            current <= current + 4'd1;
            $display( "BufTicket allocateTicket %x" , current );
        end; // End of allocateTicket__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
