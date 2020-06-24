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

module pipeFunnelHalf #(parameter funnelWidth = 8, parameter dataWidth = 32) ( in CLK, in nRST,
    in in$enq__ENA [funnelWidth-1:0],        /* array of inputs */
    in [funnelWidth * dataWidth-1:0] in$enq$v,
    out  in$enq__RDY [funnelWidth-1: 0],
    out out$enq__ENA [funnelWidth/2 - 1: 0], /* merged output */
    out [(funnelWidth /2) * dataWidth-1:0] out$enq$v,
    in out$enq__RDY [funnelWidth/2 - 1: 0]);

    genvar j;
    for (j = 0; j < funnelWidth / 2; j = j+1) begin
        wire rvalid = in$enq__ENA[j*2+1];
        assign in$enq__RDY[j*2+1] = out$enq__RDY[j];
        assign in$enq__RDY[j*2] = !rvalid && out$enq__RDY[j];
        assign out$enq$v[dataWidth * (j + 1) - 1: dataWidth * j] =
            rvalid ? in$enq$v[dataWidth * (j*2 + 2) - 1: dataWidth * (j*2 + 1)]:
                     in$enq$v[dataWidth * (j*2 + 1) - 1: dataWidth * j*2];
        assign out$enq__ENA[j] = rvalid | in$enq__ENA[j*2];
    end
endmodule

module FunnelBase #(parameter funnelWidth = 8, parameter dataWidth = 32) ( in CLK, in nRST,
    in in$enq__ENA[funnelWidth-1:0], /* array of inputs */
    in [funnelWidth * dataWidth-1:0] in$enq$v,
    out in$enq__RDY[funnelWidth-1: 0],
    out out$enq__ENA,                /* merged output */
    out [dataWidth-1:0] out$enq$v,
    in out$enq__RDY);

    genvar i;
    localparam depth = $clog2(funnelWidth) - 1;
    for(i = 0; i <= depth; i = i+1) begin : level
       wire valid [funnelWidth/2**(i+1) - 1: 0];
       wire [funnelWidth/2**(i+1) * dataWidth-1:0] data;
       wire ready [funnelWidth/2**(i+1) - 1: 0];
       if (i == 0)
       pipeFunnelHalf #(funnelWidth/2**i, dataWidth) funnel(CLK, nRST,
           in$enq__ENA, in$enq$v, in$enq__RDY, valid, data, ready);
       else
       pipeFunnelHalf #(funnelWidth/2**i, dataWidth) funnel(CLK, nRST,
           level[i-1].valid, level[i-1].data, level[i-1].ready, valid, data, ready);
    end
    assign out$enq$v = level[depth].data[dataWidth - 1: 0];
    assign out$enq__ENA = level[depth].valid[0];
    assign level[depth].ready[0] = out$enq__RDY;
endmodule
