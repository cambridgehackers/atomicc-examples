`include "connect.generated.vh"

`default_nettype none
module EchoIndicationOutput (input wire CLK, input wire nRST,
    input wire indication$heard__ENA,
    input wire [31:0]indication$heard$meth,
    input wire [31:0]indication$heard$v,
    output wire indication$heard__RDY,
    output wire pipe$enq__ENA,
    output wire [95:0]pipe$enq$v,
    input wire pipe$enq__RDY);
    wire [31:0]indication$heard__ENA$ind$data$heard$meth;
    wire [31:0]indication$heard__ENA$ind$data$heard$v;
    assign indication$heard__RDY = pipe$enq__RDY;
    assign pipe$enq$v = { indication$heard__ENA$ind$data$heard$v , indication$heard__ENA$ind$data$heard$meth , 32'd1 };
    assign pipe$enq__ENA = indication$heard__ENA;

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (indication$heard__ENA & indication$heard__RDY) begin
            indication$heard__ENA$ind$data$heard$meth <= indication$heard$meth;
            indication$heard__ENA$ind$data$heard$v <= indication$heard$v;
        end; // End of indication$heard__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
