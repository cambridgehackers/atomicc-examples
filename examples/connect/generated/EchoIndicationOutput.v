`include "connect.generated.vh"

module EchoIndicationOutput (input CLK, input nRST,
    input indication$heard__ENA,
    input [31:0]indication$heard$meth,
    input [31:0]indication$heard$v,
    output indication$heard__RDY,
    output pipe$enq__ENA,
    output [95:0]pipe$enq$v,
    input pipe$enq__RDY);
    wire CLK, nRST;
    wire [31:0]indication$heard__ENA$ind$data$heard$meth;
    wire [31:0]indication$heard__ENA$ind$data$heard$v;
    assign indication$heard__RDY = pipe$enq__RDY ;
    assign pipe$enq$v = { indication$heard__ENA$ind$data$heard$v  , indication$heard__ENA$ind$data$heard$meth  , 32'd1 };
    assign pipe$enq__ENA = indication$heard__ENA ;

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (indication$heard__ENA & indication$heard__RDY) begin
            indication$heard__ENA$ind$data$heard$meth  <= indication$heard$meth;
            indication$heard__ENA$ind$data$heard$v  <= indication$heard$v;
        end; // End of indication$heard__ENA
      end
    end // always @ (posedge CLK)
endmodule 

