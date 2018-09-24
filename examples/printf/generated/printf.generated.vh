`ifndef __printf_GENERATED__VH__
`define __printf_GENERATED__VH__

//METASTART; Echo
//METAEXTERNAL; indication; l_ainterface_OC_EchoIndication;
//METAEXTERNAL; printfp; l_ainterface_OC_PipeInH;
//METAGUARD; RULE$clockRule; 1'd1;
//METAINVOKE; RULE$delay_rule__ENA; :printfp$enq__ENA;
//METAEXCLUSIVE; RULE$delay_rule__ENA; RULE$respond_rule__ENA; request$say2__ENA; request$say__ENA; request$setLeds__ENA; request$zsay4__ENA
//METAGUARD; RULE$delay_rule; ( busy != 32'd0 ) & ( busy_delay == 32'd0 ) & printfp$enq__RDY;
//METAINVOKE; RULE$respond_rule__ENA; v_type != 1:indication$heard2__ENA;v_type == 1:indication$heard__ENA;:printfp$enq__ENA;
//METAEXCLUSIVE; RULE$respond_rule__ENA; request$say2__ENA; request$say__ENA; request$setLeds__ENA; request$zsay4__ENA
//METABEFORE; RULE$respond_rule__ENA; :RULE$delay_rule__ENA
//METAGUARD; RULE$respond_rule; ( busy_delay != 32'd0 ) & ( ( v_type != 32'd1 ) | indication$heard__RDY ) & ( ( v_type == 32'd1 ) | indication$heard2__RDY ) & printfp$enq__RDY;
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
//METARULES; RULE$clockRule; RULE$delay_rule; RULE$respond_rule
//METASTART; l_top
//METAEXTERNAL; indication; l_ainterface_OC_PipeInH;
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
//METAEXTERNAL; pipe; l_ainterface_OC_PipeInH;
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
