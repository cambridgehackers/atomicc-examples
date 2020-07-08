`ifndef __out2int_GENERATED__VH__
`define __out2int_GENERATED__VH__

//METASTART; Oin
//METAINTERNAL; first; Fifo1Base(width=32);
//METAINTERNAL; second; Fifo1Base(width=32);
//METAINTERNAL; pipe; Out2In;
//METAINVOKE; request$say__ENA; :first$in$enq__ENA;
//METAGUARD; request$say; first$in$enq__RDY;
//METAINVOKE; RULE$copyRule__ENA; :indication$heard__ENA;:second$out$deq__ENA;:second$out$first;
//METAGUARD; RULE$copyRule; second$out$first__RDY && indication$heard__RDY && second$out$deq__RDY;
//METARULES; RULE$copyRule
//METACONNECT; pipe$in$deq__ENA; first$out$deq__ENA
//METACONNECT; pipe$in$deq__RDY; first$out$deq__RDY
//METACONNECT; pipe$in$first; first$out$first
//METACONNECT; pipe$in$first__RDY; first$out$first__RDY
//METACONNECT; pipe$out$enq__ENA; second$in$enq__ENA
//METACONNECT; pipe$out$enq__RDY; second$in$enq__RDY
//METASTART; Out2In
//METAINVOKE; RULE$copyRule__ENA; :in$deq__ENA;:in$first;:out$enq__ENA;
//METAGUARD; RULE$copyRule; in$first__RDY && out$enq__RDY && in$deq__RDY;
//METARULES; RULE$copyRule
//METASTART; l_top
//METAINTERNAL; DUT__Oin; Oin;
//METAINTERNAL; M2P__indication; ___M2POinIndication;
//METAINTERNAL; P2M__request; ___P2MOinRequest;
//METACONNECT; DUT__Oin$indication$heard__ENA; M2P__indication$method$heard__ENA
//METACONNECT; DUT__Oin$indication$heard__RDY; M2P__indication$method$heard__RDY
//METACONNECT; indication$enq__ENA; M2P__indication$pipe$enq__ENA
//METACONNECT; indication$enq__RDY; M2P__indication$pipe$enq__RDY
//METACONNECT; DUT__Oin$request$say__ENA; P2M__request$method$say__ENA
//METACONNECT; DUT__Oin$request$say__RDY; P2M__request$method$say__RDY
//METACONNECT; request$enq__ENA; P2M__request$pipe$enq__ENA
//METACONNECT; request$enq__RDY; P2M__request$pipe$enq__RDY
//METASTART; ___M2POinIndication
//METAINVOKE; method$heard__ENA; :pipe$enq__ENA;
//METAGUARD; method$heard; pipe$enq__RDY;
//METASTART; ___P2MOinRequest
//METAINVOKE; pipe$enq__ENA; pipe$enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0:method$say__ENA;
//METAGUARD; pipe$enq; method$say__RDY;
`endif
