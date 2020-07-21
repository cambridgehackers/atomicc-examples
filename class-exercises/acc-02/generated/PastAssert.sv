`include "pastassert.generated.vh"

`default_nettype none
module PastAssert #(
    parameter integer MAX_AMOUNT = 22,
    parameter integer F_TESTID = 9999)(
    input wire CLK, input wire nRST,
    input wire startSignal__ENA,
    output wire startSignal__RDY,
    output wire busy,
    output wire busy__RDY);
    reg [16 - 1:0]counter;
    reg fPastValid;
    wire RULE$decRule__RDY;
    wire RULE$verify4a__RDY;
    assign busy = !( counter == 0 );
    assign busy__RDY = 1;
    assign startSignal__RDY = counter == 0;
    // Extra assigments, not to output wires
    assign RULE$decRule__RDY = !( counter == 0 );
    assign RULE$verify4a__RDY = F_TESTID == 4;

    always @( posedge CLK) begin
      if (!nRST) begin
        counter <= 0;
        fPastValid <= 0;
      end // nRST
      else begin
        if (RULE$decRule__RDY) begin // RULE$decRule__ENA
            counter <= counter + ( -1 );
        end; // End of RULE$decRule__ENA
        if (RULE$verify4a__RDY) begin // RULE$verify4a__ENA
            fPastValid <= 1 != 0;
        end; // End of RULE$verify4a__ENA
        if (startSignal__ENA && startSignal__RDY) begin // startSignal__ENA
            counter <= MAX_AMOUNT - 1;
        end; // End of startSignal__ENA
      end
    end // always @ (posedge CLK)
`ifdef	FORMAL
    always @(*)
        assert( counter < MAX_AMOUNT );
    always @(*)
        assert( !startSignal__ENA );
    always @(*)
        assert( $past( counter == 0 ) );
    always @(*)
        assert( !startSignal__ENA );
    always @(*)
        assert( counter == 0 );
    always @(*)
        if (( $past{ counter } == 0 ) & $past{ startSignal__ENA })
            assert( counter == 0xffff );
    always @(*)
        if (( $past{ counter } == 0 ) & $past{ startSignal__ENA } & fPastValid)
            assert( counter == 0xffff );
`endif
endmodule

`default_nettype wire    // set back to default value
