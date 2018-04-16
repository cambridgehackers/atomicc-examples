`include "rulec.generated.vh"

module l_module_OC_Connect (
    input CLK,
    input nRST,
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
    wire lEII_test$pipe$enq__RDY;
    wire lEIO$indication$heard2__RDY;
    wire lEIO$indication$heard__RDY;
    wire [127:0]lEIO$pipe$enq$v;
    wire lEIO$pipe$enq__ENA;
    wire lERI$pipe$enq__RDY;
    wire [31:0]lERI$request$say$meth;
    wire [31:0]lERI$request$say$v;
    wire [31:0]lERI$request$say2$meth;
    wire [31:0]lERI$request$say2$v;
    wire [31:0]lERI$request$say2$v2;
    wire lERI$request$say2__ENA;
    wire lERI$request$say__ENA;
    wire [127:0]lERO_test$pipe$enq$v;
    wire lERO_test$pipe$enq__ENA;
    wire [31:0]lEcho$indication$heard$meth;
    wire [31:0]lEcho$indication$heard$v;
    wire [31:0]lEcho$indication$heard2$meth;
    wire [31:0]lEcho$indication$heard2$v;
    wire [31:0]lEcho$indication$heard2$v2;
    wire lEcho$indication$heard2__ENA;
    wire lEcho$indication$heard__ENA;
    wire lEcho$request$say2__RDY;
    wire lEcho$request$say__RDY;
    l_module_OC_EchoIndicationOutput lEIO (
        CLK,
        nRST,
        lEcho$indication$heard2__ENA,
        lEcho$indication$heard2$meth,
        lEcho$indication$heard2$v,
        lEcho$indication$heard2$v2,
        lEIO$indication$heard2__RDY,
        lEcho$indication$heard__ENA,
        lEcho$indication$heard$meth,
        lEcho$indication$heard$v,
        lEIO$indication$heard__RDY,
        lEIO$pipe$enq__ENA,
        lEIO$pipe$enq$v,
        lEII_test$pipe$enq__RDY);
    l_module_OC_EchoRequestInput lERI (
        CLK,
        nRST,
        lERO_test$pipe$enq__ENA,
        lERO_test$pipe$enq$v,
        lERI$pipe$enq__RDY,
        lERI$request$say2__ENA,
        lERI$request$say2$meth,
        lERI$request$say2$v,
        lERI$request$say2$v2,
        lEcho$request$say2__RDY,
        lERI$request$say__ENA,
        lERI$request$say$meth,
        lERI$request$say$v,
        lEcho$request$say__RDY);
    l_module_OC_Echo lEcho (
        CLK,
        nRST,
        lERI$request$say2__ENA,
        lERI$request$say2$meth,
        lERI$request$say2$v,
        lERI$request$say2$v2,
        lEcho$request$say2__RDY,
        lERI$request$say__ENA,
        lERI$request$say$meth,
        lERI$request$say$v,
        lEcho$request$say__RDY,
        lEcho$indication$heard2__ENA,
        lEcho$indication$heard2$meth,
        lEcho$indication$heard2$v,
        lEcho$indication$heard2$v2,
        lEIO$indication$heard2__RDY,
        lEcho$indication$heard__ENA,
        lEcho$indication$heard$meth,
        lEcho$indication$heard$v,
        lEIO$indication$heard__RDY);
    l_module_OC_EchoRequestOutput lERO_test (
        CLK,
        nRST,
        request$say2__ENA,
        request$say2$meth,
        request$say2$v,
        request$say2$v2,
        request$say2__RDY,
        request$say__ENA,
        request$say$meth,
        request$say$v,
        request$say__RDY,
        lERO_test$pipe$enq__ENA,
        lERO_test$pipe$enq$v,
        lERI$pipe$enq__RDY);
    l_module_OC_EchoIndicationInput lEII_test (
        CLK,
        nRST,
        lEIO$pipe$enq__ENA,
        lEIO$pipe$enq$v,
        lEII_test$pipe$enq__RDY,
        indication$heard2__ENA,
        indication$heard2$meth,
        indication$heard2$v,
        indication$heard2$v2,
        indication$heard2__RDY,
        indication$heard__ENA,
        indication$heard$meth,
        indication$heard$v,
        indication$heard__RDY);
endmodule 

module l_module_OC_Echo (
    input CLK,
    input nRST,
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
    assign delay_rule__ENA = delay_rule__RDY;
    assign delay_rule__RDY = ( ( busy != 0 ) & ( busy_delay == 0 ) ) != 0;
    assign respond_rule__ENA = respond_rule__RDY;
    assign respond_rule__RDY = ( busy_delay != 0 ) & ( ( v_type != 1 ) | indication$heard__RDY ) & ( ( v_type == 1 ) | indication$heard2__RDY );
    assign indication$heard$meth = meth_delay;
    assign indication$heard$v = v_delay;
    assign indication$heard2$meth = meth_delay;
    assign indication$heard2$v = v_delay;
    assign indication$heard2$v2 = v2_delay;
    assign indication$heard2__ENA = ( v_type != 1 ) & respond_rule__ENA;
    assign indication$heard__ENA = ( v_type == 1 ) & respond_rule__ENA;
    assign request$say2__RDY = busy == 0;
    assign request$say__RDY = busy == 0;

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
            busy <= 0;
            busy_delay <= 1;
            meth_delay <= meth_temp;
            v_delay <= v_temp;
            v2_delay <= v2_temp;
        end; // End of delay_rule__ENA
        if (request$say2__ENA) begin
            meth_temp <= request$say2$meth;
            v_temp <= request$say2$v;
            v2_temp <= request$say2$v2;
            busy <= 1;
            v_type <= 2;
        end; // End of request$say2__ENA
        if (request$say__ENA) begin
            meth_temp <= request$say$meth;
            v_temp <= request$say$v;
            busy <= 1;
            v_type <= 1;
        end; // End of request$say__ENA
        if (respond_rule__ENA) begin
            busy_delay <= 0;
        end; // End of respond_rule__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module l_module_OC_EchoIndicationInput (
    input CLK,
    input nRST,
    input pipe$enq__ENA,
    input [127:0]pipe$enq$v,
    output pipe$enq__RDY,
    output indication$heard2__ENA,
    output [31:0]indication$heard2$meth,
    output [31:0]indication$heard2$v,
    output [31:0]indication$heard2$v2,
    input indication$heard2__RDY,
    output indication$heard__ENA,
    output [31:0]indication$heard$meth,
    output [31:0]indication$heard$v,
    input indication$heard__RDY);
    reg [31:0]busy_delay;
    reg [31:0]meth_delay;
    reg [31:0]v2_delay;
    reg [31:0]v_delay;
    reg [31:0]v_type;
    wire input_rule__ENA;
    wire input_rule__RDY;
    assign input_rule__ENA = input_rule__RDY;
    assign input_rule__RDY = ( busy_delay != 0 ) & ( ( v_type != 1 ) | indication$heard__RDY ) & ( ( v_type == 1 ) | indication$heard2__RDY );
    assign indication$heard$meth = meth_delay;
    assign indication$heard$v = v_delay;
    assign indication$heard2$meth = meth_delay;
    assign indication$heard2$v = v_delay;
    assign indication$heard2$v2 = v2_delay;
    assign indication$heard2__ENA = ( v_type != 1 ) & input_rule__ENA;
    assign indication$heard__ENA = ( v_type == 1 ) & input_rule__ENA;
    assign pipe$enq__RDY = busy_delay == 0;

    always @( posedge CLK) begin
      if (!nRST) begin
        busy_delay <= 0;
        meth_delay <= 0;
        v2_delay <= 0;
        v_delay <= 0;
        v_type <= 0;
      end // nRST
      else begin
        if (input_rule__ENA) begin
            busy_delay <= 0;
        end; // End of input_rule__ENA
        if (pipe$enq__ENA) begin
            if (pipe$enq$v[0:31] == 1) begin
            meth_delay <= pipe$enq$v[32:63];
            v_delay <= pipe$enq$v[64:95];
            busy_delay <= 1;
            v_type <= 1;
            end;
            if (pipe$enq$v[0:31] == 2) begin
            meth_delay <= pipe$enq$v[32:63];
            v_delay <= pipe$enq$v[64:95];
            v2_delay <= pipe$enq$v[96:127];
            busy_delay <= 1;
            v_type <= 2;
            end;
        end; // End of pipe$enq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module l_module_OC_EchoIndicationOutput (
    input CLK,
    input nRST,
    input indication$heard2__ENA,
    input [31:0]indication$heard2$meth,
    input [31:0]indication$heard2$v,
    input [31:0]indication$heard2$v2,
    output indication$heard2__RDY,
    input indication$heard__ENA,
    input [31:0]indication$heard$meth,
    input [31:0]indication$heard$v,
    output indication$heard__RDY,
    output pipe$enq__ENA,
    output [127:0]pipe$enq$v,
    input pipe$enq__RDY);
    reg [31:0]even;
    reg [95:0]ind0$data;
    reg [31:0]ind0$tag;
    reg [95:0]ind1$data;
    reg [31:0]ind1$tag;
    reg [31:0]ind_busy;
    wire [31:0]ind0$data$heard$meth;
    wire [31:0]ind0$data$heard$v;
    wire [31:0]ind0$data$heard2$meth;
    wire [31:0]ind0$data$heard2$v;
    wire [31:0]ind0$data$heard2$v2;
    wire [31:0]ind1$data$heard$meth;
    wire [31:0]ind1$data$heard$v;
    wire output_rulee__ENA;
    wire output_rulee__RDY;
    wire output_ruleo__ENA;
    wire output_ruleo__RDY;
    assign output_rulee__ENA = output_rulee__RDY;
    assign output_rulee__RDY = ( ( ( ind_busy != 0 ) & ( even != 0 ) ) != 0 ) & pipe$enq__RDY;
    assign output_ruleo__ENA = output_ruleo__RDY;
    assign output_ruleo__RDY = ( ( ( ind_busy != 0 ) & ( even == 0 ) ) != 0 ) & pipe$enq__RDY;
    assign indication$heard2__RDY = ind_busy == 0;
    assign indication$heard__RDY = ind_busy == 0;
    assign pipe$enq$v = output_rulee__ENA ? { ind0$tag , ind0$data } : { ind1$tag , ind1$data };
    assign pipe$enq__ENA = output_rulee__ENA || output_ruleo__ENA;

    always @( posedge CLK) begin
      if (!nRST) begin
        even <= 0;
        ind0$data <= 0;
        ind0$tag <= 0;
        ind1$data <= 0;
        ind1$tag <= 0;
        ind_busy <= 0;
      end // nRST
      else begin
        if (indication$heard2__ENA) begin
            ind0$tag <= 2;
            ind0$data$heard2$meth <= indication$heard2$meth;
            ind0$data$heard2$v <= indication$heard2$v;
            ind0$data$heard2$v2 <= indication$heard2$v2;
            ind_busy <= 1;
        end; // End of indication$heard2__ENA
        if (indication$heard__ENA) begin
            ind_busy <= 1;
            even <= even == 0;
            if (even != 0) begin
            ind1$tag <= 1;
            ind1$data$heard$meth <= indication$heard$meth;
            ind1$data$heard$v <= indication$heard$v;
            end;
            if (even == 0) begin
            ind0$tag <= 1;
            ind0$data$heard$meth <= indication$heard$meth;
            ind0$data$heard$v <= indication$heard$v;
            end;
        end; // End of indication$heard__ENA
        if (output_rulee__ENA) begin
            ind_busy <= 0;
        end; // End of output_rulee__ENA
        if (output_ruleo__ENA) begin
            ind_busy <= 0;
        end; // End of output_ruleo__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module l_module_OC_EchoRequestInput (
    input CLK,
    input nRST,
    input pipe$enq__ENA,
    input [127:0]pipe$enq$v,
    output pipe$enq__RDY,
    output request$say2__ENA,
    output [31:0]request$say2$meth,
    output [31:0]request$say2$v,
    output [31:0]request$say2$v2,
    input request$say2__RDY,
    output request$say__ENA,
    output [31:0]request$say$meth,
    output [31:0]request$say$v,
    input request$say__RDY);
    assign pipe$enq__RDY = ( ( pipe$enq$v[0:31] != 1 ) | request$say__RDY ) & ( ( pipe$enq$v[0:31] != 2 ) | request$say2__RDY );
    assign request$say$meth = pipe$enq$v[32:63];
    assign request$say$v = pipe$enq$v[64:95];
    assign request$say2$meth = pipe$enq$v[32:63];
    assign request$say2$v = pipe$enq$v[64:95];
    assign request$say2$v2 = pipe$enq$v[96:127];
    assign request$say2__ENA = ( pipe$enq$v[0:31] == 2 ) & pipe$enq__ENA;
    assign request$say__ENA = ( pipe$enq$v[0:31] == 1 ) & pipe$enq__ENA;
endmodule 

module l_module_OC_EchoRequestOutput (
    input CLK,
    input nRST,
    input request$say2__ENA,
    input [31:0]request$say2$meth,
    input [31:0]request$say2$v,
    input [31:0]request$say2$v2,
    output request$say2__RDY,
    input request$say__ENA,
    input [31:0]request$say$meth,
    input [31:0]request$say$v,
    output request$say__RDY,
    output pipe$enq__ENA,
    output [127:0]pipe$enq$v,
    input pipe$enq__RDY);
    assign pipe$enq$v = request$say2__ENA ? { 2 , { request$say2$meth , request$say2$v , request$say2$v2 } } : { 1 , { request$say$meth , request$say$v , 32'd0 } };
    assign pipe$enq__ENA = request$say2__ENA || request$say__ENA;
    assign request$say2__RDY = pipe$enq__RDY;
    assign request$say__RDY = pipe$enq__RDY;
endmodule 

