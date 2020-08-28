`include "counter.generated.vh"

`default_nettype none
module Counter #(
    parameter integer MAX_AMOUNT = 22)(
    input wire CLK, input wire nRST,
    input wire startSignal__ENA,
    output wire startSignal__RDY,
    output wire busy,
    output wire busy__RDY);
    reg [16 - 1:0]counter;
    assign busy = !( counter == 0 );
    assign busy__RDY = 1;
    assign startSignal__RDY = counter == 0;

    always @( posedge CLK) begin
      if (!nRST) begin
        counter <= 0;
      end // nRST
      else begin
        if (!( counter == 0 )) begin // RULE$decRule__ENA
            counter <= counter + ( -1 );
        end; // End of RULE$decRule__ENA
        if (startSignal__ENA && ( counter == 0 )) begin // startSignal__ENA
            counter <= MAX_AMOUNT - 1;
        end; // End of startSignal__ENA
      end
    end // always @ (posedge CLK)
`ifdef	FORMAL
    always @(*)
        assert( counter < MAX_AMOUNT );
`endif
endmodule

`default_nettype wire    // set back to default value
