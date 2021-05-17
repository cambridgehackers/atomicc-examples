`include "atomicc.generated.vh"
`default_nettype none
module Counter #(
    parameter integer MAX_AMOUNT = 22)(
    input wire CLK, input wire nRST,
    input wire startSignal__ENA,
    output wire startSignal__RDY,
    output wire busy,
    output wire busy__RDY);
    reg [16 - 1:0]counter;
    logic RULE$decRule__ENA;
    assign busy = counter != 0;
    assign busy__RDY = 1'd1;
    assign startSignal__RDY = counter == 0;
    // Extra assigments, not to output wires
    assign RULE$decRule__ENA = counter != 0;

    always @( posedge CLK) begin
      if (!nRST) begin
        counter <= 16'd0;
      end // nRST
      else begin
        if (( counter != 0 ) && RULE$decRule__ENA) begin // RULE$decRule__ENA
            counter <= counter + ( -16'd1 );
        end; // End of RULE$decRule__ENA
        if (( counter == 0 ) && startSignal__ENA) begin // startSignal__ENA
            counter <= ( ((16)'(MAX_AMOUNT)) ) - 16'd1;
        end; // End of startSignal__ENA
      end
    end // always @ (posedge CLK)
`ifdef	FORMAL
    initial begin
        counter <= 16'd0;
    end
    always @(*)
        assert( counter < ( ((16)'(MAX_AMOUNT)) ) );
`endif
endmodule

`default_nettype wire    // set back to default value
