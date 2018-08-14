`ifndef __rulec_GENERATED__VH__
`define __rulec_GENERATED__VH__

//METASTART; AdapterFromBus
//METAEXTERNAL; out; l_ainterface_OC_PipeInH;
//METAINVOKE; RULEpushValue__ENA; :out$enq__ENA;
//METAEXCLUSIVE; RULEpushValue__ENA; in$enq__ENA
//METABEFORE; RULEpushValue__ENA; :in$enq__ENA
//METAGUARD; RULEpushValue; waitForEnq & out$enq__RDY;
//METAGUARD; in$enq; !waitForEnq;
//METARULES; RULEpushValue
//METASTART; AdapterToBus
//METAEXTERNAL; out; l_ainterface_OC_PipeInB;
//METAINVOKE; RULEcopyRule__ENA; :out$enq__ENA;
//METAEXCLUSIVE; RULEcopyRule__ENA; in$enq__ENA
//METAGUARD; RULEcopyRule; ( remain != 16'd0 ) & out$enq__RDY;
//METAGUARD; in$enq; remain == 16'd0;
//METARULES; RULEcopyRule
//METASTART; CONNECTNET2
//METAGUARD; RULEassign; 1;
//METARULES; RULEassign
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
//METAGUARD; request$zsay4; 1;
//METARULES; RULEdelay_rule; RULErespond_rule
//METASTART; UserTop
//METAEXTERNAL; read; l_ainterface_OC_PipeInB;
//METAINTERNAL; radapter_0; AdapterToBus;
//METAINTERNAL; wadapter_0; AdapterFromBus;
//METAINTERNAL; ctop; l_top;
//METAINVOKE; indication$enq__ENA; :radapter_0$in$enq__ENA;
//METAGUARD; indication$enq; radapter_0$in$enq__RDY;
//METAINVOKE; wad$enq__ENA; :ctop$request$enq__ENA;
//METAGUARD; wad$enq; ctop$request$enq__RDY;
//METACONNECT; ctop$indication$enq__ENA; indication$enq__ENA
//METACONNECT; ctop$indication$enq__RDY; indication$enq__RDY
//METACONNECT; wadapter_0$out$enq__ENA; wad$enq__ENA
//METACONNECT; wadapter_0$out$enq__RDY; wad$enq__RDY
//METACONNECT; write$enq__ENA; wadapter_0$in$enq__ENA
//METACONNECT; write$enq__RDY; wadapter_0$in$enq__RDY
//METACONNECT; read$enq__ENA; radapter_0$out$enq__ENA
//METACONNECT; read$enq__RDY; radapter_0$out$enq__RDY
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
//METACONNECT; DUT__Echo$request$zsay4__ENA; P2M__request$method$zsay4__ENA
//METACONNECT; DUT__Echo$request$zsay4__RDY; P2M__request$method$zsay4__RDY
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
//METAINVOKE; pipe$enq__ENA; pipe$enq$v[31:16] == 16'd1:method$say2__ENA;pipe$enq$v[31:16] == 16'd0:method$say__ENA;pipe$enq$v[31:16] == 16'd2:method$setLeds__ENA;pipe$enq$v[31:16] == 16'd3:method$zsay4__ENA;
//METAGUARD; pipe$enq; method$say__RDY & method$say2__RDY & method$setLeds__RDY & method$zsay4__RDY;
`endif
