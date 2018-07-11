`include "lpm.generated.vh"

module LpmMemory (input CLK, input nRST,
    input ifc$req__ENA,
    input [95:0]ifc$req$v,
    output ifc$req__RDY,
    input ifc$resAccept__ENA,
    output ifc$resAccept__RDY,
    output [95:0]ifc$resValue,
    output ifc$resValue__RDY);
    wire CLK, nRST;
    reg [31:0]delayCount;
    reg [31:0]saved$a;
    reg [31:0]saved$b;
    reg [31:0]saved$c;
    wire memdelay_rule__ENA;
    assign memdelay_rule__ENA = ( delayCount  > 1 ) != 0;
    assign ifc$req__RDY = delayCount  == 32'd0;
    assign ifc$resAccept__RDY = delayCount  == 32'd1;
    assign ifc$resValue = { saved$c  , saved$b  , saved$a  };
    assign ifc$resValue__RDY = delayCount  == 32'd1;

    always @( posedge CLK) begin
      if (!nRST) begin
        delayCount <= 0;
        saved$a <= 0;
        saved$b <= 0;
        saved$c <= 0;
      end // nRST
      else begin
        if (ifc$req__ENA) begin
            delayCount  <= 4;
            { saved$c  , saved$b  , saved$a  } <= ifc$req$v;
        end; // End of ifc$req__ENA
        if (ifc$resAccept__ENA) begin
            delayCount  <= 0;
        end; // End of ifc$resAccept__ENA
        if (memdelay_rule__ENA) begin
            delayCount  <= delayCount - 1;
        end; // End of memdelay_rule__ENA
      end
    end // always @ (posedge CLK)
endmodule 

