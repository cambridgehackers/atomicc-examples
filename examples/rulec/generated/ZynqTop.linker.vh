
    PipeOut#(.width(32)) funnel$in [1 - 1:0]();
    PipeOut#(.width(32)) funnel$out();
    wire funnel$select__ENA;
    wire [32 - 1: 0] funnel$select$v;
    wire funnel$select__RDY;
    SelectOut#(.funnelWidth(1),.width(32)) funnel (.CLK(CLK), .nRST(nRST),
        .select__ENA(funnel$select__ENA),
        .select$v(funnel$select$v),
        .select__RDY(funnel$select__RDY),
        .in(funnel$in),
        .out(funnel$out));
    assign funnel$in[0].first = test.__traceMemory$out.first;
    assign funnel$in[0].first__RDY = test.__traceMemory$out.first__RDY;
    assign funnel$in[0].deq__RDY = test.__traceMemory$out.deq__RDY;
    assign test.__traceMemory$out.deq__ENA = funnel$in[0].deq__ENA;
    assign test.__traceMemory$clear__ENA = funnel$select__ENA;

    assign bscan$toBscan.enq$v = funnel$out.first;
    assign bscan$toBscan.enq__ENA = funnel$out.first__RDY;
    assign funnel$out.deq__ENA = enqFinished;

    assign funnel$select__ENA = resetFunnel && funnel$select__RDY;
    assign funnel$select$v = selectIndex;
