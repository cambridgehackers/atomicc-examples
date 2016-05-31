
`include "l_class_OC_EchoRequestOutput.vh"

module l_class_OC_EchoRequestOutput (
    input CLK,
    input nRST,
    input request$say__ENA,
    input [31:0]request$say_meth,
    input [31:0]request$say_v,
    input request$say2__ENA,
    input [31:0]request$say2_meth,
    input [31:0]request$say2_v,
    input [31:0]request$say2_v2,
    output request$say2__RDY,
    output request$say__RDY,
    output pipe$enq__ENA,
    output [191:0]pipe$enq_v,
    input pipe$enq__RDY,
    input [`l_class_OC_EchoRequestOutput_RULE_COUNT:0]rule_enable,
    output [`l_class_OC_EchoRequestOutput_RULE_COUNT:0]rule_ready);
    wire request$say__RDY_internal;
    wire request$say__ENA_internal = request$say__ENA && request$say__RDY_internal;
    wire request$say2__RDY_internal;
    wire request$say2__ENA_internal = request$say2__ENA && request$say2__RDY_internal;
    assign ind$tag = 2;
    assign pipe$enq__ENA = request$say__ENA_internal || request$say2__ENA_internal;
    assign pipe$enq_v = request$say__ENA_internal ? ind : ind;
    assign request$say2__RDY = request$say2__RDY_internal;
    assign request$say2__RDY_internal = pipe$enq__RDY;
    assign request$say__RDY = request$say__RDY_internal;
    assign request$say__RDY_internal = pipe$enq__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (request$say__ENA_internal) begin
            ind$data$say$meth <= say_meth;
            ind$data$say$v <= say_v;
        end; // End of request$say__ENA
        if (request$say2__ENA_internal) begin
            ind$data$say2$meth <= say2_meth;
            ind$data$say2$v <= say2_v;
            ind$data$say2$v2 <= say2_v2;
        end; // End of request$say2__ENA
      end
    end // always @ (posedge CLK)
endmodule 

