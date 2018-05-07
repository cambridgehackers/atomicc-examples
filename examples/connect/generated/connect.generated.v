`include "connect.generated.vh"

module l_module_OC_Connect (input CLK, input nRST,
    input request$say__ENA,
    input [31:0]request$say$meth,
    input [31:0]request$say$v,
    output request$say__RDY,
    output indication$heard__ENA,
    output [31:0]indication$heard$meth,
    output [31:0]indication$heard$v,
    input indication$heard__RDY);
    wire lEII_test$pipe$enq__RDY;
    wire lEIO$indication$heard__RDY;
    wire [95:0]lEIO$pipe$enq$v;
    wire lEIO$pipe$enq__ENA;
    wire lERI$pipe$enq__RDY;
    wire [31:0]lERI$request$say$meth;
    wire [31:0]lERI$request$say$v;
    wire lERI$request$say__ENA;
    wire [95:0]lERO_test$pipe$enq$v;
    wire lERO_test$pipe$enq__ENA;
    wire [31:0]lEcho$indication$heard$meth;
    wire [31:0]lEcho$indication$heard$v;
    wire lEcho$indication$heard__ENA;
    wire lEcho$request$say__RDY;
    l_module_OC_EchoIndicationOutput lEIO (.CLK(CLK), .nRST(nRST),
        .indication$heard__ENA(lEcho$indication$heard__ENA),
        .indication$heard$meth(lEcho$indication$heard$meth),
        .indication$heard$v(lEcho$indication$heard$v),
        .indication$heard__RDY(lEIO$indication$heard__RDY),
        .pipe$enq__ENA(lEIO$pipe$enq__ENA),
        .pipe$enq$v(lEIO$pipe$enq$v),
        .pipe$enq__RDY(lEII_test$pipe$enq__RDY));
    l_module_OC_EchoRequestInput lERI (.CLK(CLK), .nRST(nRST),
        .pipe$enq__ENA(lERO_test$pipe$enq__ENA),
        .pipe$enq$v(lERO_test$pipe$enq$v),
        .pipe$enq__RDY(lERI$pipe$enq__RDY),
        .request$say__ENA(lERI$request$say__ENA),
        .request$say$meth(lERI$request$say$meth),
        .request$say$v(lERI$request$say$v),
        .request$say__RDY(lEcho$request$say__RDY));
    l_module_OC_Echo lEcho (.CLK(CLK), .nRST(nRST),
        .request$say__ENA(lERI$request$say__ENA),
        .request$say$meth(lERI$request$say$meth),
        .request$say$v(lERI$request$say$v),
        .request$say__RDY(lEcho$request$say__RDY),
        .indication$heard__ENA(lEcho$indication$heard__ENA),
        .indication$heard$meth(lEcho$indication$heard$meth),
        .indication$heard$v(lEcho$indication$heard$v),
        .indication$heard__RDY(lEIO$indication$heard__RDY));
    l_module_OC_EchoRequestOutput lERO_test (.CLK(CLK), .nRST(nRST),
        .request$say__ENA(request$say__ENA),
        .request$say$meth(request$say$meth),
        .request$say$v(request$say$v),
        .request$say__RDY(request$say__RDY),
        .pipe$enq__ENA(lERO_test$pipe$enq__ENA),
        .pipe$enq$v(lERO_test$pipe$enq$v),
        .pipe$enq__RDY(lERI$pipe$enq__RDY));
    l_module_OC_EchoIndicationInput lEII_test (.CLK(CLK), .nRST(nRST),
        .pipe$enq__ENA(lEIO$pipe$enq__ENA),
        .pipe$enq$v(lEIO$pipe$enq$v),
        .pipe$enq__RDY(lEII_test$pipe$enq__RDY),
        .indication$heard__ENA(indication$heard__ENA),
        .indication$heard$meth(indication$heard$meth),
        .indication$heard$v(indication$heard$v),
        .indication$heard__RDY(indication$heard__RDY));
endmodule 

module l_module_OC_Echo (input CLK, input nRST,
    input request$say__ENA,
    input [31:0]request$say$meth,
    input [31:0]request$say$v,
    output request$say__RDY,
    output indication$heard__ENA,
    output [31:0]indication$heard$meth,
    output [31:0]indication$heard$v,
    input indication$heard__RDY);
    assign indication$heard$meth = request$say$meth ;
    assign indication$heard$v = request$say$v ;
    assign indication$heard__ENA = request$say__ENA ;
    assign request$say__RDY = indication$heard__RDY ;
endmodule 

module l_module_OC_EchoIndicationInput (input CLK, input nRST,
    input pipe$enq__ENA,
    input [95:0]pipe$enq$v,
    output pipe$enq__RDY,
    output indication$heard__ENA,
    output [31:0]indication$heard$meth,
    output [31:0]indication$heard$v,
    input indication$heard__RDY);
    assign indication$heard$meth = pipe$enq$v[63:32] ;
    assign indication$heard$v = pipe$enq$v[95:64] ;
    assign indication$heard__ENA = ( pipe$enq$v[31:0]  == 32'd1 ) & pipe$enq__ENA ;
    assign pipe$enq__RDY = indication$heard__RDY ;
endmodule 

module l_module_OC_EchoIndicationOutput (input CLK, input nRST,
    input indication$heard__ENA,
    input [31:0]indication$heard$meth,
    input [31:0]indication$heard$v,
    output indication$heard__RDY,
    output pipe$enq__ENA,
    output [95:0]pipe$enq$v,
    input pipe$enq__RDY);
    wire [31:0]indication$heard__ENA$ind$data$heard$meth;
    wire [31:0]indication$heard__ENA$ind$data$heard$v;
    assign indication$heard__RDY = pipe$enq__RDY ;
    assign pipe$enq$v = { indication$heard__ENA$ind$data$heard$v  , indication$heard__ENA$ind$data$heard$meth  , 32'd1 };
    assign pipe$enq__ENA = indication$heard__ENA ;
endmodule 

module l_module_OC_EchoRequestInput (input CLK, input nRST,
    input pipe$enq__ENA,
    input [95:0]pipe$enq$v,
    output pipe$enq__RDY,
    output request$say__ENA,
    output [31:0]request$say$meth,
    output [31:0]request$say$v,
    input request$say__RDY);
    assign pipe$enq__RDY = request$say__RDY ;
    assign request$say$meth = pipe$enq$v[63:32] ;
    assign request$say$v = pipe$enq$v[95:64] ;
    assign request$say__ENA = ( pipe$enq$v[31:0]  == 32'd1 ) & pipe$enq__ENA ;
endmodule 

module l_module_OC_EchoRequestOutput (input CLK, input nRST,
    input request$say__ENA,
    input [31:0]request$say$meth,
    input [31:0]request$say$v,
    output request$say__RDY,
    output pipe$enq__ENA,
    output [95:0]pipe$enq$v,
    input pipe$enq__RDY);
    wire [31:0]request$say__ENA$ind$data$say$meth;
    wire [31:0]request$say__ENA$ind$data$say$v;
    assign pipe$enq$v = { request$say__ENA$ind$data$say$v  , request$say__ENA$ind$data$say$meth  , 32'd1 };
    assign pipe$enq__ENA = request$say__ENA ;
    assign request$say__RDY = pipe$enq__RDY ;
endmodule 

