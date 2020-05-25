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

module pipeFunnelHalf #(parameter funnelWidth = 8, parameter dataWidth = 32) ( input CLK, input nRST,
    input input$enq__ENA [funnelWidth-1:0],        /* array of inputs */
    input [funnelWidth * dataWidth-1:0] input$enq$v,
    output  input$enq__RDY [funnelWidth-1: 0],
    output output$enq__ENA [funnelWidth/2 - 1: 0], /* merged output */
    output [(funnelWidth /2) * dataWidth-1:0] output$enq$v,
    input output$enq__RDY [funnelWidth/2 - 1: 0]);

    genvar j;
    for (j = 0; j < funnelWidth / 2; j = j+1) begin
        wire rvalid = input$enq__ENA[j*2+1];
        assign input$enq__RDY[j*2+1] = output$enq__RDY[j];
        assign input$enq__RDY[j*2] = !rvalid && output$enq__RDY[j];
        assign output$enq$v[dataWidth * (j + 1) - 1: dataWidth * j] =
            rvalid ? input$enq$v[dataWidth * (j*2 + 2) - 1: dataWidth * (j*2 + 1)]:
                     input$enq$v[dataWidth * (j*2 + 1) - 1: dataWidth * j*2];
        assign output$enq__ENA[j] = rvalid | input$enq__ENA[j*2];
    end
endmodule

module FunnelBase #(parameter funnelWidth = 8, parameter dataWidth = 32) ( input CLK, input nRST,
    input input$enq__ENA[funnelWidth-1:0], /* array of inputs */
    input [funnelWidth * dataWidth-1:0] input$enq$v,
    output input$enq__RDY[funnelWidth-1: 0],
    output output$enq__ENA,                /* merged output */
    output [dataWidth-1:0] output$enq$v,
    input output$enq__RDY);

    genvar i;
    localparam depth = $clog2(funnelWidth) - 1;
    for(i = 0; i <= depth; i = i+1) begin : level
       wire valid [funnelWidth/2**(i+1) - 1: 0];
       wire [funnelWidth/2**(i+1) * dataWidth-1:0] data;
       wire ready [funnelWidth/2**(i+1) - 1: 0];
       if (i == 0)
       pipeFunnelHalf #(funnelWidth/2**i, dataWidth) funnel(CLK, nRST,
           input$enq__ENA, input$enq$v, input$enq__RDY, valid, data, ready);
       else
       pipeFunnelHalf #(funnelWidth/2**i, dataWidth) funnel(CLK, nRST,
           level[i-1].valid, level[i-1].data, level[i-1].ready, valid, data, ready);
    end
    assign output$enq$v = level[depth].data[dataWidth - 1: 0];
    assign output$enq__ENA = level[depth].valid[0];
    assign level[depth].ready[0] = output$enq__RDY;
endmodule
