`include "bscan.generated.vh"

`default_nettype none
module BscanLocal #(
    parameter integer width = 32)(
    input wire CLK,
    input wire nRST,
    input wire capture,
    input wire shift,
    input wire update,
    output wire TDO,
    input wire TDI,
    PipeIn.server toBscan,
    PipeIn.client fromBscan);
    reg notReady;
    reg [width - 1:0]shiftReg;
    wire RULE$updateRule__RDY;
    wire fromBscan$enqS__RDY;
    wire toBscan$enqS__ENA;
    SyncFF fromBscan$enq__RDYSyncFF (.CLK(CLK), .nRST(nRST),
        .out(fromBscan$enqS__RDY),
        .in(fromBscan.enq__RDY));
    SyncFF toBscan$enq__ENASyncFF (.CLK(CLK), .nRST(nRST),
        .out(toBscan$enqS__ENA),
        .in(toBscan.enq__ENA));
    assign TDO = shiftReg[ 0 : 0 ];
    // Extra assigments, not to output wires
    assign RULE$updateRule__RDY = !( ( 0 == update ) || ( !fromBscan$enqS__RDY ) );
    assign fromBscan.enq$v = shiftReg;
    assign fromBscan.enq__ENA = RULE$updateRule__RDY;
    assign toBscan.enq__RDY = !( notReady || ( !capture ) );

    always @( posedge CLK) begin
      if (!nRST) begin
        notReady <= 0;
        shiftReg <= 0;
      end // nRST
      else begin
        if (!( 0 == shift )) begin // RULE$shiftRule__ENA
            shiftReg <= { TDI , shiftReg[ ( width - 1 ) : 1 ] };
        end; // End of RULE$shiftRule__ENA
        if (RULE$updateRule__RDY) begin // RULE$updateRule__ENA
            notReady <= 0;
        end; // End of RULE$updateRule__ENA
        if (!( notReady || ( !capture ) || ( !toBscan$enqS__ENA ) )) begin // toBscan.enq__ENA
            shiftReg <= toBscan.enq$v;
            notReady <= 1;
        end; // End of toBscan.enq__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
