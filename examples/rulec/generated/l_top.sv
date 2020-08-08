`include "rulec.generated.vh"
`include "common.vh"

`default_nettype none
module l_top (input wire CLK, input wire nRST,
    input wire request$enq__ENA,
    input wire [(16 + 128) - 1:0]request$enq$v,
    output wire request$enq__RDY,
    output wire indication$enq__ENA,
    output wire [(16 + 128) - 1:0]indication$enq$v,
    input wire indication$enq__RDY);
    wire [(16 + 128) - 1:0]M2P__indication$pipe$enq$v;
    wire M2P__indication$pipe$enq__ENA;
    wire [(16 + 128) - 1:0]funnel$in$enq$v [1 - 1:0];
    wire funnel$in$enq__ENA [1 - 1:0];
    wire funnel$in$enq__RDY [1 - 1:0];
    EchoRequest request();
    EchoIndication indication();
    Echo DUT__Echo (.CLK(CLK), .nRST(nRST),
        .request(request), .indication(indication));
    ___M2PEchoIndication M2P__indication (.CLK(CLK), .nRST(nRST),
        .method(indication),
        .pipe$enq__ENA(M2P__indication$pipe$enq__ENA),
        .pipe$enq$v(M2P__indication$pipe$enq$v),
        .pipe$enq__RDY(funnel$in$enq__RDY[ 0 ]));
    ___P2MEchoRequest P2M__request (.CLK(CLK), .nRST(nRST),
        .method(request),
        .pipe$enq__ENA(request$enq__ENA),
        .pipe$enq$v(request$enq$v),
        .pipe$enq__RDY(request$enq__RDY));
    FunnelBufferedBase#(.funnelWidth(1),.dataWidth((16 + 128))) funnel (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(funnel$in$enq__ENA),
        .in$enq$v(funnel$in$enq$v),
        .in$enq__RDY(funnel$in$enq__RDY),
        .out$enq__ENA(indication$enq__ENA),
        .out$enq$v(indication$enq$v),
        .out$enq__RDY(indication$enq__RDY));
    // Extra assigments, not to output wires
    assign funnel$in$enq$v[ 0 ] = M2P__indication$pipe$enq$v;
    assign funnel$in$enq__ENA[ 0 ] = M2P__indication$pipe$enq__ENA;
endmodule

`default_nettype wire    // set back to default value
