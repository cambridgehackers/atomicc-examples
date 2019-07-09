`include "before1.generated.vh"

`default_nettype none
module EchoIndicationOutput (input wire CLK, input wire nRST,
    input wire indication$heard__ENA,
    input wire [32 - 1:0]indication$heard$meth,
    input wire [32 - 1:0]indication$heard$v,
    output wire indication$heard__RDY,
    output wire pipe$enq__ENA,
    output wire [(32 + (32 + 32)) - 1:0]pipe$enq$v,
    input wire pipe$enq__RDY);
    reg even;
    reg [32 - 1:0]ind0$data$heard$meth;
    reg [32 - 1:0]ind0$data$heard$v;
    reg [32 - 1:0]ind0$tag;
    reg [32 - 1:0]ind1$data$heard$meth;
    reg [32 - 1:0]ind1$data$heard$v;
    reg [32 - 1:0]ind1$tag;
    reg ind_busy;
    wire RULE$output_ruleo__ENA;
    wire RULE$output_ruleo__RDY;
    assign indication$heard__RDY = !ind_busy;
    assign pipe$enq$v = ( ( ind_busy & even & pipe$enq__RDY ) ? { ind0$data$heard$v , ind0$data$heard$meth , ind0$tag } : 0 ) | ( ( !( even | ( !( pipe$enq__RDY & ind_busy ) ) ) ) ? { ind1$data$heard$v , ind1$data$heard$meth , ind1$tag } : 0 );
    assign pipe$enq__ENA = ind_busy;
    // Extra assigments, not to output wires
    assign RULE$output_ruleo__ENA = !( even | ( !( pipe$enq__RDY & ind_busy ) ) );
    assign RULE$output_ruleo__RDY = !( even | ( !( pipe$enq__RDY & ind_busy ) ) );

    always @( posedge CLK) begin
      if (!nRST) begin
        even <= 0;
        ind0$data$heard$meth <= 0;
        ind0$data$heard$v <= 0;
        ind0$tag <= 0;
        ind1$data$heard$meth <= 0;
        ind1$data$heard$v <= 0;
        ind1$tag <= 0;
        ind_busy <= 0;
      end // nRST
      else begin
        if (ind_busy & even & pipe$enq__RDY) begin // RULE$output_rulee__ENA
            ind_busy <= 0 != 0;
        end; // End of RULE$output_rulee__ENA
        if (RULE$output_ruleo__ENA & RULE$output_ruleo__RDY) begin // RULE$output_ruleo__ENA
            ind_busy <= 0 != 0;
        end; // End of RULE$output_ruleo__ENA
        if (!( ind_busy | ( !indication$heard__ENA ) )) begin // indication$heard__ENA
            ind_busy <= 1 != 0;
            even <= even ^ 1;
            $display( "[%s:%d]EchoIndicationOutput even %d" , "indication$heard" , 116 , even );
            if (!even) begin
            ind0$tag <= 1;
            ind0$data$heard$meth <= indication$heard$meth;
            ind0$data$heard$v <= indication$heard$v;
            end;
            if (even) begin
            ind1$tag <= 1;
            ind1$data$heard$meth <= indication$heard$meth;
            ind1$data$heard$v <= indication$heard$v;
            end;
        end; // End of indication$heard__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
