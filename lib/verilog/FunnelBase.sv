// Copyright (c) 2019 The Connectal Project

// Permission is hereby granted, free of charge, to any person
// obtaining a copy of this software and associated documentation
// files (the "Software"), to deal in the Software without
// restriction, including without limitation the rights to use, copy,
// modify, merge, publish, distribute, sublicense, and/or sell copies
// of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
// BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
// ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

module pipeFunnelHalf #(parameter funnelWidth = 8, parameter dataWidth = 32) (
     /* array of inputs */
    input CLK, input nRST,
    input  input$enq__ENA [funnelWidth-1:0],
    input  [dataWidth-1:0] input$enq$v [funnelWidth-1:0],
    output  input$enq__RDY [funnelWidth-1: 0],
    /* merged output */
    output output$enq__ENA [funnelWidth/2 - 1: 0],
    output [dataWidth-1:0] output$enq$v [funnelWidth/2 - 1: 0],
    input output$enq__RDY [funnelWidth/2 - 1: 0]);

    genvar j;
    for (j = 0; j < funnelWidth / 2; j = j+1) begin
        wire rvalid = input$enq__ENA[j*2+1];
        assign input$enq__RDY[j*2+1] = output$enq__RDY[j];
        assign input$enq__RDY[j*2] = !rvalid && output$enq__RDY[j];
        assign output$enq$v[j] = rvalid ? input$enq$v[j*2+ 1]: input$enq$v[j*2];
        assign output$enq__ENA[j] = rvalid | input$enq__ENA[j*2];
    end
endmodule
//////////////////
module FunnelBase #(parameter funnelWidth = 8, parameter dataWidth = 32) (
     /* array of inputs */
    input CLK, input nRST,
    input [funnelWidth-1:0]input$enq__ENA,
    input [dataWidth*funnelWidth-1:0] input$enq$v,
    output [funnelWidth-1: 0]input$enq__RDY,
    /* merged output */
    output output$enq__ENA,
    output [dataWidth-1:0] output$enq$v,
    input output$enq__RDY);

    genvar i,j;
    localparam depth = $clog2(funnelWidth) - 1;
    for(i = 0; i <= depth; i = i+1) begin : level
       wire valid [funnelWidth/2**(i+1) - 1: 0];
       wire [dataWidth-1:0] data [funnelWidth/2**(i+1) - 1: 0];
       wire ready [funnelWidth/2**(i+1) - 1: 0];
       wire temp$enq__ENA [funnelWidth-1:0];
       wire [dataWidth-1:0] temp$enq$v [funnelWidth-1:0];
       wire temp$enq__RDY [funnelWidth-1: 0];
       for(j = 0; j < funnelWidth; j = j + 1) begin
           assign temp$enq__ENA[j] = input$enq__ENA[j];
           assign temp$enq$v[j] = input$enq$v[(j+1) * dataWidth - 1: j * dataWidth];
           assign temp$enq__RDY[j] = input$enq__RDY[j];
       end;
       if (i == 0)
       pipeFunnelHalf #(funnelWidth/2**i, dataWidth) funnel(CLK, nRST,
           temp$enq__ENA, temp$enq$v, temp$enq__RDY, valid, data, ready);
       else
       pipeFunnelHalf #(funnelWidth/2**i, dataWidth) funnel(CLK, nRST,
           level[i-1].valid, level[i-1].data, level[i-1].ready, valid, data, ready);
    end
    assign output$enq$v = level[depth].data[0];
    assign output$enq__ENA = level[depth].valid[0];
    assign level[depth].ready[0] = output$enq__RDY;
endmodule
