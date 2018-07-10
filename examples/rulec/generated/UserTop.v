`include "rulec.generated.vh"

module UserTop (input CLK, input nRST,
    input write$enq__ENA,
    input [31:0]write$enq$v,
    input write$enq$last,
    output write$enq__RDY,
    output read$enq__ENA,
    output [31:0]read$enq$v,
    output read$enq$last,
    input read$enq__RDY);
    wire CLK, nRST;
    wire [127:0]ctop$indication$enq$v;
    wire ctop$indication$enq__ENA;
    wire ctop$request$enq__RDY;
    wire ic$indication$enq__RDY;
    wire [15:0]ic$rad$enq$length;
    wire [127:0]ic$rad$enq$v;
    wire ic$rad$enq__ENA;
    wire radapter_0$in$enq__RDY;
    wire [127:0]rc$request$enq$v;
    wire rc$request$enq__ENA;
    wire rc$wad$enq__RDY;
    wire [15:0]wadapter_0$out$enq$length;
    wire [127:0]wadapter_0$out$enq$v;
    wire wadapter_0$out$enq__ENA;
    AdapterToBus radapter_0 (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(ic$rad$enq__ENA),
        .in$enq$v(ic$rad$enq$v),
        .in$enq$length(ic$rad$enq$length),
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
        .out$enq__RDY(rc$wad$enq__RDY));
    indConnect ic (.CLK(CLK), .nRST(nRST),
        .indication$enq__ENA(ctop$indication$enq__ENA),
        .indication$enq$v(ctop$indication$enq$v),
        .indication$enq__RDY(ic$indication$enq__RDY),
        .rad$enq__ENA(ic$rad$enq__ENA),
        .rad$enq$v(ic$rad$enq$v),
        .rad$enq$length(ic$rad$enq$length),
        .rad$enq__RDY(radapter_0$in$enq__RDY));
    reqConnect rc (.CLK(CLK), .nRST(nRST),
        .wad$enq__ENA(wadapter_0$out$enq__ENA),
        .wad$enq$v(wadapter_0$out$enq$v),
        .wad$enq$length(wadapter_0$out$enq$length),
        .wad$enq__RDY(rc$wad$enq__RDY),
        .request$enq__ENA(rc$request$enq__ENA),
        .request$enq$v(rc$request$enq$v),
        .request$enq__RDY(ctop$request$enq__RDY));
    l_top ctop (.CLK(CLK), .nRST(nRST),
        .indication$enq__ENA(ctop$indication$enq__ENA),
        .indication$enq$v(ctop$indication$enq$v),
        .indication$enq__RDY(ic$indication$enq__RDY),
        .request$enq__ENA(rc$request$enq__ENA),
        .request$enq$v(rc$request$enq$v),
        .request$enq__RDY(ctop$request$enq__RDY));
endmodule 

