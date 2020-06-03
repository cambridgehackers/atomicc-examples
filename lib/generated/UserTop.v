`include "userTop.generated.vh"

`default_nettype none
module UserTop (input wire CLK, input wire nRST,
    input wire write$enq__ENA,
    input wire [32 - 1:0]write$enq$v,
    input wire write$enq$last,
    output wire write$enq__RDY,
    output wire read$enq__ENA,
    output wire [32 - 1:0]read$enq$v,
    output wire read$enq$last,
    input wire read$enq__RDY);
    wire [(16 + 128) - 1:0]ctop$indication$enq$v;
    wire ctop$indication$enq__ENA;
    wire [(16 + 128) - 1:0]ctop$request$enq$v;
    wire ctop$request$enq__RDY;
    wire [128 - 1:0]indication$enq$agg_2e_tmp;
    wire [16 - 1:0]indication$enq$len;
    wire [16 - 1:0]indication$enq$total_len;
    wire [128 - 1:0]indication$enq$vint;
    wire [144 - 1:0]indication$enq$vtemp;
    wire [16 - 1:0]radapter_0$in$enq$length;
    wire [128 - 1:0]radapter_0$in$enq$v;
    wire radapter_0$in$enq__RDY;
    wire [(16 + 128) - 1:0]wad$enq$agg_2e_tmp;
    wire [16 - 1:0]wadapter_0$out$enq$length;
    wire [128 - 1:0]wadapter_0$out$enq$v;
    wire wadapter_0$out$enq__ENA;
    AdapterToBus radapter_0 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(ctop$indication$enq__ENA),
        .in$enq$v(radapter_0$in$enq$v),
        .in$enq$length(radapter_0$in$enq$length),
        .in$enq__RDY(radapter_0$in$enq__RDY),
        .out$enq__ENA(read$enq__ENA),
        .out$enq$v(read$enq$v),
        .out$enq$last(read$enq$last),
        .out$enq__RDY(read$enq__RDY));
    AdapterFromBus wadapter_0 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(write$enq__ENA),
        .in$enq$v(write$enq$v),
        .in$enq$last(write$enq$last),
        .in$enq__RDY(write$enq__RDY),
        .out$enq__ENA(wadapter_0$out$enq__ENA),
        .out$enq$v(wadapter_0$out$enq$v),
        .out$enq$length(wadapter_0$out$enq$length),
        .out$enq__RDY(ctop$request$enq__RDY));
    l_top ctop (.CLK(CLK), .nRST(nRST),
        .request$enq__ENA(wadapter_0$out$enq__ENA),
        .request$enq$v(ctop$request$enq$v),
        .request$enq__RDY(ctop$request$enq__RDY),
        .indication$enq__ENA(ctop$indication$enq__ENA),
        .indication$enq$v(ctop$indication$enq$v),
        .indication$enq__RDY(radapter_0$in$enq__RDY));
    assign ctop$request$enq$v = wad$enq$agg_2e_tmp;
    assign radapter_0$in$enq$length = indication$enq$total_len;
    assign radapter_0$in$enq$v = indication$enq$agg_2e_tmp;
    // Extra assigments, not to output wires
    assign indication$enq$agg_2e_tmp = indication$enq$vint;
    assign indication$enq$len = indication$enq$vint[ 15 : 0 ] - 16'd1;
    assign indication$enq$total_len = indication$enq$vtemp[ ( 16 - 1 ) : 0 ];
    assign indication$enq$vint = indication$enq$vtemp[ ( ( 144 - 16 ) - 1 ) : 16 ];
    assign indication$enq$vtemp = ctop$indication$enq$v;
    assign wad$enq$agg_2e_tmp = { wadapter_0$out$enq$v , wadapter_0$out$enq$length };

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (ctop$indication$enq__ENA && radapter_0$in$enq__RDY) begin // indication$enq__ENA
            $display( "indConnect.enq v %llx len %lx" , indication$enq$vint , indication$enq$len );
        end; // End of indication$enq__ENA
        if (wadapter_0$out$enq__ENA && ctop$request$enq__RDY) begin // wad$enq__ENA
            $display( "reqConnect.enq v %llx length %lx" , wadapter_0$out$enq$v , wadapter_0$out$enq$length );
        end; // End of wad$enq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
