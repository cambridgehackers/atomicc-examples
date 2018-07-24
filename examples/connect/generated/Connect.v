`include "connect.generated.vh"

`default_nettype none
module Connect (input wire CLK, input wire nRST,
    input wire request$say__ENA,
    input wire [31:0]request$say$meth,
    input wire [31:0]request$say$v,
    output wire request$say__RDY,
    output wire indication$heard__ENA,
    output wire [31:0]indication$heard$meth,
    output wire [31:0]indication$heard$v,
    input wire indication$heard__RDY);
    wire lEII_test$indication$heard__RDY;
    wire [95:0]lEII_test$pipe$enq$v;
    wire lEII_test$pipe$enq__ENA;
    wire lEII_test$pipe$enq__RDY;
    wire [31:0]lEIO$indication$heard$meth;
    wire [31:0]lEIO$indication$heard$v;
    wire lEIO$indication$heard__ENA;
    wire lEIO$indication$heard__RDY;
    wire [95:0]lEIO$pipe$enq$v;
    wire lEIO$pipe$enq__ENA;
    wire lEIO$pipe$enq__RDY;
    wire [95:0]lERI$pipe$enq$v;
    wire lERI$pipe$enq__ENA;
    wire lERI$pipe$enq__RDY;
    wire [31:0]lERI$request$say$meth;
    wire [31:0]lERI$request$say$v;
    wire lERI$request$say__ENA;
    wire lERI$request$say__RDY;
    wire [95:0]lERO_test$pipe$enq$v;
    wire lERO_test$pipe$enq__ENA;
    wire lERO_test$pipe$enq__RDY;
    wire [31:0]lERO_test$request$say$meth;
    wire [31:0]lERO_test$request$say$v;
    wire lERO_test$request$say__ENA;
    wire [31:0]lEcho$indication$heard$meth;
    wire [31:0]lEcho$indication$heard$v;
    wire lEcho$indication$heard__ENA;
    wire lEcho$indication$heard__RDY;
    wire [31:0]lEcho$request$say$meth;
    wire [31:0]lEcho$request$say$v;
    wire lEcho$request$say__ENA;
    wire lEcho$request$say__RDY;
    EchoIndicationOutput lEIO (.CLK(CLK), .nRST(nRST),
        .indication$heard__ENA(lEIO$indication$heard__ENA),
        .indication$heard$meth(lEcho$indication$heard$meth),
        .indication$heard$v(lEcho$indication$heard$v),
        .indication$heard__RDY(lEIO$indication$heard__RDY),
        .pipe$enq__ENA(lEII_test$pipe$enq__ENA),
        .pipe$enq$v(lEIO$pipe$enq$v),
        .pipe$enq__RDY(lEII_test$pipe$enq__RDY));
    EchoRequestInput lERI (.CLK(CLK), .nRST(nRST),
        .pipe$enq__ENA(lERI$pipe$enq__ENA),
        .pipe$enq$v(lERO_test$pipe$enq$v),
        .pipe$enq__RDY(lERI$pipe$enq__RDY),
        .request$say__ENA(lEcho$request$say__ENA),
        .request$say$meth(lERI$request$say$meth),
        .request$say$v(lERI$request$say$v),
        .request$say__RDY(lEcho$request$say__RDY));
    Echo lEcho (.CLK(CLK), .nRST(nRST),
        .request$say__ENA(lEcho$request$say__ENA),
        .request$say$meth(lERI$request$say$meth),
        .request$say$v(lERI$request$say$v),
        .request$say__RDY(lEcho$request$say__RDY),
        .indication$heard__ENA(lEIO$indication$heard__ENA),
        .indication$heard$meth(lEcho$indication$heard$meth),
        .indication$heard$v(lEcho$indication$heard$v),
        .indication$heard__RDY(lEIO$indication$heard__RDY));
    EchoRequestOutput lERO_test (.CLK(CLK), .nRST(nRST),
        .request$say__ENA(request$say__ENA & request$say__RDY),
        .request$say$meth(request$say$meth),
        .request$say$v(request$say$v),
        .request$say__RDY(request$say__RDY),
        .pipe$enq__ENA(lERI$pipe$enq__ENA),
        .pipe$enq$v(lERO_test$pipe$enq$v),
        .pipe$enq__RDY(lERI$pipe$enq__RDY));
    EchoIndicationInput lEII_test (.CLK(CLK), .nRST(nRST),
        .pipe$enq__ENA(lEII_test$pipe$enq__ENA),
        .pipe$enq$v(lEIO$pipe$enq$v),
        .pipe$enq__RDY(lEII_test$pipe$enq__RDY),
        .indication$heard__ENA(indication$heard__ENA),
        .indication$heard$meth(indication$heard$meth),
        .indication$heard$v(indication$heard$v),
        .indication$heard__RDY(indication$heard__RDY));
    assign lEII_test$indication$heard__RDY = indication$heard__RDY;
    assign lEII_test$pipe$enq$v = lEIO$pipe$enq$v;
    assign lEIO$indication$heard$meth = lEcho$indication$heard$meth;
    assign lEIO$indication$heard$v = lEcho$indication$heard$v;
    assign lEIO$pipe$enq__ENA = lEII_test$pipe$enq__ENA;
    assign lEIO$pipe$enq__RDY = lEII_test$pipe$enq__RDY;
    assign lERI$pipe$enq$v = lERO_test$pipe$enq$v;
    assign lERI$request$say__ENA = lEcho$request$say__ENA;
    assign lERI$request$say__RDY = lEcho$request$say__RDY;
    assign lERO_test$pipe$enq__ENA = lERI$pipe$enq__ENA;
    assign lERO_test$pipe$enq__RDY = lERI$pipe$enq__RDY;
    assign lERO_test$request$say$meth = request$say$meth;
    assign lERO_test$request$say$v = request$say$v;
    assign lERO_test$request$say__ENA = request$say__ENA & request$say__RDY;
    assign lEcho$indication$heard__ENA = lEIO$indication$heard__ENA;
    assign lEcho$indication$heard__RDY = lEIO$indication$heard__RDY;
    assign lEcho$request$say$meth = lERI$request$say$meth;
    assign lEcho$request$say$v = lERI$request$say$v;
endmodule 

`default_nettype wire    // set back to default value
