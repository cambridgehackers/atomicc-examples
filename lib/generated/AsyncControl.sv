`include "asyncControl.generated.vh"

`default_nettype none
module AsyncControl (
    input wire CLK,
    input wire nRST,
    input wire start,
    input wire end,
    input wire clear,
    output wire out,
    output wire done);
    reg doneReg;
    reg outReg;
    assign done = doneReg;
    assign out = outReg;

    always @( posedge CLK) begin
      if (!nRST) begin
        doneReg <= 0;
        outReg <= 0;
      end // nRST
      else begin
        // RULE$processRule__ENA
            if (( end | clear ) != 0)
            doneReg <= end;
            if (( start | end ) != 0)
            outReg <= ( end != 0 ) ^ 1'd1;
        // End of RULE$processRule__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
