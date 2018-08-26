`ifndef __printf_GENERATED__VH__
`define __printf_GENERATED__VH__

//METASTART; Echo
//METAEXTERNAL; indication; l_ainterface_OC_EchoIndication;
//METAEXTERNAL; printfp; l_ainterface_OC_PipeIn;
//METAGUARD; RULEclockRule; 1;
//METAINVOKE; RULEdelay_rule__ENA; :printfp$enq__ENA;
//METAEXCLUSIVE; RULEdelay_rule__ENA; RULErespond_rule__ENA; request$say2__ENA; request$say__ENA; request$setLeds__ENA; request$zsay4__ENA
//METAGUARD; RULEdelay_rule; ( busy != 32'd0 ) & ( busy_delay == 32'd0 ) & printfp$enq__RDY;
//METAINVOKE; RULErespond_rule__ENA; v_type != 1:indication$heard2__ENA;v_type == 1:indication$heard__ENA;:printfp$enq__ENA;
//METAEXCLUSIVE; RULErespond_rule__ENA; request$say2__ENA; request$say__ENA; request$setLeds__ENA; request$zsay4__ENA
//METABEFORE; RULErespond_rule__ENA; :RULEdelay_rule__ENA
//METAGUARD; RULErespond_rule; ( busy_delay != 32'd0 ) & ( ( v_type != 32'd1 ) | indication$heard__RDY ) & ( ( v_type == 32'd1 ) | indication$heard2__RDY ) & printfp$enq__RDY;
//METAINVOKE; request$say__ENA; :printfp$enq__ENA;
//METAEXCLUSIVE; request$say__ENA; request$say2__ENA; request$setLeds__ENA; request$zsay4__ENA
//METAINVOKE; request$say2__ENA; :printfp$enq__ENA;
//METAEXCLUSIVE; request$say2__ENA; request$setLeds__ENA; request$zsay4__ENA
//METAGUARD; request$say2; ( busy == 32'd0 ) & printfp$enq__RDY;
//METAGUARD; request$say; ( busy == 32'd0 ) & printfp$enq__RDY;
//METAINVOKE; request$setLeds__ENA; :printfp$enq__ENA;
//METAEXCLUSIVE; request$setLeds__ENA; request$zsay4__ENA
//METAGUARD; request$setLeds; printfp$enq__RDY;
//METAINVOKE; request$zsay4__ENA; :printfp$enq__ENA;
//METAGUARD; request$zsay4; printfp$enq__RDY;
//METARULES; RULEclockRule; RULEdelay_rule; RULErespond_rule
//METASTART; Fifo1
//METAINTERNAL; fifo; Fifo1Base__PARAM__width__128;
//METAINVOKE; in$enq__ENA; :fifo$in$enq__ENA;
//METAGUARD; in$enq; fifo$in$enq__RDY;
//METAINVOKE; out$deq__ENA; :fifo$out$deq__ENA;
//METAGUARD; out$deq; fifo$out$deq__RDY;
//METAINVOKE; out$first; :fifo$out$first;
//METAGUARD; out$first; fifo$out$first__RDY;
//METASTART; Fifo1Base__PARAM__width__128
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; !full;
//METAGUARD; out$deq; full;
//METAGUARD; out$first; full;
//METASTART; MuxPipe
//METAEXTERNAL; out; l_ainterface_OC_PipeIn;
//METAINTERNAL; forwardFifo; Fifo1;
//METAINVOKE; RULEfifoRule__ENA; :forwardFifo$out$deq__ENA;:forwardFifo$out$first;:out$enq__ENA;
//METAEXCLUSIVE; RULEfifoRule__ENA; in$enq__ENA
//METAGUARD; RULEfifoRule; forwardFifo$out$first__RDY & out$enq__RDY & forwardFifo$out$deq__RDY;
//METAINVOKE; forward$enq__ENA; :forwardFifo$in$enq__ENA;
//METAGUARD; forward$enq; forwardFifo$in$enq__RDY;
//METAINVOKE; in$enq__ENA; :out$enq__ENA;
//METAGUARD; in$enq; out$enq__RDY;
//METARULES; RULEfifoRule
//METASTART; l_top
//METAEXTERNAL; indication; l_ainterface_OC_PipeIn;
//METAINTERNAL; DUT__Echo; Echo;
//METAINTERNAL; mux; MuxPipe;
//METAINTERNAL; M2P__indication; EchoIndication___M2P;
//METAINTERNAL; P2M__request; EchoRequest___P2M;
//METACONNECT; DUT__Echo$indication$heard__ENA; M2P__indication$method$heard__ENA
//METACONNECT; DUT__Echo$indication$heard2__ENA; M2P__indication$method$heard2__ENA
//METACONNECT; DUT__Echo$indication$heard2__RDY; M2P__indication$method$heard2__RDY
//METACONNECT; DUT__Echo$indication$heard3__ENA; M2P__indication$method$heard3__ENA
//METACONNECT; DUT__Echo$indication$heard3__RDY; M2P__indication$method$heard3__RDY
//METACONNECT; DUT__Echo$indication$heard__RDY; M2P__indication$method$heard__RDY
//METACONNECT; mux$in$enq__ENA; M2P__indication$pipe$enq__ENA
//METACONNECT; mux$in$enq__RDY; M2P__indication$pipe$enq__RDY
//METACONNECT; mux$forward$enq__ENA; DUT__Echo$printfp$enq__ENA
//METACONNECT; mux$forward$enq__RDY; DUT__Echo$printfp$enq__RDY
//METACONNECT; indication$enq__ENA; mux$out$enq__ENA
//METACONNECT; indication$enq__RDY; mux$out$enq__RDY
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
