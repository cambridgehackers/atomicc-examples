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
    assign busy = !( counter == 0 );
    assign busy__RDY = 1;
    assign startSignal__RDY = counter == 0;
    // Extra assigments, not to output wires
    assign RULE$decRule__RDY = !( counter == 0 );

    always @( posedge CLK) begin
      if (!nRST) begin
        counter <= 0;
        fPastValid <= 0;
      end // nRST
      else begin
        if (RULE$decRule__RDY) begin // RULE$decRule__ENA
            counter <= counter + ( -1 );
        end; // End of RULE$decRule__ENA
        // RULE$verifyRule__ENA
            if (F_TESTID == 4)
            fPastValid <= 1 != 0;
        // End of RULE$verifyRule__ENA
        if (startSignal__ENA && startSignal__RDY) begin // startSignal__ENA
            counter <= MAX_AMOUNT - 1;
        end; // End of startSignal__ENA
      end
    end // always @ (posedge CLK)
`ifdef	FORMAL
    always @(*)
        assert( counter < MAX_AMOUNT );
    always @(*)
        if (F_TESTID == 1)
            assert( !startSignal__ENA );
    always @(*)
        if (F_TESTID == 1)
            assert( $past( counter == 0 ) );
    always @(*)
        if (F_TESTID == 2)
            assert( !startSignal__ENA );
    always @(*)
        if (F_TESTID == 2)
            assert( counter == 0 );
    always @( posedge CLK)
        if (( $past( counter ) == 0 ) && $past( startSignal__ENA ) && ( F_TESTID == 3 ))
            assert( counter == 16'hffff );
    always @( posedge CLK)
        if (( $past( counter ) == 0 ) && $past( startSignal__ENA ) && fPastValid && ( F_TESTID == 4 ))
            assert( counter == 16'hffff );
`endif
endmodule

`default_nettype wire    // set back to default value
