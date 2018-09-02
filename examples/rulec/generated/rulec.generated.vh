`ifndef __rulec_GENERATED__VH__
`define __rulec_GENERATED__VH__

//METASTART; Echo
//METAEXTERNAL; indication; l_ainterface_OC_EchoIndication;
//METAEXCLUSIVE; RULEdelay_rule__ENA; RULErespond_rule__ENA; request$say2__ENA; request$say__ENA
//METAGUARD; RULEdelay_rule; busy & ( !busy_delay );
//METAINVOKE; RULErespond_rule__ENA; v_type != 1:indication$heard2__ENA;v_type == 1:indication$heard__ENA;
//METABEFORE; RULErespond_rule__ENA; :RULEdelay_rule__ENA
//METAGUARD; RULErespond_rule; busy_delay & ( ( v_type != 32'd1 ) | indication$heard__RDY ) & ( ( v_type == 32'd1 ) | indication$heard2__RDY );
//METAEXCLUSIVE; request$say__ENA; request$say2__ENA
//METAGUARD; request$say2; !busy;
//METAGUARD; request$say; !busy;
//METAGUARD; request$setLeds; 1;
//METARULES; RULEdelay_rule; RULErespond_rule
//METASTART; l_top
//METAEXTERNAL; indication; l_ainterface_OC_PipeIn;
//METAINTERNAL; DUT__Echo; Echo;
//METAINTERNAL; M2P__indication; EchoIndication___M2P;
//METAINTERNAL; P2M__request; EchoRequest___P2M;
//METACONNECT; DUT__Echo$indication$heard__ENA; M2P__indication$method$heard__ENA
//METACONNECT; DUT__Echo$indication$heard2__ENA; M2P__indication$method$heard2__ENA
//METACONNECT; DUT__Echo$indication$heard2__RDY; M2P__indication$method$heard2__RDY
//METACONNECT; DUT__Echo$indication$heard3__ENA; M2P__indication$method$heard3__ENA
//METACONNECT; DUT__Echo$indication$heard3__RDY; M2P__indication$method$heard3__RDY
//METACONNECT; DUT__Echo$indication$heard__RDY; M2P__indication$method$heard__RDY
//METACONNECT; indication$enq__ENA; M2P__indication$pipe$enq__ENA
//METACONNECT; indication$enq__RDY; M2P__indication$pipe$enq__RDY
//METACONNECT; DUT__Echo$request$say__ENA; P2M__request$method$say__ENA
//METACONNECT; DUT__Echo$request$say2__ENA; P2M__request$method$say2__ENA
//METACONNECT; DUT__Echo$request$say2__RDY; P2M__request$method$say2__RDY
//METACONNECT; DUT__Echo$request$say__RDY; P2M__request$method$say__RDY
//METACONNECT; DUT__Echo$request$setLeds__ENA; P2M__request$method$setLeds__ENA
//METACONNECT; DUT__Echo$request$setLeds__RDY; P2M__request$method$setLeds__RDY
//METACONNECT; request$enq__ENA; P2M__request$pipe$enq__ENA
//METACONNECT; request$enq__RDY; P2M__request$pipe$enq__RDY
//METASTART; EchoIndication___M2P
//METAEXTERNAL; pipe; l_ainterface_OC_PipeIn;
//METAINVOKE; method$heard__ENA; :pipe$enq__ENA;
//METAEXCLUSIVE; method$heard__ENA; method$heard2__ENA; method$heard3__ENA
//METAINVOKE; method$heard2__ENA; :pipe$enq__ENA;
//METAEXCLUSIVE; method$heard2__ENA; method$heard3__ENA
//METAGUARD; method$heard2; pipe$enq__RDY;
//METAINVOKE; method$heard3__ENA; :pipe$enq__ENA;
//METAGUARD; method$heard3; pipe$enq__RDY;
//METAGUARD; method$heard; pipe$enq__RDY;
//METASTART; EchoRequest___P2M
//METAEXTERNAL; method; l_ainterface_OC_EchoRequest;
//METAINVOKE; pipe$enq__ENA; pipe$enq$v[31:16] == 16'd1:method$say2__ENA;pipe$enq$v[31:16] == 16'd0:method$say__ENA;pipe$enq$v[31:16] == 16'd2:method$setLeds__ENA;
//METAGUARD; pipe$enq; method$say__RDY & method$say2__RDY & method$setLeds__RDY;
`endif
