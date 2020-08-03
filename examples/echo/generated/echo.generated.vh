`ifndef __echo_GENERATED__VH__
`define __echo_GENERATED__VH__

//METASTART; Echo
//METAINTERNAL; fifo; Fifo1Base(width=32);
//METAINVOKE; sout$say__ENA; :fifo$in$enq__ENA;
//METAGUARD; sout$say; fifo$in$enq__RDY;
//METAINVOKE; RULE$respond_rule__ENA; :fifo$out$deq__ENA;:fifo$out$first;:ind$heard__ENA;
//METAGUARD; RULE$respond_rule; fifo$out$deq__RDY && fifo$out$first__RDY && ind$heard__RDY;
//METARULES; RULE$respond_rule
//METASTART; l_top
//METAINTERNAL; DUT__Echo; Echo;
//METAINTERNAL; M2P__ind; ___M2PEchoIndication;
//METAINTERNAL; P2M__sout; ___P2MEchoRequest;
//METACONNECT; DUT__Echo$ind$heard__ENA; M2P__ind$method$heard__ENA
//METACONNECT; DUT__Echo$ind$heard__RDY; M2P__ind$method$heard__RDY
//METACONNECT; indication$enq__ENA; M2P__ind$pipe$enq__ENA
//METACONNECT; indication$enq__RDY; M2P__ind$pipe$enq__RDY
//METACONNECT; DUT__Echo$sout$say__ENA; P2M__sout$method$say__ENA
//METACONNECT; DUT__Echo$sout$say__RDY; P2M__sout$method$say__RDY
//METACONNECT; request$enq__ENA; P2M__sout$pipe$enq__ENA
//METACONNECT; request$enq__RDY; P2M__sout$pipe$enq__RDY
//METASTART; ___M2PEchoIndication
//METAINVOKE; method$heard__ENA; :pipe$enq__ENA;
//METAGUARD; method$heard; pipe$enq__RDY;
//METASTART; ___P2MEchoRequest
//METAINVOKE; pipe$enq__ENA; pipe$enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0:method$say__ENA;
//METAGUARD; pipe$enq; method$say__RDY;
`endif
