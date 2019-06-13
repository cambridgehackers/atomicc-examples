`include "memory.generated.vh"

`default_nettype none
module LpmMemory (input wire CLK, input wire nRST,
    input wire ifc$req__ENA,
    input wire [32 - 1:0]ifc$req$v,
    output wire ifc$req__RDY,
    input wire ifc$resAccept__ENA,
    output wire ifc$resAccept__RDY,
    output wire [32 - 1:0]ifc$resValue,
    output wire ifc$resValue__RDY);
    reg [32 - 1:0]delayCount;
    reg [32 - 1:0]saved;
    assign ifc$req__RDY = delayCount == 0;
    assign ifc$resAccept__RDY = delayCount == 1;
    assign ifc$resValue = saved;
    assign ifc$resValue__RDY = delayCount == 1;

    always @( posedge CLK) begin
      if (!nRST) begin
        delayCount <= 0;
        saved <= 0;
      end // nRST
      else begin
        if (delayCount > 1) begin // RULE$memdelay_rule__ENA
            delayCount <= delayCount - 1;
        end; // End of RULE$memdelay_rule__ENA
        if (ifc$req__ENA & ( delayCount == 0 )) begin // ifc$req__ENA
            delayCount <= 4;
            saved <= ifc$req$v;
        end; // End of ifc$req__ENA
        if (ifc$resAccept__ENA & ( delayCount == 1 )) begin // ifc$resAccept__ENA
            delayCount <= 0;
        end; // End of ifc$resAccept__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
