`include "before1.generated.vh"

module EchoIndicationInput (input CLK, input nRST,
    input pipe$enq__ENA,
    input [95:0]pipe$enq$v,
    output pipe$enq__RDY,
    output indication$heard__ENA,
    output [31:0]indication$heard$meth,
    output [31:0]indication$heard$v,
    input indication$heard__RDY);
    wire CLK, nRST;
    reg busy_delay;
    reg [31:0]meth_delay;
    reg [31:0]v_delay;
    wire input_rule__ENA;
    wire input_rule__RDY;
    assign input_rule__ENA = input_rule__RDY ;
    assign input_rule__RDY = busy_delay  & indication$heard__RDY ;
    assign indication$heard$meth = meth_delay ;
    assign indication$heard$v = v_delay ;
    assign indication$heard__ENA = input_rule__ENA ;
    assign pipe$enq__RDY = !busy_delay ;

    always @( posedge CLK) begin
      if (!nRST) begin
        busy_delay <= 0;
        meth_delay <= 0;
        v_delay <= 0;
      end // nRST
      else begin
        if (input_rule__ENA) begin
            busy_delay  <= 0;
            $display( "input_rule: EchoIndicationInput" );
        end; // End of input_rule__ENA
        if (pipe$enq__ENA) begin
            $display( "%s: EchoIndicationInput tag %d" , "pipe$enq" , pipe$enq$v[31:0] );
            if (pipe$enq$v[31:0] == 32'd1) begin
            meth_delay  <= pipe$enq$v[63:32];
            v_delay  <= pipe$enq$v[95:64];
            busy_delay  <= 1;
            end;
        end; // End of pipe$enq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

