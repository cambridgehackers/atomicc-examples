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

module pipeFunnelHalf #(parameter funnelWidth = 8, parameter dataWidth = 32)
     /* array of inputs */
    (input  input__ENA [funnelWidth-1:0],
     input  [dataWidth-1:0] input_v [funnelWidth-1:0],
     output  input__RDY [funnelWidth-1: 0], 
     /* merged output */
     output output__ENA [funnelWidth/2 - 1: 0],
     output [dataWidth-1:0] output_v [funnelWidth/2 - 1: 0],
     input output__RDY [funnelWidth/2 - 1: 0]);

    genvar j;
    for (j = 0; j < funnelWidth / 2; j = j+1) begin
        wire rvalid = input__ENA[j*2+1];
        wire lvalid = input__ENA[j*2];
        assign input__RDY[j*2+1] = rvalid && output__RDY[j];
        assign input__RDY[j*2] = lvalid && !rvalid && output__RDY[j];
        assign output_v[j] = rvalid ? input_v[j*2+ 1]: input_v[j*2];
        assign output__ENA[j] = rvalid | lvalid;
    end
endmodule
//////////////////
module FunnelBase #(parameter funnelWidth = 8, parameter dataWidth = 32)
     /* array of inputs */
    (input  input__ENA [funnelWidth-1:0],
     input  [dataWidth-1:0] input_v [funnelWidth-1:0],
     output  input__RDY [funnelWidth-1: 0], 
     /* merged output */
     output output__ENA,
     output [dataWidth-1:0] output_v,
     input output__RDY);

    genvar i,j;
    localparam depth = $clog2(funnelWidth) - 1;
    for(i = 0; i <= depth; i = i+1) begin : level
       wire valid [funnelWidth/2**(i+1) - 1: 0];
       wire [dataWidth-1:0] data [funnelWidth/2**(i+1) - 1: 0];
       wire ready [funnelWidth/2**(i+1) - 1: 0];
       if (i == 0)
       pipeFunnelHalf #(funnelWidth/2**i, dataWidth) funnel(
           input__ENA, input_v, input__RDY, valid, data, ready);
       else
       pipeFunnelHalf #(funnelWidth/2**i, dataWidth) funnel(
           level[i-1].valid, level[i-1].data, level[i-1].ready, valid, data, ready);
    end
    assign output_v = level[depth].data;
    assign output__ENA = level[depth].valid;
    assign level[depth].ready = output__RDY;
endmodule
