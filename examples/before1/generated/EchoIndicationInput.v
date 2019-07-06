`include "before1.generated.vh"

`default_nettype none
module EchoIndicationInput (input wire CLK, input wire nRST,
    input wire pipe$enq__ENA,
    input wire [(32 + (32 + 32)) - 1:0]pipe$enq$v,
    output wire pipe$enq__RDY,
    output wire indication$heard__ENA,
    output wire [32 - 1:0]indication$heard$meth,
    output wire [32 - 1:0]indication$heard$v,
    input wire indication$heard__RDY);
    reg busy_delay;
    reg [32 - 1:0]meth_delay;
    reg [32 - 1:0]v_delay;
    wire [32 - 1:0]pipe$enq$v$tag;
    assign indication$heard$meth = meth_delay;
    assign indication$heard$v = v_delay;
    assign indication$heard__ENA = busy_delay;
    assign pipe$enq__RDY = !busy_delay;
    // Extra assigments, not to output wires
    assign pipe$enq$v$tag = pipe$enq$v[ ( (-1 + 32) ) : 0 ];

    always @( posedge CLK) begin
      if (!nRST) begin
        busy_delay <= 0;
        meth_delay <= 0;
        v_delay <= 0;
      end // nRST
      else begin
        if (busy_delay & indication$heard__RDY) begin // RULE$input_rule__ENA
            busy_delay <= 0 != 0;
            $display( "input_rule: EchoIndicationInput" );
        end; // End of RULE$input_rule__ENA
        if (!( busy_delay | ( !pipe$enq__ENA ) )) begin // pipe$enq__ENA
            $display( "%s: EchoIndicationInput tag %d" , "pipe$enq" , pipe$enq$v[ ( (-1 + 32) ) : 0 ] );
            if (pipe$enq$v$tag == 1) begin
            meth_delay <= pipe$enq$v[ ( (31 + 32) ) : 32 ];
            v_delay <= pipe$enq$v[ ( (63 + 32) ) : 64 ];
            busy_delay <= 1 != 0;
            end;
        end; // End of pipe$enq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
