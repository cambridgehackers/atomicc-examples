`include "funnel.generated.vh"

`default_nettype none
module FunnelHalfBase #(
    parameter integer funnelWidth = 10,
    parameter integer dataWidth = 32)(
    input wire CLK, input wire nRST,
    input wire input$enq__ENA,
    input wire [dataWidth - 1:0]input$enq$v,
    output wire input$enq__RDY,
    output wire output$enq__ENA,
    output wire [dataWidth - 1:0]output$enq$v,
    input wire output$enq__RDY);
    assign input$enq__RDY = 1;
    assign output$enq$v = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign output$enq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
endmodule 

`default_nettype wire    // set back to default value
