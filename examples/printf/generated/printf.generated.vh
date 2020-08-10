`ifndef __printf_GENERATED__VH__
`define __printf_GENERATED__VH__

//METASTART; Echo
//METAINTERNAL; printfp; Printf;
//METAINVOKE; request$say__ENA; :printfp$enq__ENA;
//METAEXCLUSIVE; request$say__ENA; RULE$delay_rule__ENA; RULE$respond_rule__ENA; request$say2__ENA; request$setLeds__ENA
//METAGUARD; request$say; !( ( 0 == ( ( busy != 0 ) ^ 1 ) ) || ( !printfp$enq__RDY ) );
//METAINVOKE; request$say2__ENA; :printfp$enq__ENA;
//METAEXCLUSIVE; request$say2__ENA; RULE$delay_rule__ENA; RULE$respond_rule__ENA; request$setLeds__ENA
//METAGUARD; request$say2; !( ( 0 == ( ( busy != 0 ) ^ 1 ) ) || ( !printfp$enq__RDY ) );
//METAINVOKE; request$setLeds__ENA; :printfp$enq__ENA;
//METAEXCLUSIVE; request$setLeds__ENA; RULE$delay_rule__ENA; RULE$respond_rule__ENA
//METAGUARD; request$setLeds; printfp$enq__RDY;
//METAINVOKE; RULE$delay_rule__ENA; :printfp$enq__ENA;
//METAEXCLUSIVE; RULE$delay_rule__ENA; RULE$respond_rule__ENA
//METAGUARD; RULE$delay_rule; !( ( ( ( busy != 0 ) & ( busy_delay == 0 ) ) == 0 ) || ( !printfp$enq__RDY ) );
//METAINVOKE; RULE$respond_rule__ENA; !( v_type == 1 ):indication$heard2__ENA;v_type == 1:indication$heard__ENA;:printfp$enq__ENA;
//METABEFORE; RULE$respond_rule__ENA; :RULE$delay_rule__ENA
//METAGUARD; RULE$respond_rule; !( ( busy_delay == 0 ) || ( !( ( indication$heard__RDY && ( ( ( v_type == 1 ) && printfp$enq__RDY ) || ( ( !( v_type == 1 ) ) && indication$heard2__RDY && printfp$enq__RDY ) ) ) || ( ( !indication$heard__RDY ) && ( !( ( v_type == 1 ) || ( !( indication$heard2__RDY && printfp$enq__RDY ) ) ) ) ) ) ) );
//METAGUARD; RULE$clockRule; 1;
//METARULES; RULE$delay_rule; RULE$respond_rule; RULE$clockRule
//METASTART; l_top
//METAINTERNAL; DUT__Echo; Echo;
//METAINTERNAL; M2P__indication; ___M2PEchoIndication;
//METAINTERNAL; P2M__request; ___P2MEchoRequest;
//METACONNECT; DUT__Echo$indication$heard__ENA; M2P__indication$method$heard__ENA
//METACONNECT; DUT__Echo$indication$heard__RDY; M2P__indication$method$heard__RDY
//METACONNECT; DUT__Echo$indication$heard2__ENA; M2P__indication$method$heard2__ENA
//METACONNECT; DUT__Echo$indication$heard2__RDY; M2P__indication$method$heard2__RDY
//METACONNECT; DUT__Echo$indication$heard3__ENA; M2P__indication$method$heard3__ENA
//METACONNECT; DUT__Echo$indication$heard3__RDY; M2P__indication$method$heard3__RDY
//METACONNECT; DUT__Echo$request$say__ENA; P2M__request$method$say__ENA
//METACONNECT; DUT__Echo$request$say__RDY; P2M__request$method$say__RDY
//METACONNECT; DUT__Echo$request$say2__ENA; P2M__request$method$say2__ENA
//METACONNECT; DUT__Echo$request$say2__RDY; P2M__request$method$say2__RDY
//METACONNECT; DUT__Echo$request$setLeds__ENA; P2M__request$method$setLeds__ENA
//METACONNECT; DUT__Echo$request$setLeds__RDY; P2M__request$method$setLeds__RDY
//METACONNECT; request$enq__ENA; P2M__request$pipe$enq__ENA
//METACONNECT; request$enq__RDY; P2M__request$pipe$enq__RDY
//METACONNECT; indication$enq__ENA; M2P__indication$pipe$enq__ENA
//METACONNECT; indication$enq__RDY; M2P__indication$pipe$enq__RDY
//METASTART; ___M2PEchoIndication
//METAINVOKE; method$heard__ENA; :pipe$enq__ENA;
//METAEXCLUSIVE; method$heard__ENA; method$heard2__ENA; method$heard3__ENA
//METAGUARD; method$heard; pipe$enq__RDY;
//METAINVOKE; method$heard2__ENA; :pipe$enq__ENA;
//METAEXCLUSIVE; method$heard2__ENA; method$heard3__ENA
//METAGUARD; method$heard2; pipe$enq__RDY;
//METAINVOKE; method$heard3__ENA; :pipe$enq__ENA;
//METAGUARD; method$heard3; pipe$enq__RDY;
//METASTART; ___P2MEchoRequest
//METAINVOKE; pipe$enq__ENA; pipe$enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd1:method$say2__ENA;pipe$enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0:method$say__ENA;pipe$enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd2:method$setLeds__ENA;
//METAGUARD; pipe$enq; method$say__RDY && method$say2__RDY && method$setLeds__RDY;
`endif
