`include "atomicclib.vh"

//METASTART; Echo
//METAINTERNAL; fifo; Fifo1Base(width=32);
//METAINVOKE; sout.say__ENA; :fifo$in.enq__ENA;
//METAGUARD; sout.say; fifo$in.enq__RDY;
//METAINVOKE; sout.setup__ENA; :ind.heards__ENA;
//METAGUARD; sout.setup; ind.heards__RDY;
//METAINVOKE; RULE$respond_rule__ENA; :fifo$out.deq__ENA;:ind.heard__ENA;
//METAGUARD; RULE$respond_rule; fifo$out.deq__RDY && fifo$out.first__RDY && ind.heard__RDY;
//METARULES; RULE$respond_rule
//METASTART; l_top
//METAINTERNAL; M2P__ind; ___M2PEchoIndication;
//METAINTERNAL; DUT__Echo; Echo;
//METAINTERNAL; P2M__sout; ___P2MEchoRequest;
//METACONNECT; DUT__Echo$ind.heard__ENA; M2P__ind$method.heard__ENA
//METACONNECT; DUT__Echo$ind.heard__RDY; M2P__ind$method.heard__RDY
//METACONNECT; DUT__Echo$ind.heards__ENA; M2P__ind$method.heards__ENA
//METACONNECT; DUT__Echo$ind.heards__RDY; M2P__ind$method.heards__RDY
//METACONNECT; DUT__Echo$sout.say__ENA; P2M__sout$method.say__ENA
//METACONNECT; DUT__Echo$sout.say__RDY; P2M__sout$method.say__RDY
//METACONNECT; DUT__Echo$sout.setup__ENA; P2M__sout$method.setup__ENA
//METACONNECT; DUT__Echo$sout.setup__RDY; P2M__sout$method.setup__RDY
//METACONNECT; P2M__sout$pipe.enq__ENA; request.enq__ENA
//METACONNECT; P2M__sout$pipe.enq__RDY; request.enq__RDY
//METACONNECT; indication.enq__ENA; M2P__ind$pipe.enq__ENA
//METACONNECT; indication.enq__RDY; M2P__ind$pipe.enq__RDY
//METASTART; ___M2PEchoIndication
//METAINVOKE; method.heard__ENA; :pipe.enq__ENA;
//METAEXCLUSIVE; method.heard__ENA; method.heards__ENA
//METAGUARD; method.heard; pipe.enq__RDY;
//METAINVOKE; method.heards__ENA; :pipe.enq__ENA;
//METAGUARD; method.heards; pipe.enq__RDY;
//METASTART; ___P2MEchoRequest
//METAINVOKE; pipe.enq__ENA; pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0:method.say__ENA;pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd1:method.setup__ENA;
//METAGUARD; pipe.enq; ( method.say__RDY && ( method.setup__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd1 ) ) ) || ( ( !method.say__RDY ) && ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd0 ) && ( method.setup__RDY || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] != 16'd1 ) ) );
