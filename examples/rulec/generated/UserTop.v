`include "rulec.generated.vh"

`default_nettype none
module UserTop (input wire CLK, input wire nRST,
    input wire write$enq__ENA,
    input wire [31:0]write$enq$v,
    input wire write$enq$last,
    output wire write$enq__RDY,
    output wire read$enq__ENA,
    output wire [31:0]read$enq$v,
    output wire read$enq$last,
    input wire read$enq__RDY);
    wire [127:0]ctop$indication$enq$v;
    wire ctop$request$enq__RDY;
    wire [127:0]indication$enq$v;
    wire indication$enq__ENA;
    wire indication$enq__EXECUTE;
    wire indication$enq__RDY;
    wire radapter_0$in$enq__RDY;
    wire [15:0]wad$enq$length;
    wire [127:0]wad$enq$v;
    wire wad$enq__ENA;
    wire wad$enq__EXECUTE;
    wire wad$enq__RDY;
    wire [15:0]wadapter_0$out$enq$length;
    wire [127:0]wadapter_0$out$enq$v;
    assign indication$enq__EXECUTE = indication$enq__ENA & radapter_0$in$enq__RDY;
    assign wad$enq__EXECUTE = wad$enq__ENA & ctop$request$enq__RDY;
    AdapterToBus radapter_0 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(indication$enq__ENA),
        .in$enq$v(ctop$indication$enq$v),
        .in$enq$length(ctop$indication$enq$v - 1),
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
        .out$enq__ENA(wad$enq__ENA),
        .out$enq$v(wadapter_0$out$enq$v),
        .out$enq$length(wadapter_0$out$enq$length),
        .out$enq__RDY(ctop$request$enq__RDY));
    l_top ctop (.CLK(CLK), .nRST(nRST),
        .indication$enq__ENA(indication$enq__ENA),
        .indication$enq$v(ctop$indication$enq$v),
        .indication$enq__RDY(radapter_0$in$enq__RDY),
        .request$enq__ENA(wad$enq__ENA),
        .request$enq$v(wadapter_0$out$enq$v),
        .request$enq__RDY(ctop$request$enq__RDY));
    assign indication$enq$v = ctop$indication$enq$v;
    assign wad$enq$length = wadapter_0$out$enq$length;
    assign wad$enq$v = wadapter_0$out$enq$v;
    // Extra assigments, not to output wires
    assign indication$enq__RDY = radapter_0$in$enq__RDY;
    assign wad$enq__RDY = ctop$request$enq__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (indication$enq__EXECUTE) begin
            $display( "indConnect.enq v %llx len %lx" , ctop$indication$enq$v , indication$enq$v[ 15 : 0 ] - 1 );
        end; // End of indication$enq__ENA
        if (wad$enq__EXECUTE) begin
            $display( "reqConnect.enq v %llx length %lx" , wadapter_0$out$enq$v , wadapter_0$out$enq$length );
        end; // End of wad$enq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
