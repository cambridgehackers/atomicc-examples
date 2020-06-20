`ifndef __bscant_GENERATED__VH__
`define __bscant_GENERATED__VH__

//METASTART; Btest
//METAINTERNAL; bscan; Bscan(id=3,width=32);
//METAINVOKE; readUser$enq__ENA; :indication$heard__ENA;
//METAEXCLUSIVE; readUser$enq__ENA; request$say__ENA
//METAGUARD; readUser$enq; indication$heard__RDY;
//METAINVOKE; request$say__ENA; :indication$ack__ENA;
//METAEXCLUSIVE; request$say__ENA; RULE$copyRule__ENA
//METAGUARD; request$say; indication$ack__RDY;
//METAINVOKE; RULE$copyRule__ENA; :bscan$toBscan$enq__ENA;
//METAGUARD; RULE$copyRule; bscan$toBscan$enq__RDY;
//METARULES; RULE$copyRule
//METACONNECT; readUser$enq__ENA; bscan$fromBscan$enq__ENA
//METACONNECT; readUser$enq__RDY; bscan$fromBscan$enq__RDY
//METASTART; l_top
//METAINTERNAL; DUT__Btest; Btest;
//METAINTERNAL; M2P__indication; ___M2PBtestIndication;
//METAINTERNAL; P2M__request; ___P2MBtestRequest;
//METACONNECT; DUT__Btest$indication$ack__ENA; M2P__indication$method$ack__ENA
//METACONNECT; DUT__Btest$indication$ack__RDY; M2P__indication$method$ack__RDY
//METACONNECT; DUT__Btest$indication$heard__ENA; M2P__indication$method$heard__ENA
//METACONNECT; DUT__Btest$indication$heard__RDY; M2P__indication$method$heard__RDY
//METACONNECT; indication$enq__ENA; M2P__indication$pipe$enq__ENA
//METACONNECT; indication$enq__RDY; M2P__indication$pipe$enq__RDY
//METACONNECT; DUT__Btest$request$say__ENA; P2M__request$method$say__ENA
//METACONNECT; DUT__Btest$request$say__RDY; P2M__request$method$say__RDY
//METACONNECT; request$enq__ENA; P2M__request$pipe$enq__ENA
//METACONNECT; request$enq__RDY; P2M__request$pipe$enq__RDY
//METASTART; ___M2PBtestIndication
//METAINVOKE; method$ack__ENA; :pipe$enq__ENA;
//METAEXCLUSIVE; method$ack__ENA; method$heard__ENA
//METAGUARD; method$ack; pipe$enq__RDY;
//METAINVOKE; method$heard__ENA; :pipe$enq__ENA;
//METAGUARD; method$heard; pipe$enq__RDY;
//METASTART; ___P2MBtestRequest
//METAINVOKE; pipe$enq__ENA; pipe$enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0:method$say__ENA;
//METAGUARD; pipe$enq; method$say__RDY;
`endif
