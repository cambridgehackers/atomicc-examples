`ifndef __funnel_GENERATED__VH__
`define __funnel_GENERATED__VH__

//METASTART; FunnelTest
//METAINTERNAL; fifo0; FifoPBase(width=32);
//METAINTERNAL; fifo1; FifoPBase(width=32);
//METAINTERNAL; fifo2; FifoPBase(width=32);
//METAINTERNAL; fifo3; FifoPBase(width=32);
//METAINTERNAL; funnel; FunnelBufferedBase(funnelWidth=4,dataWidth=32);
//METAINTERNAL; result; Fifo1Base(width=32);
//METAINVOKE; request$say__ENA; :fifo$in$enq__ENA;
//METAGUARD; request$say; fifo$in$enq__RDY_or1;
//METAINVOKE; RULE$respond_rule__ENA; :indication$heard__ENA;:result$out$deq__ENA;:result$out$first;
//METAGUARD; RULE$respond_rule; result$out$first__RDY && indication$heard__RDY && result$out$deq__RDY;
//METAGUARD; RULE$init; 1;
//METARULES; RULE$respond_rule; RULE$init
//METACONNECT; funnel$out$enq__ENA; result$in$enq__ENA
//METACONNECT; funnel$out$enq__RDY; result$in$enq__RDY
//METASTART; l_top
//METAINTERNAL; DUT__FunnelTest; FunnelTest;
//METAINTERNAL; M2P__indication; ___M2PFunnelIndication;
//METAINTERNAL; P2M__request; ___P2MFunnelRequest;
//METACONNECT; DUT__FunnelTest$indication$heard__ENA; M2P__indication$method$heard__ENA
//METACONNECT; DUT__FunnelTest$indication$heard__RDY; M2P__indication$method$heard__RDY
//METACONNECT; DUT__FunnelTest$request$say__ENA; P2M__request$method$say__ENA
//METACONNECT; DUT__FunnelTest$request$say__RDY; P2M__request$method$say__RDY
//METACONNECT; request$enq__ENA; P2M__request$pipe$enq__ENA
//METACONNECT; request$enq__RDY; P2M__request$pipe$enq__RDY
//METACONNECT; indication$enq__ENA; M2P__indication$pipe$enq__ENA
//METACONNECT; indication$enq__RDY; M2P__indication$pipe$enq__RDY
//METASTART; ___M2PFunnelIndication
//METAINVOKE; method$heard__ENA; :pipe$enq__ENA;
//METAGUARD; method$heard; pipe$enq__RDY;
//METASTART; ___P2MFunnelRequest
//METAINVOKE; pipe$enq__ENA; pipe$enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0:method$say__ENA;
//METAGUARD; pipe$enq; method$say__RDY;
`endif
