`ifndef __printf_GENERATED__VH__
`define __printf_GENERATED__VH__

//METASTART; l_module_OC_Echo
//METAEXTERNAL; indication; l_ainterface_OC_EchoIndication;
//METAEXTERNAL; printfp; l_ainterface_OC_PipeIn;
//METAEXCLUSIVE; delay_rule__ENA; request$say2__ENA; request$say__ENA; respond_rule__ENA
//METAGUARD; delay_rule; ( ( busy  != 0 ) & ( busy_delay  == 32'd0 ) ) != 0;
//METAINVOKE; request$say__ENA; :printfp$enq__ENA;
//METAEXCLUSIVE; request$say__ENA; request$say2__ENA
//METAGUARD; request$say2; busy  == 32'd0;
//METAGUARD; request$say; ( busy  == 32'd0 ) & printfp$enq__RDY ;
//METAGUARD; request$setLeds; 1;
//METAGUARD; request$zsay4; 1;
//METAINVOKE; respond_rule__ENA; v_type  != 1:indication$heard2__ENA;v_type  == 32'd1:indication$heard__ENA;
//METABEFORE; respond_rule__ENA; :delay_rule__ENA
//METAGUARD; respond_rule; ( busy_delay  != 0 ) & ( ( v_type  != 1 ) | indication$heard__RDY  ) & ( ( v_type  == 32'd1 ) | indication$heard2__RDY  );
//METARULES; delay_rule; respond_rule
//METASTART; l_module_OC_Hardware
//METAINTERNAL; lERI; l_module_OC_EchoRequest___P2M;
//METAINTERNAL; lEIO; l_module_OC_EchoIndication___M2P;
//METAINTERNAL; lEcho; l_module_OC_Echo;
//METAINTERNAL; muxPipe; l_module_OC_MuxPipe;
//METACONNECT; lEIO$pipe$enq__ENA; muxPipe$in$enq__ENA
//METACONNECT; lEIO$pipe$enq__RDY; muxPipe$in$enq__RDY
//METACONNECT; muxPipe$forward$enq__ENA; lEcho$printfp$enq__ENA
//METACONNECT; muxPipe$forward$enq__RDY; lEcho$printfp$enq__RDY
//METACONNECT; lERI$method$say__ENA; lEcho$request$say__ENA
//METACONNECT; lERI$method$say2__ENA; lEcho$request$say2__ENA
//METACONNECT; lERI$method$say2__RDY; lEcho$request$say2__RDY
//METACONNECT; lERI$method$say__RDY; lEcho$request$say__RDY
//METACONNECT; lERI$method$setLeds__ENA; lEcho$request$setLeds__ENA
//METACONNECT; lERI$method$setLeds__RDY; lEcho$request$setLeds__RDY
//METACONNECT; lERI$method$zsay4__ENA; lEcho$request$zsay4__ENA
//METACONNECT; lERI$method$zsay4__RDY; lEcho$request$zsay4__RDY
//METACONNECT; lEcho$indication$heard__ENA; lEIO$method$heard__ENA
//METACONNECT; lEcho$indication$heard2__ENA; lEIO$method$heard2__ENA
//METACONNECT; lEcho$indication$heard2__RDY; lEIO$method$heard2__RDY
//METACONNECT; lEcho$indication$heard3__ENA; lEIO$method$heard3__ENA
//METACONNECT; lEcho$indication$heard3__RDY; lEIO$method$heard3__RDY
//METACONNECT; lEcho$indication$heard__RDY; lEIO$method$heard__RDY
//METACONNECT; request$enq__ENA; lERI$pipe$enq__ENA
//METACONNECT; request$enq__RDY; lERI$pipe$enq__RDY
//METASTART; l_module_OC_EchoIndication___M2P
//METAEXTERNAL; pipe; l_ainterface_OC_PipeIn;
//METAINVOKE; method$heard__ENA; :pipe$enq__ENA;
//METAEXCLUSIVE; method$heard__ENA; method$heard2__ENA; method$heard3__ENA
//METAINVOKE; method$heard2__ENA; :pipe$enq__ENA;
//METAEXCLUSIVE; method$heard2__ENA; method$heard3__ENA
//METAGUARD; method$heard2; pipe$enq__RDY ;
//METAINVOKE; method$heard3__ENA; :pipe$enq__ENA;
//METAGUARD; method$heard3; pipe$enq__RDY ;
//METAGUARD; method$heard; pipe$enq__RDY ;
//METASTART; l_module_OC_EchoRequest___P2M
//METAEXTERNAL; method; l_ainterface_OC_EchoRequest;
//METAINVOKE; pipe$enq__ENA; pipe$enq$v[31:16]  == 16'd1:method$say2__ENA;pipe$enq$v[31:16]  == 16'd0:method$say__ENA;pipe$enq$v[31:16]  == 16'd2:method$setLeds__ENA;pipe$enq$v[31:16]  == 16'd3:method$zsay4__ENA;
//METAGUARD; pipe$enq; method$say__RDY  & method$say2__RDY  & method$setLeds__RDY  & method$zsay4__RDY ;
`endif
