`include "printf.generated.vh"

`default_nettype none
module l_top (input wire CLK, input wire nRST,
    output wire indication$enq__ENA,
    output wire [127:0]indication$enq$v,
    input wire indication$enq__RDY,
    input wire request$enq__ENA,
    input wire [127:0]request$enq$v,
    output wire request$enq__RDY);
    wire [31:0]DUT__Echo$indication$heard$v;
    wire [15:0]DUT__Echo$indication$heard2$a;
    wire [15:0]DUT__Echo$indication$heard2$b;
    wire DUT__Echo$indication$heard2__ENA;
    wire DUT__Echo$indication$heard2__RDY;
    wire [15:0]DUT__Echo$indication$heard3$a;
    wire [31:0]DUT__Echo$indication$heard3$b;
    wire [31:0]DUT__Echo$indication$heard3$c;
    wire [15:0]DUT__Echo$indication$heard3$d;
    wire DUT__Echo$indication$heard3__ENA;
    wire DUT__Echo$indication$heard3__RDY;
    wire DUT__Echo$indication$heard__ENA;
    wire DUT__Echo$indication$heard__RDY;
    wire [127:0]DUT__Echo$printfp$enq$v;
    wire DUT__Echo$printfp$enq__ENA;
    wire DUT__Echo$printfp$enq__RDY;
    wire [31:0]DUT__Echo$request$say$v;
    wire [15:0]DUT__Echo$request$say2$a;
    wire [15:0]DUT__Echo$request$say2$b;
    wire DUT__Echo$request$say2__ENA;
    wire DUT__Echo$request$say2__RDY;
    wire DUT__Echo$request$say__ENA;
    wire DUT__Echo$request$say__RDY;
    wire [7:0]DUT__Echo$request$setLeds$v;
    wire DUT__Echo$request$setLeds__ENA;
    wire DUT__Echo$request$setLeds__RDY;
    wire DUT__Echo$request$zsay4__ENA;
    wire DUT__Echo$request$zsay4__RDY;
    wire [31:0]M2P__indication$method$heard$v;
    wire [15:0]M2P__indication$method$heard2$a;
    wire [15:0]M2P__indication$method$heard2$b;
    wire M2P__indication$method$heard2__ENA;
    wire M2P__indication$method$heard2__RDY;
    wire [15:0]M2P__indication$method$heard3$a;
    wire [31:0]M2P__indication$method$heard3$b;
    wire [31:0]M2P__indication$method$heard3$c;
    wire [15:0]M2P__indication$method$heard3$d;
    wire M2P__indication$method$heard3__ENA;
    wire M2P__indication$method$heard3__RDY;
    wire M2P__indication$method$heard__ENA;
    wire M2P__indication$method$heard__RDY;
    wire [127:0]M2P__indication$pipe$enq$v;
    wire M2P__indication$pipe$enq__ENA;
    wire M2P__indication$pipe$enq__RDY;
    wire [31:0]P2M__request$method$say$v;
    wire [15:0]P2M__request$method$say2$a;
    wire [15:0]P2M__request$method$say2$b;
    wire P2M__request$method$say2__ENA;
    wire P2M__request$method$say2__RDY;
    wire P2M__request$method$say__ENA;
    wire P2M__request$method$say__RDY;
    wire [7:0]P2M__request$method$setLeds$v;
    wire P2M__request$method$setLeds__ENA;
    wire P2M__request$method$setLeds__RDY;
    wire P2M__request$method$zsay4__ENA;
    wire P2M__request$method$zsay4__RDY;
    wire [127:0]P2M__request$pipe$enq$v;
    wire P2M__request$pipe$enq__ENA;
    wire [127:0]mux$forward$enq$v;
    wire mux$forward$enq__ENA;
    wire mux$forward$enq__RDY;
    wire [127:0]mux$in$enq$v;
    wire mux$in$enq__ENA;
    wire mux$in$enq__RDY;
    wire mux$out$enq__RDY;
    Echo DUT__Echo (.CLK(CLK), .nRST(nRST),
        .request$say__ENA(P2M__request$method$say__ENA),
        .request$say$v(P2M__request$method$say$v),
        .request$say2__ENA(P2M__request$method$say2__ENA),
        .request$say2$a(P2M__request$method$say2$a),
        .request$say2$b(P2M__request$method$say2$b),
        .request$say2__RDY(DUT__Echo$request$say2__RDY),
        .request$say__RDY(DUT__Echo$request$say__RDY),
        .request$setLeds__ENA(P2M__request$method$setLeds__ENA),
        .request$setLeds$v(P2M__request$method$setLeds$v),
        .request$setLeds__RDY(DUT__Echo$request$setLeds__RDY),
        .request$zsay4__ENA(P2M__request$method$zsay4__ENA),
        .request$zsay4__RDY(DUT__Echo$request$zsay4__RDY),
        .indication$heard__ENA(DUT__Echo$indication$heard__ENA),
        .indication$heard$v(DUT__Echo$indication$heard$v),
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
        .indication$heard__RDY(M2P__indication$method$heard__RDY),
        .printfp$enq__ENA(DUT__Echo$printfp$enq__ENA),
        .printfp$enq$v(DUT__Echo$printfp$enq$v),
        .printfp$enq__RDY(mux$forward$enq__RDY));
    MuxPipe mux (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(M2P__indication$pipe$enq__ENA),
        .in$enq$v(M2P__indication$pipe$enq$v),
        .in$enq__RDY(mux$in$enq__RDY),
        .forward$enq__ENA(DUT__Echo$printfp$enq__ENA),
        .forward$enq$v(DUT__Echo$printfp$enq$v),
        .forward$enq__RDY(mux$forward$enq__RDY),
        .out$enq__ENA(indication$enq__ENA),
        .out$enq$v(indication$enq$v),
        .out$enq__RDY(indication$enq__RDY));
    EchoIndication___M2P M2P__indication (.CLK(CLK), .nRST(nRST),
        .method$heard__ENA(DUT__Echo$indication$heard__ENA),
        .method$heard$v(DUT__Echo$indication$heard$v),
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
        .method$heard__RDY(M2P__indication$method$heard__RDY),
        .pipe$enq__ENA(M2P__indication$pipe$enq__ENA),
        .pipe$enq$v(M2P__indication$pipe$enq$v),
        .pipe$enq__RDY(mux$in$enq__RDY));
    EchoRequest___P2M P2M__request (.CLK(CLK), .nRST(nRST),
        .method$say__ENA(P2M__request$method$say__ENA),
        .method$say$v(P2M__request$method$say$v),
        .method$say2__ENA(P2M__request$method$say2__ENA),
        .method$say2$a(P2M__request$method$say2$a),
        .method$say2$b(P2M__request$method$say2$b),
        .method$say2__RDY(DUT__Echo$request$say2__RDY),
        .method$say__RDY(DUT__Echo$request$say__RDY),
        .method$setLeds__ENA(P2M__request$method$setLeds__ENA),
        .method$setLeds$v(P2M__request$method$setLeds$v),
        .method$setLeds__RDY(DUT__Echo$request$setLeds__RDY),
        .method$zsay4__ENA(P2M__request$method$zsay4__ENA),
        .method$zsay4__RDY(DUT__Echo$request$zsay4__RDY),
        .pipe$enq__ENA(request$enq__ENA),
        .pipe$enq$v(request$enq$v),
        .pipe$enq__RDY(request$enq__RDY));
    assign DUT__Echo$indication$heard2__RDY = M2P__indication$method$heard2__RDY;
    assign DUT__Echo$indication$heard3__RDY = M2P__indication$method$heard3__RDY;
    assign DUT__Echo$indication$heard__RDY = M2P__indication$method$heard__RDY;
    assign DUT__Echo$printfp$enq__RDY = mux$forward$enq__RDY;
    assign DUT__Echo$request$say$v = P2M__request$method$say$v;
    assign DUT__Echo$request$say2$a = P2M__request$method$say2$a;
    assign DUT__Echo$request$say2$b = P2M__request$method$say2$b;
    assign DUT__Echo$request$say2__ENA = P2M__request$method$say2__ENA;
    assign DUT__Echo$request$say__ENA = P2M__request$method$say__ENA;
    assign DUT__Echo$request$setLeds$v = P2M__request$method$setLeds$v;
    assign DUT__Echo$request$setLeds__ENA = P2M__request$method$setLeds__ENA;
    assign DUT__Echo$request$zsay4__ENA = P2M__request$method$zsay4__ENA;
    assign M2P__indication$method$heard$v = DUT__Echo$indication$heard$v;
    assign M2P__indication$method$heard2$a = DUT__Echo$indication$heard2$a;
    assign M2P__indication$method$heard2$b = DUT__Echo$indication$heard2$b;
    assign M2P__indication$method$heard2__ENA = DUT__Echo$indication$heard2__ENA;
    assign M2P__indication$method$heard3$a = DUT__Echo$indication$heard3$a;
    assign M2P__indication$method$heard3$b = DUT__Echo$indication$heard3$b;
    assign M2P__indication$method$heard3$c = DUT__Echo$indication$heard3$c;
    assign M2P__indication$method$heard3$d = DUT__Echo$indication$heard3$d;
    assign M2P__indication$method$heard3__ENA = DUT__Echo$indication$heard3__ENA;
    assign M2P__indication$method$heard__ENA = DUT__Echo$indication$heard__ENA;
    assign M2P__indication$pipe$enq__RDY = mux$in$enq__RDY;
    assign P2M__request$method$say2__RDY = DUT__Echo$request$say2__RDY;
    assign P2M__request$method$say__RDY = DUT__Echo$request$say__RDY;
    assign P2M__request$method$setLeds__RDY = DUT__Echo$request$setLeds__RDY;
    assign P2M__request$method$zsay4__RDY = DUT__Echo$request$zsay4__RDY;
    assign P2M__request$pipe$enq$v = request$enq$v;
    assign P2M__request$pipe$enq__ENA = request$enq__ENA;
    assign mux$forward$enq$v = DUT__Echo$printfp$enq$v;
    assign mux$forward$enq__ENA = DUT__Echo$printfp$enq__ENA;
    assign mux$in$enq$v = M2P__indication$pipe$enq$v;
    assign mux$in$enq__ENA = M2P__indication$pipe$enq__ENA;
    assign mux$out$enq__RDY = indication$enq__RDY;
endmodule 

`default_nettype wire    // set back to default value
