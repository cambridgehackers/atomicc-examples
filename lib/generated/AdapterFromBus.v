`include "adapter.generated.vh"

`default_nettype none
module AdapterFromBus (input wire CLK, input wire nRST,
    input wire in$enq__ENA,
    input wire [32 - 1:0]in$enq$v,
    input wire [16 - 1:0]in$enq$length,
    output wire in$enq__RDY,
    output wire out$enq__ENA,
    output wire [128 - 1:0]out$enq$v,
    output wire [16 - 1:0]out$enq$length,
    input wire out$enq__RDY);
    reg [128 - 1:0]buffer;
    reg waitForEnq;
    wire RULE$pushValue__RDY;
    assign in$enq__RDY = !waitForEnq;
    assign out$enq$length = 16'd0;
    assign out$enq$v = buffer;
    assign out$enq__ENA = RULE$pushValue__RDY;
    // Extra assigments, not to output wires
    assign RULE$pushValue__RDY = waitForEnq & out$enq__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
        buffer <= 0;
        waitForEnq <= 0;
      end // nRST
      else begin
        if (RULE$pushValue__RDY) begin // RULE$pushValue__ENA
            waitForEnq <= 0 != 0;
        end; // End of RULE$pushValue__ENA
        if (in$enq__ENA & in$enq__RDY) begin // in$enq__ENA
            buffer <= { buffer[ ( ( 128 - 32 ) - 1 ) : 0 ] , in$enq$v };
            if (in$enq$length == 1)
            waitForEnq <= 1 != 0;
        end; // End of in$enq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
