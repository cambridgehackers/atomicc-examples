`include "before1.generated.vh"

module Echo (input CLK, input nRST,
    input request$say__ENA,
    input [31:0]request$say$meth,
    input [31:0]request$say$v,
    input request$say2__ENA,
    input [31:0]request$say2$meth,
    input [31:0]request$say2$v,
    output request$say2__RDY,
    output request$say__RDY,
    input swap$x2y__ENA,
    output swap$x2y__RDY,
    input swap$y2x__ENA,
    output swap$y2x__RDY,
    input swap$y2xnull__ENA,
    output swap$y2xnull__RDY,
    output indication$heard__ENA,
    output [31:0]indication$heard$meth,
    output [31:0]indication$heard$v,
    input indication$heard__RDY);
    wire CLK, nRST;
    reg busy;
    reg busy_delay;
    reg [31:0]meth_delay;
    reg [31:0]meth_temp;
    reg [31:0]v_delay;
    reg [31:0]v_temp;
    reg [31:0]x;
    reg [31:0]y;
    wire delay_rule__ENA;
    wire respond_rule__ENA;
    assign delay_rule__ENA = ( busy  & ( !busy_delay  ) ) != 0;
    assign respond_rule__ENA = busy_delay  & indication$heard__RDY ;
    assign indication$heard$meth = meth_delay ;
    assign indication$heard$v = v_delay ;
    assign indication$heard__ENA = busy_delay ;
    assign request$say2__RDY = !busy ;
    assign request$say__RDY = !busy ;
    assign swap$x2y__RDY = 1;
    assign swap$y2x__RDY = 1;
    assign swap$y2xnull__RDY = 1;

    always @( posedge CLK) begin
      if (!nRST) begin
        busy <= 0;
        busy_delay <= 0;
        meth_delay <= 0;
        meth_temp <= 0;
        v_delay <= 0;
        v_temp <= 0;
        x <= 0;
        y <= 0;
      end // nRST
      else begin
        if (delay_rule__ENA) begin
            busy  <= 0;
            busy_delay  <= 1;
            meth_delay  <= meth_temp;
            v_delay  <= v_temp;
            $display( "delay_rule: Echo" );
        end; // End of delay_rule__ENA
        if (request$say__ENA) begin
            meth_temp  <= request$say$meth;
            v_temp  <= request$say$v;
            busy  <= 1;
            $display( "[%s:%d]Echo" , "request$say" , 186 );
        end; // End of request$say__ENA
        if (request$say2__ENA) begin
            meth_temp  <= request$say2$meth;
            v_temp  <= request$say2$v;
            busy  <= 1;
            $display( "[%s:%d]Echo" , "request$say2" , 192 );
        end; // End of request$say2__ENA
        if (respond_rule__ENA) begin
            busy_delay  <= 0;
            $display( "respond_rule: Echo" );
        end; // End of respond_rule__ENA
        if (swap$x2y__ENA) begin
            y  <= x;
            $display( "[%s:%d]Echo" , "swap$x2y" , 206 );
        end; // End of swap$x2y__ENA
        if (swap$y2x__ENA) begin
            x  <= y;
            $display( "[%s:%d]Echo" , "swap$y2x" , 198 );
        end; // End of swap$y2x__ENA
        if (swap$y2xnull__ENA) begin
            $display( "[%s:%d]Echo" , "swap$y2xnull" , 202 );
        end; // End of swap$y2xnull__ENA
      end
    end // always @ (posedge CLK)
endmodule 

