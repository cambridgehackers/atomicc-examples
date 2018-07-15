`include "rulec.generated.vh"

`default_nettype none
module AdapterFromBus (input wire CLK, input wire nRST,
    input wire in$enq__ENA,
    input wire [31:0]in$enq$v,
    input wire in$enq$last,
    output wire in$enq__RDY,
    output wire out$enq__ENA,
    output wire [127:0]out$enq$v,
    output wire [15:0]out$enq$length,
    input wire out$enq__RDY);
    reg [127:0]buffer;
    reg waitForEnq;
    wire pushValue__ENA;
    assign pushValue__ENA = waitForEnq & out$enq__RDY;
    assign in$enq__RDY = !waitForEnq;
    assign out$enq$length = 0;
    assign out$enq$v = buffer;
    assign out$enq__ENA = waitForEnq;

    always @( posedge CLK) begin
      if (!nRST) begin
        buffer <= 0;
        waitForEnq <= 0;
      end // nRST
      else begin
        if (in$enq__ENA & in$enq__RDY) begin
            buffer <= in$enq$v | ( buffer << 32 );
            if (in$enq$last)
            waitForEnq <= 1;
        end; // End of in$enq__ENA
        if (pushValue__ENA & waitForEnq & out$enq__RDY) begin
            waitForEnq <= 0;
        end; // End of pushValue__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
