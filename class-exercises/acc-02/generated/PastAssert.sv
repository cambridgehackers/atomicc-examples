`include "atomicc.generated.vh"
`default_nettype none
module PastAssert #(
    parameter integer MAX_AMOUNT = 22,
    parameter integer F_TESTID = 9999)(
    input wire CLK, input wire nRST,
    input wire startSignal__ENA,
    output wire startSignal__RDY,
    output wire busy,
    output wire busy__RDY);
    reg [4 - 1:0]ZF_TESTID;
    reg [16 - 1:0]counter;
    reg fPastValid;
    logic RULE$decRule__ENA;
    assign busy = counter != 0;
    assign busy__RDY = 1'd1;
    assign startSignal__RDY = counter == 0;
    // Extra assigments, not to output wires
    assign RULE$decRule__ENA = counter != 0;

    always @( posedge CLK) begin
      if (!nRST) begin
        ZF_TESTID <= 0;
        counter <= 0;
        fPastValid <= 0;
      end // nRST
      else begin
        if (( counter != 0 ) && RULE$decRule__ENA) begin // RULE$decRule__ENA
            counter <= counter + ( -16'd1 );
        end; // End of RULE$decRule__ENA
        // RULE$verifyRule__ENA
            if (ZF_TESTID == 4)
            fPastValid <= 1 != 0;
        // End of RULE$verifyRule__ENA
        if (( counter == 0 ) && startSignal__ENA) begin // startSignal__ENA
            counter <= ( (16'(MAX_AMOUNT)) ) - 16'd1;
            ZF_TESTID <= ZF_TESTID + 4'd1;
        end; // End of startSignal__ENA
      end
    end // always @ (posedge CLK)
`ifdef	FORMAL
    initial begin
        ZF_TESTID <= 0;
        counter <= 0;
        fPastValid <= 0;
    end
    always @(*)
        assert( counter < ( (16'(MAX_AMOUNT)) ) );
    always @(*)
        if (ZF_TESTID == 1)
            assert( ( startSignal__ENA != 0 ) ^ 1'd1 );
    always @( posedge CLK)
        if (ZF_TESTID == 1)
            assert( $past( counter == 0 ) );
    always @(*)
        if (ZF_TESTID == 2)
            assert( ( startSignal__ENA != 0 ) ^ 1'd1 );
    always @(*)
        if (ZF_TESTID == 2)
            assert( counter == 0 );
    always @( posedge CLK)
        if (( $past( startSignal__ENA ) != 0 ) && ( ZF_TESTID == 3 ) && ( $past( counter ) == 0 ))
            assert( counter == ( -1 ) );
    always @( posedge CLK)
        if (( $past( startSignal__ENA ) != 0 ) && fPastValid && ( ZF_TESTID == 4 ) && ( $past( counter ) == 0 ))
            assert( counter == ( -1 ) );
`endif
endmodule

`default_nettype wire    // set back to default value
