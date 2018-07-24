`include "lpm.generated.vh"

`default_nettype none
module Fifo2 (input wire CLK, input wire nRST,
    input wire in$enq__ENA,
    input wire [95:0]in$enq$v,
    output wire in$enq__RDY,
    input wire out$deq__ENA,
    output wire out$deq__RDY,
    output wire [95:0]out$first,
    output wire out$first__RDY);
    reg [31:0]element0$a;
    reg [31:0]element0$b;
    reg [31:0]element0$c;
    reg [31:0]element1$a;
    reg [31:0]element1$b;
    reg [31:0]element1$c;
    reg [31:0]rindex;
    reg [31:0]windex;
    wire [95:0]element0;
    wire [95:0]element1;
    assign in$enq__RDY = ( ( windex + 1 ) % 2 ) != rindex;
    assign out$deq__RDY = rindex != windex;
    assign out$first = ( rindex == 32'd0 ) ? { element0$c , element0$b , element0$a } : { element1$c , element1$b , element1$a };
    assign out$first__RDY = rindex != windex;
    // Extra assigments, not to output wires
    assign element0 = { element0$c , element0$b , element0$a };
    assign element1 = { element1$c , element1$b , element1$a };

    always @( posedge CLK) begin
      if (!nRST) begin
        element0$a <= 0;
        element0$b <= 0;
        element0$c <= 0;
        element1$a <= 0;
        element1$b <= 0;
        element1$c <= 0;
        rindex <= 0;
        windex <= 0;
      end // nRST
      else begin
        if (in$enq__ENA & in$enq__RDY) begin
            windex <= ( windex + 1 ) % 2;
            if (windex == 0)
            { element0$c , element0$b , element0$a } <= in$enq$v;
            if (windex == 1)
            { element1$c , element1$b , element1$a } <= in$enq$v;
        end; // End of in$enq__ENA
        if (out$deq__ENA & out$deq__RDY) begin
            rindex <= ( rindex + 1 ) % 2;
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
