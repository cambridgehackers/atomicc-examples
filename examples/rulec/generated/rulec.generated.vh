`ifndef __rulec_GENERATED__VH__
`define __rulec_GENERATED__VH__

//METASTART; Echo
//METAEXTERNAL; indication; EchoIndication;
//METAEXCLUSIVE; request$say__ENA; RULE$delay_rule__ENA; request$say2__ENA
//METAGUARD; request$say; !busy;
//METAEXCLUSIVE; request$say2__ENA; RULE$delay_rule__ENA
//METAGUARD; request$say2; !busy;
//METAGUARD; request$setLeds; 1;
//METAEXCLUSIVE; RULE$delay_rule__ENA; RULE$respond_rule__ENA
//METAGUARD; RULE$delay_rule; !( busy_delay | ( !busy ) );
//METAINVOKE; RULE$respond_rule__ENA; !( v_type == 1 ):indication$heard2__ENA;v_type == 1:indication$heard__ENA;
//METABEFORE; RULE$respond_rule__ENA; :RULE$delay_rule__ENA
//METAGUARD; RULE$respond_rule; busy_delay & ( ( indication$heard__RDY & ( ( v_type == 1 ) | indication$heard2__RDY ) ) | ( ( !indication$heard__RDY ) & ( !( ( v_type == 1 ) | ( !indication$heard2__RDY ) ) ) ) );
//METARULES; RULE$delay_rule; RULE$respond_rule
//METASTART; l_top
//METAEXTERNAL; indication; PipeInH;
//METAINTERNAL; DUT__Echo; Echo;
//METAINTERNAL; M2P__indication; ___M2PEchoIndication;
//METAINTERNAL; P2M__request; ___P2MEchoRequest;
//METACONNECT; DUT__Echo$indication$heard__ENA; M2P__indication$method$heard__ENA
//METACONNECT; DUT__Echo$indication$heard__RDY; M2P__indication$method$heard__RDY
//METACONNECT; DUT__Echo$indication$heard2__ENA; M2P__indication$method$heard2__ENA
//METACONNECT; DUT__Echo$indication$heard2__RDY; M2P__indication$method$heard2__RDY
//METACONNECT; DUT__Echo$indication$heard3__ENA; M2P__indication$method$heard3__ENA
//METACONNECT; DUT__Echo$indication$heard3__RDY; M2P__indication$method$heard3__RDY
//METACONNECT; indication$enq__ENA; M2P__indication$pipe$enq__ENA
//METACONNECT; indication$enq__RDY; M2P__indication$pipe$enq__RDY
//METACONNECT; DUT__Echo$request$say__ENA; P2M__request$method$say__ENA
//METACONNECT; DUT__Echo$request$say__RDY; P2M__request$method$say__RDY
//METACONNECT; DUT__Echo$request$say2__ENA; P2M__request$method$say2__ENA
//METACONNECT; DUT__Echo$request$say2__RDY; P2M__request$method$say2__RDY
//METACONNECT; DUT__Echo$request$setLeds__ENA; P2M__request$method$setLeds__ENA
//METACONNECT; DUT__Echo$request$setLeds__RDY; P2M__request$method$setLeds__RDY
//METACONNECT; request$enq__ENA; P2M__request$pipe$enq__ENA
//METACONNECT; request$enq__RDY; P2M__request$pipe$enq__RDY
//METASTART; ___M2PEchoIndication
//METAEXTERNAL; pipe; PipeInH;
//METAINVOKE; method$heard__ENA; :pipe$enq__ENA;
//METAEXCLUSIVE; method$heard__ENA; method$heard2__ENA; method$heard3__ENA
//METAGUARD; method$heard; pipe$enq__RDY;
//METAINVOKE; method$heard2__ENA; :pipe$enq__ENA;
//METAEXCLUSIVE; method$heard2__ENA; method$heard3__ENA
//METAGUARD; method$heard2; pipe$enq__RDY;
//METAINVOKE; method$heard3__ENA; :pipe$enq__ENA;
//METAGUARD; method$heard3; pipe$enq__RDY;
//METASTART; ___P2MEchoRequest
//METAEXTERNAL; method; EchoRequest;
//METAINVOKE; pipe$enq__ENA; pipe$enq$v[ 31 : 16 ] == 16'd1:method$say2__ENA;pipe$enq$v[ 31 : 16 ] == 16'd0:method$say__ENA;pipe$enq$v[ 31 : 16 ] == 16'd2:method$setLeds__ENA;
//METAGUARD; pipe$enq; method$say__RDY & method$say2__RDY & method$setLeds__RDY;
`endif
