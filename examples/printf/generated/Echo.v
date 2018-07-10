`include "printf.generated.vh"

module Echo (input CLK, input nRST,
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
    input indication$heard__RDY,
    output printfp$enq__ENA,
    output [127:0]printfp$enq$v,
    input printfp$enq__RDY);
    wire CLK, nRST;
    reg [15:0]a_delay;
    reg [15:0]a_temp;
    reg [15:0]b_delay;
    reg [15:0]b_temp;
    reg [31:0]busy;
    reg [31:0]busy_delay;
    reg [31:0]clockReg;
    reg [31:0]v_delay;
    reg [31:0]v_temp;
    reg [31:0]v_type;
    wire clockRule__ENA;
    wire clockRule__RDY;
    wire delay_rule__ENA;
    wire delay_rule__RDY;
    wire respond_rule__ENA;
    wire respond_rule__RDY;
    assign clockRule__ENA = clockRule__RDY ;
    assign clockRule__RDY = 1;
    assign delay_rule__ENA = delay_rule__RDY ;
    assign delay_rule__RDY = ( ( ( busy  != 32'd0 ) & ( busy_delay  == 32'd0 ) ) != 0 ) & printfp$enq__RDY ;
    assign respond_rule__ENA = respond_rule__RDY ;
    assign respond_rule__RDY = ( busy_delay  != 32'd0 ) & ( ( v_type  != 32'd1 ) | indication$heard__RDY  ) & ( ( v_type  == 32'd1 ) | indication$heard2__RDY  ) & printfp$enq__RDY ;
    assign indication$heard$v = v_delay ;
    assign indication$heard2$a = a_delay ;
    assign indication$heard2$b = b_delay ;
    assign indication$heard2__ENA = ( v_type  != 32'd1 ) & respond_rule__ENA ;
    assign indication$heard3$a = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign indication$heard3$b = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign indication$heard3$c = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign indication$heard3$d = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign indication$heard3__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign indication$heard__ENA = ( v_type  == 32'd1 ) & respond_rule__ENA ;
    assign printfp$enq$v = delay_rule__ENA  ? { 16'd1 , 16'd32767 , 16'd2 } : request$say__ENA  ? { busy_delay  , clockReg  , 16'd2 , 16'd32767 , 16'd3 } : request$say2__ENA  ? { 16'd3 , 16'd32767 , 16'd2 } : request$setLeds__ENA  ? { 16'd4 , 16'd32767 , 16'd2 } : request$zsay4__ENA  ? { 16'd5 , 16'd32767 , 16'd2 } : { 16'd6 , 16'd32767 , 16'd2 };
    assign printfp$enq__ENA = delay_rule__ENA  || request$say__ENA  || request$say2__ENA  || request$setLeds__ENA  || request$zsay4__ENA  || respond_rule__ENA ;
    assign request$say2__RDY = ( busy  == 32'd0 ) & printfp$enq__RDY ;
    assign request$say__RDY = ( busy  == 32'd0 ) & printfp$enq__RDY ;
    assign request$setLeds__RDY = printfp$enq__RDY ;
    assign request$zsay4__RDY = printfp$enq__RDY ;

    always @( posedge CLK) begin
      if (!nRST) begin
        a_delay <= 0;
        a_temp <= 0;
        b_delay <= 0;
        b_temp <= 0;
        busy <= 0;
        busy_delay <= 0;
        clockReg <= 0;
        v_delay <= 0;
        v_temp <= 0;
        v_type <= 0;
      end // nRST
      else begin
        if (clockRule__ENA) begin
            clockReg  <= clockReg + 1;
        end; // End of clockRule__ENA
        if (delay_rule__ENA) begin
            busy  <= 0;
            busy_delay  <= 1;
            v_delay  <= v_temp;
            a_delay  <= a_temp;
            b_delay  <= b_temp;
        end; // End of delay_rule__ENA
        if (request$say__ENA) begin
            v_temp  <= request$say$v;
            busy  <= 1;
            v_type  <= 1;
        end; // End of request$say__ENA
        if (request$say2__ENA) begin
            a_temp  <= request$say2$a;
            b_temp  <= request$say2$b;
            busy  <= 1;
            v_type  <= 2;
        end; // End of request$say2__ENA
        if (respond_rule__ENA) begin
            busy_delay  <= 0;
        end; // End of respond_rule__ENA
      end
    end // always @ (posedge CLK)
endmodule 

