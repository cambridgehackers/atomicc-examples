
    PipeOut#(.width(32)) funnel$in [2 - 1:0]();
    PipeOut#(.width(32)) funnel$out();
    SelectOut#(.funnelWidth(2),.width(32)) funnel (.CLK(CLK), .nRST(nRST),
        .select__ENA(0),
        .select$v(8'd0),
        .select__RDY(),
        .in(funnel$in),
        .out(funnel$out));
    assign funnel$in[0].first = test.__traceMemory$out.first;
    assign funnel$in[0].first__RDY = test.__traceMemory$out.first__RDY;
    assign funnel$in[0].deq__RDY = test.__traceMemory$out.deq__RDY;
    assign test.__traceMemory$out.deq__ENA = funnel$in[0].deq__ENA;

    assign funnel$in[1].first = test.user.ctop.DUT__Test.counter.__traceMemory$out.first;
    assign funnel$in[1].first__RDY = test.user.ctop.DUT__Test.counter.__traceMemory$out.first__RDY;
    assign funnel$in[1].deq__RDY = test.user.ctop.DUT__Test.counter.__traceMemory$out.deq__RDY;
    assign test.user.ctop.DUT__Test.counter.__traceMemory$out.deq__ENA = funnel$in[1].deq__ENA;

    assign bscan$toBscan.enq$v = funnel$out.first;
    assign bscan$toBscan.enq__ENA = funnel$out.first__RDY;
    assign funnel$out.deq__ENA = readUser.enq__ENA;
