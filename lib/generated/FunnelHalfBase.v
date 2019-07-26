`include "funnel.generated.vh"

`default_nettype none
module FunnelHalfBase #(
    parameter integer funnelWidth = 10,
    parameter integer dataWidth = 32)(
    input wire CLK, input wire nRST,
    input wire input$enq__ENA[10 - 1:0],
    input wire [10 * dataWidth - 1:0]input$enq$v,
    output wire input$enq__RDY[10 - 1:0],
    output wire output$enq__ENA[5 - 1:0],
    output wire [5 * dataWidth - 1:0]output$enq$v,
    input wire output$enq__RDY[5 - 1:0]);
    genvar __inst$Genvar1;
for(__inst$Genvar1 = 0; __inst$Genvar1 < funnelWidth; __inst$Genvar1 = __inst$Genvar1 + 1) begin
        assign input$enq__RDY[__inst$Genvar1] = ( ( ( ( __inst$Genvar1 + 1 ) / 2 ) == ( __inst$Genvar1 / 2 ) ) && ( output[ __inst$Genvar1 ] . enq__RDY ) ) || ( ( !( ( ( __inst$Genvar1 + 1 ) / 2 ) == ( __inst$Genvar1 / 2 ) ) ) && ( output[ __inst$Genvar1 ] . enq__RDY ) && ( enq__ENA == 0 ) );
        assign output$enq$v[__inst$Genvar1] = input$enq$v;
        assign output$enq__ENA[__inst$Genvar1] = input$enq__ENA[ __inst$Genvar1 ] && input$enq__RDY[ __inst$Genvar1 ];
    end;
endmodule 

`default_nettype wire    // set back to default value
