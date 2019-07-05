`include "rulec.generated.vh"

`default_nettype none
module l_top (input wire CLK, input wire nRST,
    output wire indication$enq__ENA,
    output wire [128 - 1:0]indication$enq$v,
    output wire [16 - 1:0]indication$enq$length,
    input wire indication$enq__RDY,
    input wire request$enq__ENA,
    input wire [128 - 1:0]request$enq$v,
    output wire request$enq__RDY);
    wire [32 - 1:0]DUT__Echo$indication$heard$v;
    wire [16 - 1:0]DUT__Echo$indication$heard2$a;
    wire [16 - 1:0]DUT__Echo$indication$heard2$b;
    wire DUT__Echo$indication$heard2__ENA;
    wire [16 - 1:0]DUT__Echo$indication$heard3$a;
    wire [32 - 1:0]DUT__Echo$indication$heard3$b;
    wire [32 - 1:0]DUT__Echo$indication$heard3$c;
    wire [16 - 1:0]DUT__Echo$indication$heard3$d;
    wire DUT__Echo$indication$heard3__ENA;
    wire DUT__Echo$indication$heard__ENA;
    wire DUT__Echo$request$say2__RDY;
    wire DUT__Echo$request$say__RDY;
    wire DUT__Echo$request$setLeds__RDY;
    wire M2P__indication$method$heard2__RDY;
    wire M2P__indication$method$heard3__RDY;
    wire M2P__indication$method$heard__RDY;
    wire [32 - 1:0]P2M__request$method$say$v;
    wire [16 - 1:0]P2M__request$method$say2$a;
    wire [16 - 1:0]P2M__request$method$say2$b;
    wire P2M__request$method$say2__ENA;
    wire P2M__request$method$say__ENA;
    wire [8 - 1:0]P2M__request$method$setLeds$v;
    wire P2M__request$method$setLeds__ENA;
    Echo DUT__Echo (.CLK(CLK), .nRST(nRST),
        .request$say2__ENA(P2M__request$method$say2__ENA),
        .request$say2$a(P2M__request$method$say2$a),
        .request$say2$b(P2M__request$method$say2$b),
        .request$say2__RDY(DUT__Echo$request$say2__RDY),
        .request$say__ENA(P2M__request$method$say__ENA),
        .request$say$v(P2M__request$method$say$v),
        .request$say__RDY(DUT__Echo$request$say__RDY),
        .request$setLeds__ENA(P2M__request$method$setLeds__ENA),
        .request$setLeds$v(P2M__request$method$setLeds$v),
        .request$setLeds__RDY(DUT__Echo$request$setLeds__RDY),
        .indication$heard2__ENA(DUT__Echo$indication$heard2__ENA),
        .indication$heard2$a(DUT__Echo$indication$heard2$a),
        .indication$heard2$b(DUT__Echo$indication$heard2$b),
        .indication$heard2__RDY(M2P__indication$method$heard2__RDY),
        .indication$heard3__ENA(DUT__Echo$indication$heard3__ENA),
        .indication$heard3$a(DUT__Echo$indication$heard3$a),
        .indication$heard3$b(DUT__Echo$indication$heard3$b),
        .indication$heard3$c(DUT__Echo$indication$heard3$c),
        .indication$heard3$d(DUT__Echo$indication$heard3$d),
        .indication$heard3__RDY(M2P__indication$method$heard3__RDY),
        .indication$heard__ENA(DUT__Echo$indication$heard__ENA),
        .indication$heard$v(DUT__Echo$indication$heard$v),
        .indication$heard__RDY(M2P__indication$method$heard__RDY));
    ___M2PEchoIndication M2P__indication (.CLK(CLK), .nRST(nRST),
        .method$heard2__ENA(DUT__Echo$indication$heard2__ENA),
        .method$heard2$a(DUT__Echo$indication$heard2$a),
        .method$heard2$b(DUT__Echo$indication$heard2$b),
        .method$heard2__RDY(M2P__indication$method$heard2__RDY),
        .method$heard3__ENA(DUT__Echo$indication$heard3__ENA),
        .method$heard3$a(DUT__Echo$indication$heard3$a),
        .method$heard3$b(DUT__Echo$indication$heard3$b),
        .method$heard3$c(DUT__Echo$indication$heard3$c),
        .method$heard3$d(DUT__Echo$indication$heard3$d),
        .method$heard3__RDY(M2P__indication$method$heard3__RDY),
        .method$heard__ENA(DUT__Echo$indication$heard__ENA),
        .method$heard$v(DUT__Echo$indication$heard$v),
        .method$heard__RDY(M2P__indication$method$heard__RDY),
        .pipe$enq__ENA(indication$enq__ENA),
        .pipe$enq$v(indication$enq$v),
        .pipe$enq$length(indication$enq$length),
        .pipe$enq__RDY(indication$enq__RDY));
    ___P2MEchoRequest P2M__request (.CLK(CLK), .nRST(nRST),
        .method$say2__ENA(P2M__request$method$say2__ENA),
        .method$say2$a(P2M__request$method$say2$a),
        .method$say2$b(P2M__request$method$say2$b),
        .method$say2__RDY(DUT__Echo$request$say2__RDY),
        .method$say__ENA(P2M__request$method$say__ENA),
        .method$say$v(P2M__request$method$say$v),
        .method$say__RDY(DUT__Echo$request$say__RDY),
        .method$setLeds__ENA(P2M__request$method$setLeds__ENA),
        .method$setLeds$v(P2M__request$method$setLeds$v),
        .method$setLeds__RDY(DUT__Echo$request$setLeds__RDY),
        .pipe$enq__ENA(request$enq__ENA),
        .pipe$enq$v(request$enq$v),
        .pipe$enq__RDY(request$enq__RDY));
endmodule 

`default_nettype wire    // set back to default value
