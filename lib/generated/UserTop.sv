`include "userTop.generated.vh"

`default_nettype none
module UserTop (input wire CLK, input wire nRST,
    PipeInLast.server write,
    PipeInLast.client read);
    NOCDataH _indication$enq$temp$v;
    NOCDataH _wad$enq$temp$v;
    PipeIn#(.width(144)) ctop$indication();
    PipeIn#(.width(144)) ctop$request();
    PipeIn#(.width(144)) indication();
    PipeOutLast#(.width(32)) out2$in();
    PipeInLast#(.width(32)) out2$out();
    PipeInLength#(.width(128)) radapter_0$in();
    PipeOutLast#(.width(32)) radapter_0$out();
    PipeIn#(.width(144)) wad();
    PipeInLast#(.width(32)) wadapter_0$in();
    PipeIn#(.width(144)) wadapter_0$out();
    AdapterToBus#(.width(128),.owidth(32)) radapter_0 (.CLK(CLK), .nRST(nRST),
        .clear__ENA(0),
        .clear__RDY(),
        .in(radapter_0$in),
        .out(out2$in));
    Out2InLast#(.width(32)) out2 (.CLK(CLK), .nRST(nRST),
        .in(out2$in),
        .out(read));
    AdapterFromBus#(.owidth(32),.width(144)) wadapter_0 (.CLK(CLK), .nRST(nRST),
        .in(write),
        .out(wad));
    l_top ctop (.CLK(CLK), .nRST(nRST),
        .request(ctop$request),
        .indication(indication));
    // Extra assigments, not to output wires
    assign _indication$enq$temp$v = indication.enq$v;
    assign _wad$enq$temp$v = wad.enq$v;
    assign ctop$request.enq$v = wad.enq$v;
    assign ctop$request.enq__ENA = wad.enq__ENA;
    assign indication.enq__RDY = radapter_0$in.enq__RDY;
    assign radapter_0$in.enq$size = _indication$enq$temp$v.length;
    assign radapter_0$in.enq$v = _indication$enq$temp$v.data;
    assign radapter_0$in.enq__ENA = indication.enq__ENA;
    assign wad.enq__RDY = ctop$request.enq__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (radapter_0$in.enq__RDY && indication.enq__ENA) begin // indication.enq__ENA
            $display( "indConnect$enq v %x length %x" , _indication$enq$temp$v.data , _indication$enq$temp$v.length );
        end; // End of indication.enq__ENA
        if (ctop$request.enq__RDY && wad.enq__ENA) begin // wad.enq__ENA
            $display( "reqConnect$enq v %x length %x" , _wad$enq$temp$v.data , _wad$enq$temp$v.length );
        end; // End of wad.enq__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
