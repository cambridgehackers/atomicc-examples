`include "atomicc.generated.vh"

`default_nettype none
module atomiccDummy (input wire CLK, input wire nRST,
    PipeIn.server pi,
    PipeOut.server po,
    PipeInLast.server pilast,
    PipeOutLast.server polast,
    PipeInLength.server pilength);
    NOCDataH dummyn;

    always @( posedge CLK) begin
      if (!nRST) begin
        dummyn <= 0;
      end // nRST
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
