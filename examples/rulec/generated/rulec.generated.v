`include "rulec.generated.vh"

module l_module_OC_Echo (input CLK, input nRST,
    input request$say__ENA,
    input [31:0]request$say$v,
    input request$say2__ENA,
    input [15:0]request$say2$a,
    input [15:0]request$say2$b,
    output request$say2__RDY,
    output request$say__RDY,
    input request$setLeds__ENA,
    input [7:0]request$setLeds$v,
    output request$setLeds__RDY,
    input request$zsay4__ENA,
    output request$zsay4__RDY,
    output indication$heard__ENA,
    output [31:0]indication$heard$v,
    output indication$heard2__ENA,
    output [15:0]indication$heard2$a,
    output [15:0]indication$heard2$b,
    input indication$heard2__RDY,
    output indication$heard3__ENA,
    output [15:0]indication$heard3$a,
    output [31:0]indication$heard3$b,
    output [31:0]indication$heard3$c,
    output [15:0]indication$heard3$d,
    input indication$heard3__RDY,
    input indication$heard__RDY);
    reg [15:0]a_delay;
    reg [15:0]a_temp;
    reg [15:0]b_delay;
    reg [15:0]b_temp;
    reg [31:0]busy;
    reg [31:0]busy_delay;
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
    assign indication$heard$v = v_delay ;
    assign indication$heard2$a = a_delay ;
    assign indication$heard2$b = b_delay ;
    assign indication$heard2__ENA = ( v_type  != 1 ) & respond_rule__ENA ;
    // assign indication$heard3$a = MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE;
    // assign indication$heard3$b = MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE;
    // assign indication$heard3$c = MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE;
    // assign indication$heard3$d = MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE;
    // assign indication$heard3__ENA = MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE;
    assign indication$heard__ENA = ( v_type  == 32'd1 ) & respond_rule__ENA ;
    assign request$say2__RDY = busy  == 32'd0;
    assign request$say__RDY = busy  == 32'd0;
    assign request$setLeds__RDY = 1;
    assign request$zsay4__RDY = 1;

    always @( posedge CLK) begin
      if (!nRST) begin
        a_delay <= 0;
        a_temp <= 0;
        b_delay <= 0;
        b_temp <= 0;
        busy <= 0;
        busy_delay <= 0;
        v_delay <= 0;
        v_temp <= 0;
        v_type <= 0;
      end // nRST
      else begin
        if (delay_rule__ENA) begin
            busy  <= 0;
            busy_delay  <= 1;
            v_delay  <= v_temp;
            a_delay  <= a_temp;
            b_delay  <= b_temp;
            $display( "[delay_rule:76]Echo" );
        end; // End of delay_rule__ENA
        if (request$say__ENA) begin
            v_temp  <= request$say$v;
            busy  <= 1;
            v_type  <= 1;
            $display( "[request$say:52]Echo" );
        end; // End of request$say__ENA
        if (request$say2__ENA) begin
            a_temp  <= request$say2$a;
            b_temp  <= request$say2$b;
            busy  <= 1;
            v_type  <= 2;
            $display( "[request$say2:58]Echo" );
        end; // End of request$say2__ENA
        if (request$zsay4__ENA) begin
            $display( "[request$zsay4:70]Echo" );
        end; // End of request$zsay4__ENA
        if (respond_rule__ENA) begin
            busy_delay  <= 0;
            $display( "[respond_rule:84]Echo" );
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
    wire lEIO$method$heard3__RDY;
    wire lEIO$method$heard__RDY;
    wire [31:0]lERI$method$say$v;
    wire [15:0]lERI$method$say2$a;
    wire [15:0]lERI$method$say2$b;
    wire lERI$method$say2__ENA;
    wire lERI$method$say__ENA;
    wire [7:0]lERI$method$setLeds$v;
    wire lERI$method$setLeds__ENA;
    wire lERI$method$zsay4__ENA;
    wire [31:0]lEcho$indication$heard$v;
    wire [15:0]lEcho$indication$heard2$a;
    wire [15:0]lEcho$indication$heard2$b;
    wire lEcho$indication$heard2__ENA;
    wire [15:0]lEcho$indication$heard3$a;
    wire [31:0]lEcho$indication$heard3$b;
    wire [31:0]lEcho$indication$heard3$c;
    wire [15:0]lEcho$indication$heard3$d;
    wire lEcho$indication$heard3__ENA;
    wire lEcho$indication$heard__ENA;
    wire lEcho$request$say2__RDY;
    wire lEcho$request$say__RDY;
    wire lEcho$request$setLeds__RDY;
    wire lEcho$request$zsay4__RDY;
    l_module_OC_EchoRequest___P2M lERI (.CLK(CLK), .nRST(nRST),
        .pipe$enq__ENA(request$enq__ENA),
        .pipe$enq$v(request$enq$v),
        .pipe$enq__RDY(request$enq__RDY),
        .method$say__ENA(lERI$method$say__ENA),
        .method$say$v(lERI$method$say$v),
        .method$say2__ENA(lERI$method$say2__ENA),
        .method$say2$a(lERI$method$say2$a),
        .method$say2$b(lERI$method$say2$b),
        .method$say2__RDY(lEcho$request$say2__RDY),
        .method$say__RDY(lEcho$request$say__RDY),
        .method$setLeds__ENA(lERI$method$setLeds__ENA),
        .method$setLeds$v(lERI$method$setLeds$v),
        .method$setLeds__RDY(lEcho$request$setLeds__RDY),
        .method$zsay4__ENA(lERI$method$zsay4__ENA),
        .method$zsay4__RDY(lEcho$request$zsay4__RDY));
    l_module_OC_EchoIndication___M2P lEIO (.CLK(CLK), .nRST(nRST),
        .method$heard__ENA(lEcho$indication$heard__ENA),
        .method$heard$v(lEcho$indication$heard$v),
        .method$heard2__ENA(lEcho$indication$heard2__ENA),
        .method$heard2$a(lEcho$indication$heard2$a),
        .method$heard2$b(lEcho$indication$heard2$b),
        .method$heard2__RDY(lEIO$method$heard2__RDY),
        .method$heard3__ENA(lEcho$indication$heard3__ENA),
        .method$heard3$a(lEcho$indication$heard3$a),
        .method$heard3$b(lEcho$indication$heard3$b),
        .method$heard3$c(lEcho$indication$heard3$c),
        .method$heard3$d(lEcho$indication$heard3$d),
        .method$heard3__RDY(lEIO$method$heard3__RDY),
        .method$heard__RDY(lEIO$method$heard__RDY),
        .pipe$enq__ENA(indication$enq__ENA),
        .pipe$enq$v(indication$enq$v),
        .pipe$enq__RDY(indication$enq__RDY));
    l_module_OC_Echo lEcho (.CLK(CLK), .nRST(nRST),
        .request$say__ENA(lERI$method$say__ENA),
        .request$say$v(lERI$method$say$v),
        .request$say2__ENA(lERI$method$say2__ENA),
        .request$say2$a(lERI$method$say2$a),
        .request$say2$b(lERI$method$say2$b),
        .request$say2__RDY(lEcho$request$say2__RDY),
        .request$say__RDY(lEcho$request$say__RDY),
        .request$setLeds__ENA(lERI$method$setLeds__ENA),
        .request$setLeds$v(lERI$method$setLeds$v),
        .request$setLeds__RDY(lEcho$request$setLeds__RDY),
        .request$zsay4__ENA(lERI$method$zsay4__ENA),
        .request$zsay4__RDY(lEcho$request$zsay4__RDY),
        .indication$heard__ENA(lEcho$indication$heard__ENA),
        .indication$heard$v(lEcho$indication$heard$v),
        .indication$heard2__ENA(lEcho$indication$heard2__ENA),
        .indication$heard2$a(lEcho$indication$heard2$a),
        .indication$heard2$b(lEcho$indication$heard2$b),
        .indication$heard2__RDY(lEIO$method$heard2__RDY),
        .indication$heard3__ENA(lEcho$indication$heard3__ENA),
        .indication$heard3$a(lEcho$indication$heard3$a),
        .indication$heard3$b(lEcho$indication$heard3$b),
        .indication$heard3$c(lEcho$indication$heard3$c),
        .indication$heard3$d(lEcho$indication$heard3$d),
        .indication$heard3__RDY(lEIO$method$heard3__RDY),
        .indication$heard__RDY(lEIO$method$heard__RDY));
endmodule 

module l_module_OC_EchoIndication___M2P (input CLK, input nRST,
    input method$heard__ENA,
    input [31:0]method$heard$v,
    input method$heard2__ENA,
    input [15:0]method$heard2$a,
    input [15:0]method$heard2$b,
    output method$heard2__RDY,
    input method$heard3__ENA,
    input [15:0]method$heard3$a,
    input [31:0]method$heard3$b,
    input [31:0]method$heard3$c,
    input [15:0]method$heard3$d,
    output method$heard3__RDY,
    output method$heard__RDY,
    output pipe$enq__ENA,
    output [127:0]pipe$enq$v,
    input pipe$enq__RDY);
    assign method$heard2__RDY = pipe$enq__RDY ;
    assign method$heard3__RDY = pipe$enq__RDY ;
    assign method$heard__RDY = pipe$enq__RDY ;
    assign pipe$enq$v = method$heard__ENA  ? ( { 64'd0, method$heard$v, 16'd0, 16'd2}  ) : method$heard2__ENA  ? ( { 64'd0, method$heard2$b, method$heard2$a, 16'd1, 16'd2}  ) : ( { method$heard3$d, method$heard3$c, method$heard3$b, method$heard3$a, 16'd2, 16'd4}  );
    assign pipe$enq__ENA = method$heard__ENA  || method$heard2__ENA  || method$heard3__ENA ;
endmodule 

module l_module_OC_EchoRequest___P2M (input CLK, input nRST,
    input pipe$enq__ENA,
    input [127:0]pipe$enq$v,
    output pipe$enq__RDY,
    output method$say__ENA,
    output [31:0]method$say$v,
    output method$say2__ENA,
    output [15:0]method$say2$a,
    output [15:0]method$say2$b,
    input method$say2__RDY,
    input method$say__RDY,
    output method$setLeds__ENA,
    output [7:0]method$setLeds$v,
    input method$setLeds__RDY,
    output method$zsay4__ENA,
    input method$zsay4__RDY);
    assign method$say$v = pipe$enq$v[63:32] ;
    assign method$say2$a = pipe$enq$v[47:32] ;
    assign method$say2$b = pipe$enq$v[63:48] ;
    assign method$say2__ENA = ( pipe$enq$v[31:16]  == 16'd1 ) & pipe$enq__ENA ;
    assign method$say__ENA = ( pipe$enq$v[31:16]  == 16'd0 ) & pipe$enq__ENA ;
    assign method$setLeds$v = pipe$enq$v[39:32] ;
    assign method$setLeds__ENA = ( pipe$enq$v[31:16]  == 16'd2 ) & pipe$enq__ENA ;
    assign method$zsay4__ENA = ( pipe$enq$v[31:16]  == 16'd3 ) & pipe$enq__ENA ;
    assign pipe$enq__RDY = method$say__RDY  & method$say2__RDY  & method$setLeds__RDY  & method$zsay4__RDY ;
endmodule 

