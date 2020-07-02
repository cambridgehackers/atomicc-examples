`ifndef __funnel_GENERATED__VH__
`define __funnel_GENERATED__VH__

//METASTART; Funnel
//METAINTERNAL; fifoA; Fifo1Base(width=32);
//METAINTERNAL; fifoB; Fifo1Base(width=32);
//METAINTERNAL; fifoC; Fifo1Base(width=32);
//METAINTERNAL; fifoD; Fifo1Base(width=32);
//METAINVOKE; request$say__ENA; index == 0:fifoA$in$enq__ENA;index == 1:fifoB$in$enq__ENA;index == 2:fifoC$in$enq__ENA;index == 3:fifoD$in$enq__ENA;
//METAGUARD; request$say; !( busy || ( !( ( fifoA$in$enq__RDY && ( ( fifoB$in$enq__RDY && ( ( fifoC$in$enq__RDY && ( fifoD$in$enq__RDY || ( !( index == 3 ) ) ) ) || ( ( !fifoC$in$enq__RDY ) && ( !( ( fifoD$in$enq__RDY && ( index == 2 ) ) || ( ( !fifoD$in$enq__RDY ) && ( ( index == 3 ) || ( index == 2 ) ) ) ) ) ) ) ) || ( ( !fifoB$in$enq__RDY ) && ( !( ( fifoC$in$enq__RDY && ( ( fifoD$in$enq__RDY && ( index == 1 ) ) || ( ( !fifoD$in$enq__RDY ) && ( ( index == 3 ) || ( index == 1 ) ) ) ) ) || ( ( !fifoC$in$enq__RDY ) && ( ( fifoD$in$enq__RDY && ( ( index == 2 ) || ( index == 1 ) ) ) || ( ( !fifoD$in$enq__RDY ) && ( ( index == 3 ) || ( index == 2 ) || ( index == 1 ) ) ) ) ) ) ) ) ) ) || ( ( !fifoA$in$enq__RDY ) && ( !( ( fifoB$in$enq__RDY && ( ( fifoC$in$enq__RDY && ( ( fifoD$in$enq__RDY && ( index == 0 ) ) || ( ( !fifoD$in$enq__RDY ) && ( ( index == 3 ) || ( index == 0 ) ) ) ) ) || ( ( !fifoC$in$enq__RDY ) && ( ( fifoD$in$enq__RDY && ( ( index == 2 ) || ( index == 0 ) ) ) || ( ( !fifoD$in$enq__RDY ) && ( ( index == 3 ) || ( index == 2 ) || ( index == 0 ) ) ) ) ) ) ) || ( ( !fifoB$in$enq__RDY ) && ( ( fifoC$in$enq__RDY && ( ( fifoD$in$enq__RDY && ( ( index == 1 ) || ( index == 0 ) ) ) || ( ( !fifoD$in$enq__RDY ) && ( ( index == 3 ) || ( index == 1 ) || ( index == 0 ) ) ) ) ) || ( ( !fifoC$in$enq__RDY ) && ( ( fifoD$in$enq__RDY && ( ( index == 2 ) || ( index == 1 ) || ( index == 0 ) ) ) || ( ( !fifoD$in$enq__RDY ) && ( ( index == 3 ) || ( index == 2 ) || ( index == 1 ) || ( index == 0 ) ) ) ) ) ) ) ) ) ) ) ) );
//METAINVOKE; RULE$respondA_rule__ENA; :fifoA$out$deq__ENA;:fifoA$out$first;:indication$heard__ENA;
//METAEXCLUSIVE; RULE$respondA_rule__ENA; RULE$respondB_rule__ENA; RULE$respondC_rule__ENA; RULE$respondD_rule__ENA
//METAGUARD; RULE$respondA_rule; fifoA$out$first__RDY && indication$heard__RDY && fifoA$out$deq__RDY;
//METAINVOKE; RULE$respondB_rule__ENA; :fifoB$out$deq__ENA;:fifoB$out$first;:indication$heard__ENA;
//METAEXCLUSIVE; RULE$respondB_rule__ENA; RULE$respondC_rule__ENA; RULE$respondD_rule__ENA
//METAGUARD; RULE$respondB_rule; fifoB$out$first__RDY && indication$heard__RDY && fifoB$out$deq__RDY;
//METAINVOKE; RULE$respondC_rule__ENA; :fifoC$out$deq__ENA;:fifoC$out$first;:indication$heard__ENA;
//METAEXCLUSIVE; RULE$respondC_rule__ENA; RULE$respondD_rule__ENA
//METAGUARD; RULE$respondC_rule; fifoC$out$first__RDY && indication$heard__RDY && fifoC$out$deq__RDY;
//METAINVOKE; RULE$respondD_rule__ENA; :fifoD$out$deq__ENA;:fifoD$out$first;:indication$heard__ENA;
//METAGUARD; RULE$respondD_rule; fifoD$out$first__RDY && indication$heard__RDY && fifoD$out$deq__RDY;
//METARULES; RULE$respondA_rule; RULE$respondB_rule; RULE$respondC_rule; RULE$respondD_rule
//METASTART; l_top
//METAINTERNAL; DUT__Funnel; Funnel;
//METAINTERNAL; M2P__indication; ___M2PFunnelIndication;
//METAINTERNAL; P2M__request; ___P2MFunnelRequest;
//METACONNECT; DUT__Funnel$indication$heard__ENA; M2P__indication$method$heard__ENA
//METACONNECT; DUT__Funnel$indication$heard__RDY; M2P__indication$method$heard__RDY
//METACONNECT; indication$enq__ENA; M2P__indication$pipe$enq__ENA
//METACONNECT; indication$enq__RDY; M2P__indication$pipe$enq__RDY
//METACONNECT; DUT__Funnel$request$say__ENA; P2M__request$method$say__ENA
//METACONNECT; DUT__Funnel$request$say__RDY; P2M__request$method$say__RDY
//METACONNECT; request$enq__ENA; P2M__request$pipe$enq__ENA
//METACONNECT; request$enq__RDY; P2M__request$pipe$enq__RDY
//METASTART; ___M2PFunnelIndication
//METAINVOKE; method$heard__ENA; :pipe$enq__ENA;
//METAGUARD; method$heard; pipe$enq__RDY;
//METASTART; ___P2MFunnelRequest
//METAINVOKE; pipe$enq__ENA; pipe$enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0:method$say__ENA;
//METAGUARD; pipe$enq; method$say__RDY;
`endif
