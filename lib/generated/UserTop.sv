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
    wire ctop$request$enq__RDY;
    wire radapter_0$in$enq__RDY;
    wire [(16 + 128) - 1:0]wadapter_0$out$enq$v;
    wire wadapter_0$out$enq__ENA;
    AdapterToBus#(.width(32)) radapter_0 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(ctop$indication$enq__ENA),
        .in$enq$v(ctop$indication$enq$v),
        .in$enq__RDY(radapter_0$in$enq__RDY),
        .out$enq__ENA(read$enq__ENA),
        .out$enq$v(read$enq$v),
        .out$enq$last(read$enq$last),
        .out$enq__RDY(read$enq__RDY));
    AdapterFromBus#(.width(32)) wadapter_0 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(write$enq__ENA),
        .in$enq$v(write$enq$v),
        .in$enq$last(write$enq$last),
        .in$enq__RDY(write$enq__RDY),
        .out$enq__ENA(wadapter_0$out$enq__ENA),
        .out$enq$v(wadapter_0$out$enq$v),
        .out$enq__RDY(ctop$request$enq__RDY));
    l_top ctop (.CLK(CLK), .nRST(nRST),
        .request$enq__ENA(wadapter_0$out$enq__ENA),
        .request$enq$v(wadapter_0$out$enq$v),
        .request$enq__RDY(ctop$request$enq__RDY),
        .indication$enq__ENA(ctop$indication$enq__ENA),
        .indication$enq$v(ctop$indication$enq$v),
        .indication$enq__RDY(radapter_0$in$enq__RDY));
endmodule 

`default_nettype wire    // set back to default value
