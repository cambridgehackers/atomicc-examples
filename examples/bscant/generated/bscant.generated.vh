`include "atomicclib.vh"

//METASTART; Btest
//METAINTERNAL; bscan; Bscan(id=4,width=32);
//METAINVOKE; readUser.enq__ENA; :indication.heard__ENA;
//METAGUARD; readUser.enq; indication.heard__RDY;
//METAEXCLUSIVE; request.say__ENA; RULE$copyRule__ENA
//METAGUARD; request.say; 1'd1;
//METAINVOKE; RULE$copyRule__ENA; :bscan$toBscan.enq__ENA;
//METAGUARD; RULE$copyRule; bscan$toBscan.enq__RDY;
//METARULES; RULE$copyRule
//METACONNECT; readUser.enq__ENA; bscan$fromBscan.enq__ENA
//METACONNECT; readUser.enq__RDY; bscan$fromBscan.enq__RDY
//METASTART; l_top
//METAINTERNAL; M2P__indication; ___M2PBtestIndication;
//METAINTERNAL; DUT__Btest; Btest;
//METAINTERNAL; P2M__request; ___P2MBtestRequest;
//METACONNECT; DUT__Btest$indication.heard__ENA; M2P__indication$method.heard__ENA
//METACONNECT; DUT__Btest$indication.heard__RDY; M2P__indication$method.heard__RDY
//METACONNECT; DUT__Btest$request.say__ENA; P2M__request$method.say__ENA
//METACONNECT; DUT__Btest$request.say__RDY; P2M__request$method.say__RDY
//METACONNECT; P2M__request$pipe.enq__ENA; request.enq__ENA
//METACONNECT; P2M__request$pipe.enq__RDY; request.enq__RDY
//METACONNECT; indication.enq__ENA; M2P__indication$pipe.enq__ENA
//METACONNECT; indication.enq__RDY; M2P__indication$pipe.enq__RDY
//METASTART; ___M2PBtestIndication
//METAINVOKE; method.heard__ENA; :pipe.enq__ENA;
//METAGUARD; method.heard; pipe.enq__RDY;
//METASTART; ___P2MBtestRequest
//METAINVOKE; pipe.enq__ENA; pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0:method.say__ENA;
//METAGUARD; pipe.enq; method.say__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd0 );
