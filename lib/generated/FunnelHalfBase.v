`include "funnel.generated.vh"

`default_nettype none
module FunnelHalfBase #(
    parameter integer funnelWidth = 10,
    parameter integer dataWidth = 32)(
    input wire CLK, input wire nRST,
    input wire input$enq__ENA,
    input wire [dataWidth - 1:0]input$enq$v,
    output wire input$enq__RDY);
    reg [dataWidth - 1:0]i;
    reg [dataWidth - 1:0]k;
    reg [8 - 1:0]output [5 - 1:0];
    assign input$enq__RDY = 1;

    always @( posedge CLK) begin
      if (!nRST) begin
        i <= 0;
        k <= 0;
      end // nRST
      else begin
        if (input$enq__ENA) begin // input$enq__ENA
            i <= input$enq$v;
        end; // End of input$enq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
