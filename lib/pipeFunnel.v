// Copyright (c) 2018 The Connectal Project

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

module pipeFunnel #(parameter funnelWidth = 8, parameter dataWidth = 32)
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
        for (j = 0; j < funnelWidth / 2 ** (i+1); j = j+1) begin : node
            wire [dataWidth-1:0] data;
            wire valid, rvalid, lvalid, ready;
            if (i==0) begin
                assign rvalid = (j * 2 + 1 < funnelWidth) ? input__ENA[j*2+1] : 0;
                assign lvalid = (j * 2 < funnelWidth) ? input__ENA[j*2] : 0;
                if (j * 2 + 1 < funnelWidth)
                    assign input__RDY[j*2+1] = rvalid && ready;
                if (j * 2 < funnelWidth)
                    assign input__RDY[j*2] = lvalid && !rvalid && ready;
                assign data = rvalid ?  ((j * 2 + 1 < funnelWidth) ? input_v[j * 2 + 1] : 0)
                    : ((j * 2 < funnelWidth) ? input_v[j * 2] : 0);
            end
            else begin
                assign rvalid = level[i-1].node[j*2+1].valid;
                assign lvalid = level[i-1].node[j*2].valid;
                assign level[i-1].node[j*2+1].ready = rvalid && ready;
                assign level[i-1].node[j*2].ready = lvalid && !rvalid && ready;
                assign data = rvalid ? level[i-1].node[j*2+ 1].data : level[i-1].node[j*2].data;
            end
            assign valid = rvalid | lvalid;
        end
    end
    assign output_v = level[depth].node[0].data;
    assign output__ENA = level[depth].node[0].valid;
    assign level[depth].node[0].ready = output__RDY;
endmodule
