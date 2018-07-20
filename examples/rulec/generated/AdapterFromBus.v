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
    wire RULEpushValue__ENA;
    assign RULEpushValue__ENA = waitForEnq & out$enq__RDY;
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
        if (RULEpushValue__ENA & waitForEnq & out$enq__RDY) begin
            waitForEnq <= 0;
        end; // End of RULEpushValue__ENA
        if (in$enq__ENA & in$enq__RDY) begin
            buffer <= { buffer[95:0] , in$enq$v };
            if (in$enq$last)
            waitForEnq <= 1;
        end; // End of in$enq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
