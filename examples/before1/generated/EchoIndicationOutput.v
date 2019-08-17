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
    wire [32 - 1:0]RULE$output_rulee$agg_2e_tmp$data$heard$meth;
    wire [32 - 1:0]RULE$output_rulee$agg_2e_tmp$data$heard$v;
    wire [32 - 1:0]RULE$output_rulee$agg_2e_tmp$tag;
    wire RULE$output_rulee__RDY;
    wire [32 - 1:0]RULE$output_ruleo$agg_2e_tmp$data$heard$meth;
    wire [32 - 1:0]RULE$output_ruleo$agg_2e_tmp$data$heard$v;
    wire [32 - 1:0]RULE$output_ruleo$agg_2e_tmp$tag;
    wire RULE$output_ruleo__RDY;
    wire [(32 + (32 + 32)) - 1:0]ind0;
    wire [(32 + (32 + 32)) - 1:0]ind1;
    assign indication$heard__RDY = !ind_busy;
    assign pipe$enq$v = ( RULE$output_rulee__RDY ? { RULE$output_rulee$agg_2e_tmp$data$heard$v , RULE$output_rulee$agg_2e_tmp$data$heard$meth , RULE$output_rulee$agg_2e_tmp$tag } : 0 ) | ( RULE$output_ruleo__RDY ? { RULE$output_ruleo$agg_2e_tmp$data$heard$v , RULE$output_ruleo$agg_2e_tmp$data$heard$meth , RULE$output_ruleo$agg_2e_tmp$tag } : 0 );
    assign pipe$enq__ENA = RULE$output_rulee__RDY || RULE$output_ruleo__RDY;
    // Extra assigments, not to output wires
    assign RULE$output_rulee$agg_2e_tmp$data$heard$meth = ind0[ 32 - 1 + 32 : 32 ];
    assign RULE$output_rulee$agg_2e_tmp$data$heard$v = ind0[ 32 - 1 + 64 : 64 ];
    assign RULE$output_rulee$agg_2e_tmp$tag = ind0[ 32 - 1 : 0 ];
    assign RULE$output_rulee__RDY = ind_busy && even && pipe$enq__RDY;
    assign RULE$output_ruleo$agg_2e_tmp$data$heard$meth = ind1[ 32 - 1 + 32 : 32 ];
    assign RULE$output_ruleo$agg_2e_tmp$data$heard$v = ind1[ 32 - 1 + 64 : 64 ];
    assign RULE$output_ruleo$agg_2e_tmp$tag = ind1[ 32 - 1 : 0 ];
    assign RULE$output_ruleo__RDY = !( even || ( !( pipe$enq__RDY && ind_busy ) ) );
    assign ind0 = { ind0$data$heard$v , ind0$data$heard$meth , ind0$tag };
    assign ind1 = { ind1$data$heard$v , ind1$data$heard$meth , ind1$tag };

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
        if (RULE$output_rulee__RDY) begin // RULE$output_rulee__ENA
            ind_busy <= 0 != 0;
        end; // End of RULE$output_rulee__ENA
        if (RULE$output_ruleo__RDY) begin // RULE$output_ruleo__ENA
            ind_busy <= 0 != 0;
        end; // End of RULE$output_ruleo__ENA
        if (indication$heard__ENA && indication$heard__RDY) begin // indication$heard__ENA
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
