FunnelBase#(.funnelWidth(4), .dataWidth(144)) printFunnel (.CLK(CLK), .nRST(nRST),
    .in$enq__ENA('{DUT__Echo.printfp.enq__ENA, M2P__indication.printfp.enq__ENA, P2M__request.printfp.enq__ENA, ind$enq__ENA}),
    .in$enq$v({DUT__Echo.printfp.enq$v, M2P__indication.printfp.enq$v, P2M__request.printfp.enq$v, ind$enq$v}),
    .in$enq__RDY('{DUT__Echo.printfp.enq__RDY, M2P__indication.printfp.enq__RDY, P2M__request.printfp.enq__RDY, ind$enq__RDY}),
    .out$enq__ENA(indication$enq__ENA),.out$enq$v(indication$enq$v),.out$enq__RDY(indication$enq__RDY)
     );
