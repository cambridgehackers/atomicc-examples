`ifndef __funnel_GENERATED__VH__
`define __funnel_GENERATED__VH__

//METASTART; FunnelTest
//METAINTERNAL; fifoA; Fifo1Base(width=32);
//METAINTERNAL; fifoB; Fifo1Base(width=32);
//METAINTERNAL; fifoC; Fifo1Base(width=32);
//METAINTERNAL; fifoD; Fifo1Base(width=32);
//METAINTERNAL; iA; Out2InBase(width=32);
//METAINTERNAL; iB; Out2InBase(width=32);
//METAINTERNAL; iC; Out2InBase(width=32);
//METAINTERNAL; iD; Out2InBase(width=32);
//METAINTERNAL; funnel; FunnelBase(funnelWidth=4,dataWidth=32);
//METAINTERNAL; result; Fifo1Base(width=32);
//METAINVOKE; request$say__ENA; index == 0:fifoA$in$enq__ENA;index == 1:fifoB$in$enq__ENA;index == 2:fifoC$in$enq__ENA;index == 3:fifoD$in$enq__ENA;
//METAGUARD; request$say; !( busy || ( !( ( fifoA$in$enq__RDY && ( ( fifoB$in$enq__RDY && ( ( fifoC$in$enq__RDY && ( fifoD$in$enq__RDY || ( !( index == 3 ) ) ) ) || ( ( !fifoC$in$enq__RDY ) && ( !( ( fifoD$in$enq__RDY && ( index == 2 ) ) || ( ( !fifoD$in$enq__RDY ) && ( ( index == 3 ) || ( index == 2 ) ) ) ) ) ) ) ) || ( ( !fifoB$in$enq__RDY ) && ( !( ( fifoC$in$enq__RDY && ( ( fifoD$in$enq__RDY && ( index == 1 ) ) || ( ( !fifoD$in$enq__RDY ) && ( ( index == 3 ) || ( index == 1 ) ) ) ) ) || ( ( !fifoC$in$enq__RDY ) && ( ( fifoD$in$enq__RDY && ( ( index == 2 ) || ( index == 1 ) ) ) || ( ( !fifoD$in$enq__RDY ) && ( ( index == 3 ) || ( index == 2 ) || ( index == 1 ) ) ) ) ) ) ) ) ) ) || ( ( !fifoA$in$enq__RDY ) && ( !( ( fifoB$in$enq__RDY && ( ( fifoC$in$enq__RDY && ( ( fifoD$in$enq__RDY && ( index == 0 ) ) || ( ( !fifoD$in$enq__RDY ) && ( ( index == 3 ) || ( index == 0 ) ) ) ) ) || ( ( !fifoC$in$enq__RDY ) && ( ( fifoD$in$enq__RDY && ( ( index == 2 ) || ( index == 0 ) ) ) || ( ( !fifoD$in$enq__RDY ) && ( ( index == 3 ) || ( index == 2 ) || ( index == 0 ) ) ) ) ) ) ) || ( ( !fifoB$in$enq__RDY ) && ( ( fifoC$in$enq__RDY && ( ( fifoD$in$enq__RDY && ( ( index == 1 ) || ( index == 0 ) ) ) || ( ( !fifoD$in$enq__RDY ) && ( ( index == 3 ) || ( index == 1 ) || ( index == 0 ) ) ) ) ) || ( ( !fifoC$in$enq__RDY ) && ( ( fifoD$in$enq__RDY && ( ( index == 2 ) || ( index == 1 ) || ( index == 0 ) ) ) || ( ( !fifoD$in$enq__RDY ) && ( ( index == 3 ) || ( index == 2 ) || ( index == 1 ) || ( index == 0 ) ) ) ) ) ) ) ) ) ) ) ) );
//METAINVOKE; RULE$respond_rule__ENA; :indication$heard__ENA;:result$out$deq__ENA;:result$out$first;
//METAGUARD; RULE$respond_rule; result$out$first__RDY && indication$heard__RDY && result$out$deq__RDY;
//METARULES; RULE$respond_rule
//METACONNECT; iA$in$deq__ENA; fifoA$out$deq__ENA
//METACONNECT; iA$in$deq__RDY; fifoA$out$deq__RDY
//METACONNECT; iA$in$first; fifoA$out$first
//METACONNECT; iA$in$first__RDY; fifoA$out$first__RDY
//METACONNECT; iB$in$deq__ENA; fifoB$out$deq__ENA
//METACONNECT; iB$in$deq__RDY; fifoB$out$deq__RDY
//METACONNECT; iB$in$first; fifoB$out$first
//METACONNECT; iB$in$first__RDY; fifoB$out$first__RDY
//METACONNECT; iC$in$deq__ENA; fifoC$out$deq__ENA
//METACONNECT; iC$in$deq__RDY; fifoC$out$deq__RDY
//METACONNECT; iC$in$first; fifoC$out$first
//METACONNECT; iC$in$first__RDY; fifoC$out$first__RDY
//METACONNECT; iD$in$deq__ENA; fifoD$out$deq__ENA
//METACONNECT; iD$in$deq__RDY; fifoD$out$deq__RDY
//METACONNECT; iD$in$first; fifoD$out$first
//METACONNECT; iD$in$first__RDY; fifoD$out$first__RDY
//METACONNECT; funnel$in[ 0 ]$enq__ENA; iA$out$enq__ENA
//METACONNECT; funnel$in[ 0 ]$enq__RDY; iA$out$enq__RDY
//METACONNECT; funnel$in[ 1 ]$enq__ENA; iB$out$enq__ENA
//METACONNECT; funnel$in[ 1 ]$enq__RDY; iB$out$enq__RDY
//METACONNECT; funnel$in[ 2 ]$enq__ENA; iC$out$enq__ENA
//METACONNECT; funnel$in[ 2 ]$enq__RDY; iC$out$enq__RDY
//METACONNECT; funnel$in[ 3 ]$enq__ENA; iD$out$enq__ENA
//METACONNECT; funnel$in[ 3 ]$enq__RDY; iD$out$enq__RDY
//METACONNECT; funnel$out$enq__ENA; result$in$enq__ENA
//METACONNECT; funnel$out$enq__RDY; result$in$enq__RDY
//METASTART; l_top
//METAINTERNAL; DUT__FunnelTest; FunnelTest;
//METAINTERNAL; M2P__indication; ___M2PFunnelIndication;
//METAINTERNAL; P2M__request; ___P2MFunnelRequest;
//METACONNECT; DUT__FunnelTest$indication$heard__ENA; M2P__indication$method$heard__ENA
//METACONNECT; DUT__FunnelTest$indication$heard__RDY; M2P__indication$method$heard__RDY
//METACONNECT; indication$enq__ENA; M2P__indication$pipe$enq__ENA
//METACONNECT; indication$enq__RDY; M2P__indication$pipe$enq__RDY
//METACONNECT; DUT__FunnelTest$request$say__ENA; P2M__request$method$say__ENA
//METACONNECT; DUT__FunnelTest$request$say__RDY; P2M__request$method$say__RDY
//METACONNECT; request$enq__ENA; P2M__request$pipe$enq__ENA
//METACONNECT; request$enq__RDY; P2M__request$pipe$enq__RDY
//METASTART; ___M2PFunnelIndication
//METAINVOKE; method$heard__ENA; :pipe$enq__ENA;
//METAGUARD; method$heard; pipe$enq__RDY;
//METASTART; ___P2MFunnelRequest
//METAINVOKE; pipe$enq__ENA; pipe$enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0:method$say__ENA;
//METAGUARD; pipe$enq; method$say__RDY;
`endif
