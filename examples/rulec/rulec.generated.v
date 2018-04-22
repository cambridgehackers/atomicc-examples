`include "rulec.generated.vh"

module l_module_OC_Connect (input CLK, input nRST,
    input request$say2__ENA,
    input [31:0]request$say2$meth,
    input [31:0]request$say2$v,
    input [31:0]request$say2$v2,
    output request$say2__RDY,
    input request$say__ENA,
    input [31:0]request$say$meth,
    input [31:0]request$say$v,
    output request$say__RDY,
    output indication$heard2__ENA,
    output [31:0]indication$heard2$meth,
    output [31:0]indication$heard2$v,
    output [31:0]indication$heard2$v2,
    input indication$heard2__RDY,
    output indication$heard__ENA,
    output [31:0]indication$heard$meth,
    output [31:0]indication$heard$v,
    input indication$heard__RDY);
// software: request
// software: indication
    wire [127:0]hw$indication$enq$v;
    wire hw$indication$enq__ENA;
    wire hw$request$enq__RDY;
    wire sw$indPipe$enq__RDY;
    wire [127:0]sw$reqPipe$enq$v;
    wire sw$reqPipe$enq__ENA;
    l_module_OC_Software sw (.CLK(CLK), .nRST(nRST),
        .request$say2__ENA(request$say2__ENA),
        .request$say2$meth(request$say2$meth),
        .request$say2$v(request$say2$v),
        .request$say2$v2(request$say2$v2),
        .request$say2__RDY(request$say2__RDY),
        .request$say__ENA(request$say__ENA),
        .request$say$meth(request$say$meth),
        .request$say$v(request$say$v),
        .request$say__RDY(request$say__RDY),
        .indication$heard2__ENA(indication$heard2__ENA),
        .indication$heard2$meth(indication$heard2$meth),
        .indication$heard2$v(indication$heard2$v),
        .indication$heard2$v2(indication$heard2$v2),
        .indication$heard2__RDY(indication$heard2__RDY),
        .indication$heard__ENA(indication$heard__ENA),
        .indication$heard$meth(indication$heard$meth),
        .indication$heard$v(indication$heard$v),
        .indication$heard__RDY(indication$heard__RDY),
        .reqPipe$enq__ENA(sw$reqPipe$enq__ENA),
        .reqPipe$enq$v(sw$reqPipe$enq$v),
        .reqPipe$enq__RDY(hw$request$enq__RDY),
        .indPipe$enq__ENA(hw$indication$enq__ENA),
        .indPipe$enq$v(hw$indication$enq$v),
        .indPipe$enq__RDY(sw$indPipe$enq__RDY));
    l_module_OC_Hardware hw (.CLK(CLK), .nRST(nRST),
        .request$enq__ENA(sw$reqPipe$enq__ENA),
        .request$enq$v(sw$reqPipe$enq$v),
        .request$enq__RDY(hw$request$enq__RDY),
        .indication$enq__ENA(hw$indication$enq__ENA),
        .indication$enq$v(hw$indication$enq$v),
        .indication$enq__RDY(sw$indPipe$enq__RDY));
endmodule 

module l_module_OC_Echo (input CLK, input nRST,
    input request$say2__ENA,
    input [31:0]request$say2$meth,
    input [31:0]request$say2$v,
    input [31:0]request$say2$v2,
    output request$say2__RDY,
    input request$say__ENA,
    input [31:0]request$say$meth,
    input [31:0]request$say$v,
    output request$say__RDY,
    output indication$heard2__ENA,
    output [31:0]indication$heard2$meth,
    output [31:0]indication$heard2$v,
    output [31:0]indication$heard2$v2,
    input indication$heard2__RDY,
    output indication$heard__ENA,
    output [31:0]indication$heard$meth,
    output [31:0]indication$heard$v,
    input indication$heard__RDY);
    reg [31:0]busy;
    reg [31:0]busy_delay;
    reg [31:0]meth_delay;
    reg [31:0]meth_temp;
    reg [31:0]v2_delay;
    reg [31:0]v2_temp;
    reg [31:0]v_delay;
    reg [31:0]v_temp;
    reg [31:0]v_type;
    wire delay_rule__ENA;
    wire delay_rule__RDY;
    wire respond_rule__ENA;
    wire respond_rule__RDY;
    assign delay_rule__ENA = delay_rule__RDY ;
    assign delay_rule__RDY = ( ( busy  != 0 ) & ( busy_delay  == 32'd0 ) ) != 0;
    assign respond_rule__ENA = respond_rule__RDY ;
    assign respond_rule__RDY = ( busy_delay  != 0 ) & ( ( v_type  != 1 ) | indication$heard__RDY  ) & ( ( v_type  == 32'd1 ) | indication$heard2__RDY  );
    assign indication$heard$meth = meth_delay ;
    assign indication$heard$v = v_delay ;
    assign indication$heard2$meth = meth_delay ;
    assign indication$heard2$v = v_delay ;
    assign indication$heard2$v2 = v2_delay ;
    assign indication$heard2__ENA = ( v_type  != 1 ) & respond_rule__ENA ;
    assign indication$heard__ENA = ( v_type  == 32'd1 ) & respond_rule__ENA ;
    assign request$say2__RDY = busy  == 32'd0;
    assign request$say__RDY = busy  == 32'd0;

    always @( posedge CLK) begin
      if (!nRST) begin
        busy <= 0;
        busy_delay <= 0;
        meth_delay <= 0;
        meth_temp <= 0;
        v2_delay <= 0;
        v2_temp <= 0;
        v_delay <= 0;
        v_temp <= 0;
        v_type <= 0;
      end // nRST
      else begin
        if (delay_rule__ENA) begin
            busy  <= 0;
            busy_delay  <= 1;
            meth_delay  <= meth_temp;
            v_delay  <= v_temp;
            v2_delay  <= v2_temp;
        end; // End of delay_rule__ENA
        if (request$say2__ENA) begin
            meth_temp  <= request$say2$meth;
            v_temp  <= request$say2$v;
            v2_temp  <= request$say2$v2;
            busy  <= 1;
            v_type  <= 2;
        end; // End of request$say2__ENA
        if (request$say__ENA) begin
            meth_temp  <= request$say$meth;
            v_temp  <= request$say$v;
            busy  <= 1;
            v_type  <= 1;
        end; // End of request$say__ENA
        if (respond_rule__ENA) begin
            busy_delay  <= 0;
        end; // End of respond_rule__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module l_module_OC_Hardware (input CLK, input nRST,
    input request$enq__ENA,
    input [127:0]request$enq$v,
    output request$enq__RDY,
    output indication$enq__ENA,
    output [127:0]indication$enq$v,
    input indication$enq__RDY);
    wire lEIO$method$heard2__RDY;
    wire lEIO$method$heard__RDY;
    wire [31:0]lERI$method$say$meth;
    wire [31:0]lERI$method$say$v;
    wire [31:0]lERI$method$say2$meth;
    wire [31:0]lERI$method$say2$v;
    wire [31:0]lERI$method$say2$v2;
    wire lERI$method$say2__ENA;
    wire lERI$method$say__ENA;
    wire [31:0]lEcho$indication$heard$meth;
    wire [31:0]lEcho$indication$heard$v;
    wire [31:0]lEcho$indication$heard2$meth;
    wire [31:0]lEcho$indication$heard2$v;
    wire [31:0]lEcho$indication$heard2$v2;
    wire lEcho$indication$heard2__ENA;
    wire lEcho$indication$heard__ENA;
    wire lEcho$request$say2__RDY;
    wire lEcho$request$say__RDY;
    l_module_OC_EchoRequest___P2M lERI (.CLK(CLK), .nRST(nRST),
        .pipe$enq__ENA(request$enq__ENA),
        .pipe$enq$v(request$enq$v),
        .pipe$enq__RDY(request$enq__RDY),
        .method$say2__ENA(lERI$method$say2__ENA),
        .method$say2$meth(lERI$method$say2$meth),
        .method$say2$v(lERI$method$say2$v),
        .method$say2$v2(lERI$method$say2$v2),
        .method$say2__RDY(lEcho$request$say2__RDY),
        .method$say__ENA(lERI$method$say__ENA),
        .method$say$meth(lERI$method$say$meth),
        .method$say$v(lERI$method$say$v),
        .method$say__RDY(lEcho$request$say__RDY));
    l_module_OC_EchoIndication___M2P lEIO (.CLK(CLK), .nRST(nRST),
        .method$heard2__ENA(lEcho$indication$heard2__ENA),
        .method$heard2$meth(lEcho$indication$heard2$meth),
        .method$heard2$v(lEcho$indication$heard2$v),
        .method$heard2$v2(lEcho$indication$heard2$v2),
        .method$heard2__RDY(lEIO$method$heard2__RDY),
        .method$heard__ENA(lEcho$indication$heard__ENA),
        .method$heard$meth(lEcho$indication$heard$meth),
        .method$heard$v(lEcho$indication$heard$v),
        .method$heard__RDY(lEIO$method$heard__RDY),
        .pipe$enq__ENA(indication$enq__ENA),
        .pipe$enq$v(indication$enq$v),
        .pipe$enq__RDY(indication$enq__RDY));
    l_module_OC_Echo lEcho (.CLK(CLK), .nRST(nRST),
        .request$say2__ENA(lERI$method$say2__ENA),
        .request$say2$meth(lERI$method$say2$meth),
        .request$say2$v(lERI$method$say2$v),
        .request$say2$v2(lERI$method$say2$v2),
        .request$say2__RDY(lEcho$request$say2__RDY),
        .request$say__ENA(lERI$method$say__ENA),
        .request$say$meth(lERI$method$say$meth),
        .request$say$v(lERI$method$say$v),
        .request$say__RDY(lEcho$request$say__RDY),
        .indication$heard2__ENA(lEcho$indication$heard2__ENA),
        .indication$heard2$meth(lEcho$indication$heard2$meth),
        .indication$heard2$v(lEcho$indication$heard2$v),
        .indication$heard2$v2(lEcho$indication$heard2$v2),
        .indication$heard2__RDY(lEIO$method$heard2__RDY),
        .indication$heard__ENA(lEcho$indication$heard__ENA),
        .indication$heard$meth(lEcho$indication$heard$meth),
        .indication$heard$v(lEcho$indication$heard$v),
        .indication$heard__RDY(lEIO$method$heard__RDY));
endmodule 

module l_module_OC_Software (input CLK, input nRST,
    input request$say2__ENA,
    input [31:0]request$say2$meth,
    input [31:0]request$say2$v,
    input [31:0]request$say2$v2,
    output request$say2__RDY,
    input request$say__ENA,
    input [31:0]request$say$meth,
    input [31:0]request$say$v,
    output request$say__RDY,
    output indication$heard2__ENA,
    output [31:0]indication$heard2$meth,
    output [31:0]indication$heard2$v,
    output [31:0]indication$heard2$v2,
    input indication$heard2__RDY,
    output indication$heard__ENA,
    output [31:0]indication$heard$meth,
    output [31:0]indication$heard$v,
    input indication$heard__RDY,
    output reqPipe$enq__ENA,
    output [127:0]reqPipe$enq$v,
    input reqPipe$enq__RDY,
    input indPipe$enq__ENA,
    input [127:0]indPipe$enq$v,
    output indPipe$enq__RDY);
    l_module_OC_EchoRequest___M2P lERO_test (.CLK(CLK), .nRST(nRST),
        .method$say2__ENA(request$say2__ENA),
        .method$say2$meth(request$say2$meth),
        .method$say2$v(request$say2$v),
        .method$say2$v2(request$say2$v2),
        .method$say2__RDY(request$say2__RDY),
        .method$say__ENA(request$say__ENA),
        .method$say$meth(request$say$meth),
        .method$say$v(request$say$v),
        .method$say__RDY(request$say__RDY),
        .pipe$enq__ENA(reqPipe$enq__ENA),
        .pipe$enq$v(reqPipe$enq$v),
        .pipe$enq__RDY(reqPipe$enq__RDY));
    l_module_OC_EchoIndication___P2M lEII_test (.CLK(CLK), .nRST(nRST),
        .pipe$enq__ENA(indPipe$enq__ENA),
        .pipe$enq$v(indPipe$enq$v),
        .pipe$enq__RDY(indPipe$enq__RDY),
        .method$heard2__ENA(indication$heard2__ENA),
        .method$heard2$meth(indication$heard2$meth),
        .method$heard2$v(indication$heard2$v),
        .method$heard2$v2(indication$heard2$v2),
        .method$heard2__RDY(indication$heard2__RDY),
        .method$heard__ENA(indication$heard__ENA),
        .method$heard$meth(indication$heard$meth),
        .method$heard$v(indication$heard$v),
        .method$heard__RDY(indication$heard__RDY));
endmodule 

module l_module_OC_EchoRequest___M2P (input CLK, input nRST,
    input method$say2__ENA,
    input [31:0]method$say2$meth,
    input [31:0]method$say2$v,
    input [31:0]method$say2$v2,
    output method$say2__RDY,
    input method$say__ENA,
    input [31:0]method$say$meth,
    input [31:0]method$say$v,
    output method$say__RDY,
    output pipe$enq__ENA,
    output [127:0]pipe$enq$v,
    input pipe$enq__RDY);
    assign method$say2__RDY = pipe$enq__RDY ;
    assign method$say__RDY = pipe$enq__RDY ;
    assign pipe$enq$v = method$say2__ENA  ? ( { method$say2$v2, method$say2$v, method$say2$meth, 32'd1}  ) : ( { 32'd0, method$say$v, method$say$meth, 32'd2}  );
    assign pipe$enq__ENA = method$say2__ENA  || method$say__ENA ;
endmodule 

module l_module_OC_EchoIndication___M2P (input CLK, input nRST,
    input method$heard2__ENA,
    input [31:0]method$heard2$meth,
    input [31:0]method$heard2$v,
    input [31:0]method$heard2$v2,
    output method$heard2__RDY,
    input method$heard__ENA,
    input [31:0]method$heard$meth,
    input [31:0]method$heard$v,
    output method$heard__RDY,
    output pipe$enq__ENA,
    output [127:0]pipe$enq$v,
    input pipe$enq__RDY);
    assign method$heard2__RDY = pipe$enq__RDY ;
    assign method$heard__RDY = pipe$enq__RDY ;
    assign pipe$enq$v = method$heard2__ENA  ? ( { method$heard2$v2, method$heard2$v, method$heard2$meth, 32'd1}  ) : ( { 32'd0, method$heard$v, method$heard$meth, 32'd2}  );
    assign pipe$enq__ENA = method$heard2__ENA  || method$heard__ENA ;
endmodule 

module l_module_OC_EchoIndication___P2M (input CLK, input nRST,
    input pipe$enq__ENA,
    input [127:0]pipe$enq$v,
    output pipe$enq__RDY,
    output method$heard2__ENA,
    output [31:0]method$heard2$meth,
    output [31:0]method$heard2$v,
    output [31:0]method$heard2$v2,
    input method$heard2__RDY,
    output method$heard__ENA,
    output [31:0]method$heard$meth,
    output [31:0]method$heard$v,
    input method$heard__RDY);
    assign method$heard$meth = pipe$enq$v[63:32] ;
    assign method$heard$v = pipe$enq$v[95:64] ;
    assign method$heard2$meth = pipe$enq$v[63:32] ;
    assign method$heard2$v = pipe$enq$v[95:64] ;
    assign method$heard2$v2 = pipe$enq$v[127:96] ;
    assign method$heard2__ENA = ( pipe$enq$v[31:0]  == 32'd1 ) & pipe$enq__ENA ;
    assign method$heard__ENA = ( pipe$enq$v[31:0]  == 32'd2 ) & pipe$enq__ENA ;
    assign pipe$enq__RDY = method$heard2__RDY  & method$heard__RDY ;
endmodule 

module l_module_OC_EchoRequest___P2M (input CLK, input nRST,
    input pipe$enq__ENA,
    input [127:0]pipe$enq$v,
    output pipe$enq__RDY,
    output method$say2__ENA,
    output [31:0]method$say2$meth,
    output [31:0]method$say2$v,
    output [31:0]method$say2$v2,
    input method$say2__RDY,
    output method$say__ENA,
    output [31:0]method$say$meth,
    output [31:0]method$say$v,
    input method$say__RDY);
    assign method$say$meth = pipe$enq$v[63:32] ;
    assign method$say$v = pipe$enq$v[95:64] ;
    assign method$say2$meth = pipe$enq$v[63:32] ;
    assign method$say2$v = pipe$enq$v[95:64] ;
    assign method$say2$v2 = pipe$enq$v[127:96] ;
    assign method$say2__ENA = ( pipe$enq$v[31:0]  == 32'd1 ) & pipe$enq__ENA ;
    assign method$say__ENA = ( pipe$enq$v[31:0]  == 32'd2 ) & pipe$enq__ENA ;
    assign pipe$enq__RDY = method$say2__RDY  & method$say__RDY ;
endmodule 

