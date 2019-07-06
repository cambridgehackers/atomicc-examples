`include "userTop.generated.vh"

`default_nettype none
module UserTop (input wire CLK, input wire nRST,
    input wire write$enq__ENA,
    input wire [32 - 1:0]write$enq$v,
    input wire [16 - 1:0]write$enq$length,
    output wire write$enq__RDY,
    output wire read$enq__ENA,
    output wire [32 - 1:0]read$enq$v,
    output wire [16 - 1:0]read$enq$length,
    input wire read$enq__RDY);
    wire [16 - 1:0]ctop$indication$enq$length;
    wire [128 - 1:0]ctop$indication$enq$v;
    wire ctop$indication$enq__ENA;
    wire ctop$request$enq__RDY;
    wire [16 - 1:0]indication$enq$len;
    wire [128 - 1:0]indication$enq$v;
    wire radapter_0$in$enq__RDY;
    wire [16 - 1:0]wadapter_0$out$enq$length;
    wire [128 - 1:0]wadapter_0$out$enq$v;
    wire wadapter_0$out$enq__ENA;
    AdapterToBus radapter_0 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(ctop$indication$enq__ENA),
        .in$enq$v(ctop$indication$enq$v),
        .in$enq$length(ctop$indication$enq$length),
        .in$enq__RDY(radapter_0$in$enq__RDY),
        .out$enq__ENA(read$enq__ENA),
        .out$enq$v(read$enq$v),
        .out$enq$length(read$enq$length),
        .out$enq__RDY(read$enq__RDY));
    AdapterFromBus wadapter_0 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(write$enq__ENA),
        .in$enq$v(write$enq$v),
        .in$enq$length(write$enq$length),
        .in$enq__RDY(write$enq__RDY),
        .out$enq__ENA(wadapter_0$out$enq__ENA),
        .out$enq$v(wadapter_0$out$enq$v),
        .out$enq$length(wadapter_0$out$enq$length),
        .out$enq__RDY(ctop$request$enq__RDY));
    l_top ctop (.CLK(CLK), .nRST(nRST),
        .request$enq__ENA(wadapter_0$out$enq__ENA),
        .request$enq$v(wadapter_0$out$enq$v),
        .request$enq__RDY(ctop$request$enq__RDY),
        .indication$enq__ENA(ctop$indication$enq__ENA),
        .indication$enq$v(ctop$indication$enq$v),
        .indication$enq$length(ctop$indication$enq$length),
        .indication$enq__RDY(radapter_0$in$enq__RDY));
    assign indication$enq$v = ctop$indication$enq$v;
    // Extra assigments, not to output wires
    assign indication$enq$len = indication$enq$v[ 15 : 0 ] - 16'd1;

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (ctop$indication$enq__ENA & radapter_0$in$enq__RDY) begin // indication$enq__ENA
            $display( "indConnect.enq v %llx len %lx" , ctop$indication$enq$v , indication$enq$len );
        end; // End of indication$enq__ENA
        if (wadapter_0$out$enq__ENA & ctop$request$enq__RDY) begin // wad$enq__ENA
            $display( "reqConnect.enq v %llx length %lx" , wadapter_0$out$enq$v , wadapter_0$out$enq$length );
        end; // End of wad$enq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
