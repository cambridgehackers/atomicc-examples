`ifndef __funnel_GENERATED__VH__
`define __funnel_GENERATED__VH__

//METASTART; FunnelBase
//METAEXTERNAL; output; FunnelBase$output;
//METAINTERNAL; level0; FunnelHalfBase(funnelWidth=8,dataWidth=32);
//METAGUARD; RULE$connRule; 1;
//METARULES; RULE$connRule
//METACONNECT; level[0].input$enq__ENA; input$enq__ENA
//METACONNECT; level[0].input$enq__RDY; input$enq__RDY
//METACONNECT; RULE$connRule$tmp$enq__ENA; level[0].input$enq__ENA
//METACONNECT; RULE$connRule$tmp$enq__RDY; level[0].input$enq__RDY
//METACONNECT; output$enq__ENA; level[4 - 1].output[ 0 ]$enq__ENA
//METACONNECT; output$enq__RDY; level[4 - 1].output[ 0 ]$enq__RDY
//METACONNECT; level[RULE$connRule$j - 1].output[ __inst$Genvar1 ]$enq__ENA; level[RULE$connRule$j].input[ __inst$Genvar1 ]$enq__ENA
//METACONNECT; level[RULE$connRule$j - 1].output[ __inst$Genvar1 ]$enq__RDY; level[RULE$connRule$j].input[ __inst$Genvar1 ]$enq__RDY
//METASTART; FunnelHalfBase
//METAEXTERNAL; output; FunnelHalfBase$output;
//METAGUARD; input$enq; ( input$enq__ENA[ ( __inst$Genvar1 * 2 ) + 1 ] == 0 ) && output$enq__RDY[ __inst$Genvar1 ];
//METAGUARD; input$enq; input$enq__ENA[ ( __inst$Genvar1 * 2 ) + 1 ] == 0;
`endif
