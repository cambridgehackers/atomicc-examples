`ifndef __bscant_GENERATED__VH__
`define __bscant_GENERATED__VH__

//METASTART; Btest
//METAINTERNAL; bscan; Bscan(id=3,width=32);
//METAEXCLUSIVE; readUser$enq__ENA; RULE$respond_rule__ENA
//METAGUARD; readUser$enq; 1;
//METAEXCLUSIVE; request$say__ENA; RULE$requestRule__ENA
//METAGUARD; request$say; !busy;
//METAGUARD; request$say2; !busy;
//METAGUARD; request$setLeds; 1;
//METAINVOKE; RULE$requestRule__ENA; :bscan$toBscan$enq__ENA;
//METAGUARD; RULE$requestRule; toReady && bscan$toBscan$enq__RDY;
//METAINVOKE; RULE$respond_rule__ENA; :indication$heard__ENA;
//METAGUARD; RULE$respond_rule; fromReady && indication$heard__RDY;
//METARULES; RULE$requestRule; RULE$respond_rule
//METASTART; l_top
//METAINTERNAL; DUT__Btest; Btest;
//METAINTERNAL; M2P__indication; ___M2PBtestIndication;
//METAINTERNAL; P2M__request; ___P2MBtestRequest;
//METACONNECT; DUT__Btest$indication$heard__ENA; M2P__indication$method$heard__ENA
//METACONNECT; DUT__Btest$indication$heard__RDY; M2P__indication$method$heard__RDY
//METACONNECT; DUT__Btest$indication$heard2__ENA; M2P__indication$method$heard2__ENA
//METACONNECT; DUT__Btest$indication$heard2__RDY; M2P__indication$method$heard2__RDY
//METACONNECT; DUT__Btest$indication$heard3__ENA; M2P__indication$method$heard3__ENA
//METACONNECT; DUT__Btest$indication$heard3__RDY; M2P__indication$method$heard3__RDY
//METACONNECT; indication$enq__ENA; M2P__indication$pipe$enq__ENA
//METACONNECT; indication$enq__RDY; M2P__indication$pipe$enq__RDY
//METACONNECT; DUT__Btest$request$say__ENA; P2M__request$method$say__ENA
//METACONNECT; DUT__Btest$request$say__RDY; P2M__request$method$say__RDY
//METACONNECT; DUT__Btest$request$say2__ENA; P2M__request$method$say2__ENA
//METACONNECT; DUT__Btest$request$say2__RDY; P2M__request$method$say2__RDY
//METACONNECT; DUT__Btest$request$setLeds__ENA; P2M__request$method$setLeds__ENA
//METACONNECT; DUT__Btest$request$setLeds__RDY; P2M__request$method$setLeds__RDY
//METACONNECT; request$enq__ENA; P2M__request$pipe$enq__ENA
//METACONNECT; request$enq__RDY; P2M__request$pipe$enq__RDY
//METASTART; ___M2PBtestIndication
//METAINVOKE; method$heard__ENA; :pipe$enq__ENA;
//METAEXCLUSIVE; method$heard__ENA; method$heard2__ENA; method$heard3__ENA
//METAGUARD; method$heard; pipe$enq__RDY;
//METAINVOKE; method$heard2__ENA; :pipe$enq__ENA;
//METAEXCLUSIVE; method$heard2__ENA; method$heard3__ENA
//METAGUARD; method$heard2; pipe$enq__RDY;
//METAINVOKE; method$heard3__ENA; :pipe$enq__ENA;
//METAGUARD; method$heard3; pipe$enq__RDY;
//METASTART; ___P2MBtestRequest
//METAINVOKE; pipe$enq__ENA; pipe$enq$v[ ( 31 + 16 ) : ( 16 + 16 ) ] == 16'd1:method$say2__ENA;pipe$enq$v[ ( 31 + 16 ) : ( 16 + 16 ) ] == 16'd0:method$say__ENA;pipe$enq$v[ ( 31 + 16 ) : ( 16 + 16 ) ] == 16'd2:method$setLeds__ENA;
//METAGUARD; pipe$enq; method$say__RDY && method$say2__RDY && method$setLeds__RDY;
`endif
