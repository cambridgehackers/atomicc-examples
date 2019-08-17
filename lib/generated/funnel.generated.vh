`ifndef __funnel_GENERATED__VH__
`define __funnel_GENERATED__VH__

//METASTART; FunnelBase
//METAEXTERNAL; output; FunnelBase$output;
//METAINTERNAL; level0; FunnelHalfBase(funnelWidth=8,dataWidth=32);
//METAGUARD; RULE$connRule; 1;
//METARULES; RULE$connRule
//METACONNECT; input$enq__ENA; level[ 0 ] level $input$enq__ENA
//METACONNECT; input$enq__RDY; level[ 0 ] level $input$enq__RDY
//METACONNECT; output$enq__ENA; level[ __builtin_clog2( 8 ) - 1 ] level $output level [ 0 ]$enq__ENA
//METACONNECT; output$enq__RDY; level[ __builtin_clog2( 8 ) - 1 ] level $output level [ 0 ]$enq__RDY
//METASTART; FunnelHalfBase
//METAEXTERNAL; output; FunnelHalfBase$output;
//METAGUARD; input$enq; ( input$enq__ENA[ ( __inst$Genvar1 * 2 ) + 1 ] == 0 ) && output$enq__RDY[ __inst$Genvar1 ];
//METAGUARD; input$enq; input$enq__ENA[ ( __inst$Genvar1 * 2 ) + 1 ] == 0;
`endif
