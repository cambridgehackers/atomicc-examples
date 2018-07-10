`ifndef __rulec_GENERATED__VH__
`define __rulec_GENERATED__VH__

//METASTART; AdapterFromBus
//METAEXTERNAL; out; l_ainterface_OC_PipeInH;
//METAEXCLUSIVE; in$enq__ENA; pushValue__ENA
//METAGUARD; in$enq; !waitForEnq ;
//METAINVOKE; pushValue__ENA; :out$enq__ENA;
//METAGUARD; pushValue; waitForEnq  & out$enq__RDY ;
//METARULES; pushValue
//METASTART; AdapterToBus
//METAEXTERNAL; out; l_ainterface_OC_PipeInB;
//METAINVOKE; copyRule__ENA; :out$enq__ENA;
//METAEXCLUSIVE; copyRule__ENA; in$enq__ENA
//METAGUARD; copyRule; ( remain  != 16'd0 ) & out$enq__RDY ;
//METAGUARD; in$enq; remain  == 16'd0;
//METARULES; copyRule
//METASTART; CONNECTNET2
//METAGUARD; assign; 1;
//METARULES; assign
//METASTART; Echo
//METAEXTERNAL; indication; l_ainterface_OC_EchoIndication;
//METAEXCLUSIVE; delay_rule__ENA; request$say2__ENA; request$say__ENA; respond_rule__ENA
//METAGUARD; delay_rule; ( ( busy  != 32'd0 ) & ( busy_delay  == 32'd0 ) ) != 0;
//METAEXCLUSIVE; request$say__ENA; request$say2__ENA
//METAGUARD; request$say2; busy  == 32'd0;
//METAGUARD; request$say; busy  == 32'd0;
//METAGUARD; request$setLeds; 1;
//METAGUARD; request$zsay4; 1;
//METAINVOKE; respond_rule__ENA; v_type  != 32'd1:indication$heard2__ENA;v_type  == 32'd1:indication$heard__ENA;
//METABEFORE; respond_rule__ENA; :delay_rule__ENA
//METAGUARD; respond_rule; ( busy_delay  != 32'd0 ) & ( ( v_type  != 32'd1 ) | indication$heard__RDY  ) & ( ( v_type  == 32'd1 ) | indication$heard2__RDY  );
//METARULES; delay_rule; respond_rule
//METASTART; Fifo1
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; !full ;
//METAGUARD; out$deq; full ;
//METAGUARD; out$first; full ;
//METASTART; MuxPipe
//METAEXTERNAL; out; l_ainterface_OC_PipeIn;
//METAINTERNAL; forwardFifo; Fifo1;
//METAINVOKE; fifoRule__ENA; :forwardFifo$out$deq__ENA;:forwardFifo$out$first;:out$enq__ENA;
//METAEXCLUSIVE; fifoRule__ENA; in$enq__ENA
//METAGUARD; fifoRule; forwardFifo$out$first__RDY  & out$enq__RDY  & forwardFifo$out$deq__RDY ;
//METAINVOKE; forward$enq__ENA; :forwardFifo$in$enq__ENA;
//METAGUARD; forward$enq; forwardFifo$in$enq__RDY ;
//METAINVOKE; in$enq__ENA; :out$enq__ENA;
//METAGUARD; in$enq; out$enq__RDY ;
//METARULES; fifoRule
//METASTART; UserTop
//METAEXTERNAL; read; l_ainterface_OC_PipeInB;
//METAINTERNAL; radapter_0; AdapterToBus;
//METAINTERNAL; wadapter_0; AdapterFromBus;
//METAINTERNAL; ic; indConnect;
//METAINTERNAL; rc; reqConnect;
//METAINTERNAL; ctop; l_top;
//METACONNECT; radapter_0$out$enq__ENA; read$enq__ENA
//METACONNECT; radapter_0$out$enq__RDY; read$enq__RDY
//METACONNECT; wadapter_0$in$enq__ENA; write$enq__ENA
//METACONNECT; wadapter_0$in$enq__RDY; write$enq__RDY
//METACONNECT; ctop$indication$enq__ENA; ic$indication$enq__ENA
//METACONNECT; ctop$indication$enq__RDY; ic$indication$enq__RDY
//METACONNECT; radapter_0$in$enq__ENA; ic$rad$enq__ENA
//METACONNECT; radapter_0$in$enq__RDY; ic$rad$enq__RDY
//METACONNECT; ctop$request$enq__ENA; rc$request$enq__ENA
//METACONNECT; ctop$request$enq__RDY; rc$request$enq__RDY
//METACONNECT; wadapter_0$out$enq__ENA; rc$wad$enq__ENA
//METACONNECT; wadapter_0$out$enq__RDY; rc$wad$enq__RDY
//METASTART; indConnect
//METAEXTERNAL; rad; l_ainterface_OC_PipeInH;
//METAINVOKE; indication$enq__ENA; :rad$enq__ENA;
//METAGUARD; indication$enq; rad$enq__RDY ;
//METASTART; reqConnect
//METAEXTERNAL; request; l_ainterface_OC_PipeIn;
//METAINVOKE; wad$enq__ENA; :request$enq__ENA;
//METAGUARD; wad$enq; request$enq__RDY ;
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
//METAGUARD; method$heard2; pipe$enq__RDY ;
//METAINVOKE; method$heard3__ENA; :pipe$enq__ENA;
//METAGUARD; method$heard3; pipe$enq__RDY ;
//METAGUARD; method$heard; pipe$enq__RDY ;
//METASTART; EchoRequest___P2M
//METAEXTERNAL; method; l_ainterface_OC_EchoRequest;
//METAINVOKE; pipe$enq__ENA; pipe$enq$v[31:16]  == 16'd1:method$say2__ENA;pipe$enq$v[31:16]  == 16'd0:method$say__ENA;pipe$enq$v[31:16]  == 16'd2:method$setLeds__ENA;pipe$enq$v[31:16]  == 16'd3:method$zsay4__ENA;
//METAGUARD; pipe$enq; method$say__RDY  & method$say2__RDY  & method$setLeds__RDY  & method$zsay4__RDY ;
`endif
