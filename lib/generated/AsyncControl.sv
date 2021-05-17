`include "atomicc.generated.vh"
`default_nettype none
module AsyncControl (
    input wire CLK,
    input wire nRST,
    input wire start,
    input wire ack,
    input wire clear,
    output wire out,
    output wire done);
    reg doneReg;
    reg outReg;
    assign done = doneReg || ack;
    assign out = outReg || start;

    always @( posedge CLK) begin
      if (!nRST) begin
        doneReg <= 1'd0;
        outReg <= 1'd0;
      end // nRST
      else begin
        // RULE$processRule__ENA
            if (( ack | clear ) != 0)
            doneReg <= ack;
            if (( start | ack ) != 0) begin
            outReg <= start;
            doneReg <= 1'd0;
            end;
        // End of RULE$processRule__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
