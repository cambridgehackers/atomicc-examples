`include "atomicclib.vh"

//METASTART; Pack
//METAINVOKE; request.say__ENA; :indication.heard__ENA;
//METAGUARD; request.say; indication.heard__RDY;
//METASTART; l_top
//METAINTERNAL; M2P__indication; ___M2PPackIndication;
//METAINTERNAL; DUT__Pack; Pack;
//METAINTERNAL; P2M__request; ___P2MPackRequest;
//METACONNECT; DUT__Pack$indication.heard__ENA; M2P__indication$method.heard__ENA
//METACONNECT; DUT__Pack$indication.heard__RDY; M2P__indication$method.heard__RDY
//METACONNECT; DUT__Pack$request.say__ENA; P2M__request$method.say__ENA
//METACONNECT; DUT__Pack$request.say__RDY; P2M__request$method.say__RDY
//METACONNECT; P2M__request$pipe.enq__ENA; request.enq__ENA
//METACONNECT; P2M__request$pipe.enq__RDY; request.enq__RDY
//METACONNECT; indication.enq__ENA; M2P__indication$pipe.enq__ENA
//METACONNECT; indication.enq__RDY; M2P__indication$pipe.enq__RDY
//METASTART; ___M2PPackIndication
//METAINVOKE; method.heard__ENA; :pipe.enq__ENA;
//METAGUARD; method.heard; pipe.enq__RDY;
//METASTART; ___P2MPackRequest
//METAINVOKE; pipe.enq__ENA; pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0:method.say__ENA;
//METAGUARD; pipe.enq; method.say__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd0 );
