`include "funnel.generated.vh"

`default_nettype none
module FunnelHalfBase #(
    parameter integer funnelWidth = 8,
    parameter integer dataWidth = 32)(
    input wire CLK, input wire nRST,
    input wire input$enq__ENA[funnelWidth - 1:0],
    input wire [funnelWidth * dataWidth - 1:0]input$enq$v,
    output wire input$enq__RDY[funnelWidth - 1:0],
    output wire output$enq__ENA[funnelWidth / 2 - 1:0],
    output wire [funnelWidth / 2 * dataWidth - 1:0]output$enq$v,
    input wire output$enq__RDY[funnelWidth / 2 - 1:0]);
    genvar __inst$Genvar1;
for(__inst$Genvar1 = 0; __inst$Genvar1 < ( funnelWidth / 2 ); __inst$Genvar1 = __inst$Genvar1 + 1) begin
        assign input$enq__RDY[__inst$Genvar1 * 2] = ( input$enq__ENA[ ( __inst$Genvar1 * 2 ) + 1 ] == 0 ) && output$enq__RDY[ __inst$Genvar1 ];
        assign output$enq$v[__inst$Genvar1] = ( ( input$enq__ENA[ ( __inst$Genvar1 * 2 ) + 1 ] && input$enq__RDY[ ( __inst$Genvar1 * 2 ) + 1 ] ) ? input$enq$v[ ( ( ( dataWidth * ( ( __inst$Genvar1 * 2 ) + 1 + 1 ) ) - 1 ) : ( dataWidth * ( ( __inst$Genvar1 * 2 ) + 1 ) ) ) ] : 0 ) | ( ( input$enq__ENA[ __inst$Genvar1 * 2 ] && input$enq__RDY[ __inst$Genvar1 * 2 ] ) ? input$enq$v[ ( ( ( dataWidth * ( ( __inst$Genvar1 * 2 ) + 1 ) ) - 1 ) : ( dataWidth * __inst$Genvar1 * 2 ) ) ] : 0 );
        assign output$enq__ENA[__inst$Genvar1] = ( input$enq__ENA[ ( __inst$Genvar1 * 2 ) + 1 ] && ( input$enq__RDY[ ( __inst$Genvar1 * 2 ) + 1 ] || ( input$enq__ENA[ __inst$Genvar1 * 2 ] && input$enq__RDY[ __inst$Genvar1 * 2 ] ) ) ) || ( ( !input$enq__ENA[ ( __inst$Genvar1 * 2 ) + 1 ] ) && input$enq__ENA[ __inst$Genvar1 * 2 ] && input$enq__RDY[ __inst$Genvar1 * 2 ] );
    end;
endmodule 

`default_nettype wire    // set back to default value
