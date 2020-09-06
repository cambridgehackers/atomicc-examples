`include "lpmmemory.generated.vh"

`default_nettype none
module LpmMemory (input wire CLK, input wire nRST,
    input wire req__ENA,
    input wire [32 - 1:0]req$v,
    output wire req__RDY,
    input wire resAccept__ENA,
    output wire resAccept__RDY,
    output wire [32 - 1:0]resValue,
    output wire resValue__RDY);
    reg [32 - 1:0]delayCount;
    reg [32 - 1:0]saved;
    wire RULE$memdelay_rule__ENA;
    wire RULE$memdelay_rule__RDY;
    assign req__RDY = delayCount == 0;
    assign resAccept__RDY = delayCount == 1;
    assign resValue = saved;
    assign resValue__RDY = delayCount == 1;
    // Extra assigments, not to output wires
    assign RULE$memdelay_rule__ENA = !( 0 == ( delayCount > 1 ) );
    assign RULE$memdelay_rule__RDY = !( 0 == ( delayCount > 1 ) );

    always @( posedge CLK) begin
      if (!nRST) begin
        delayCount <= 0;
        saved <= 0;
      end // nRST
      else begin
        if (RULE$memdelay_rule__ENA && RULE$memdelay_rule__RDY) begin // RULE$memdelay_rule__ENA
            delayCount <= delayCount - 1;
        end; // End of RULE$memdelay_rule__ENA
        if (req__ENA && ( delayCount == 0 )) begin // req__ENA
            delayCount <= 4;
            saved <= req$v;
        end; // End of req__ENA
        if (resAccept__ENA && ( delayCount == 1 )) begin // resAccept__ENA
            delayCount <= 0;
        end; // End of resAccept__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
