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

module pipeFunnelHalf #(parameter funnelWidth = 8, parameter width = 32) ( input CLK, input nRST,
    input                  in$enq__ENA  [funnelWidth - 1:0],        /* array of inputs */
    input  [width-1:0] in$enq$v     [funnelWidth - 1:0],
    output                 in$enq__RDY  [funnelWidth - 1:0],

    output                 out$enq__ENA [(funnelWidth/2) - 1:0], /* merged output */
    output [width-1:0] out$enq$v    [(funnelWidth/2) - 1:0],
    input                  out$enq__RDY [(funnelWidth/2) - 1:0]);

    genvar j;
    for (j = 0; j < funnelWidth / 2; j = j+1) begin
        wire rvalid = in$enq__ENA[j*2+1];
        assign in$enq__RDY[j*2+1] =            out$enq__RDY[j];
        assign in$enq__RDY[j*2]   = !rvalid && out$enq__RDY[j];
        assign out$enq$v   [j]    = rvalid ? in$enq$v[j*2 + 1]: in$enq$v[j*2];
        assign out$enq__ENA[j]    = rvalid | in$enq__ENA[j*2];
    end
endmodule

module FunnelBase #(parameter funnelWidth = 8, parameter width = 32) ( input CLK, input nRST,
    PipeIn in [funnelWidth - 1: 0],
    PipeIn out);

    if (funnelWidth == 1) begin
        assign out.enq$v = in[0].enq$v;
        assign out.enq__ENA = in[0].enq__ENA;
        assign in[0].enq__RDY = out.enq__RDY;
    end
    else begin
    // handle non-power-of-2 funnelWidths
    localparam logWidth = $clog2(funnelWidth);
    localparam localWidth = 2**logWidth;
    wire             localin$enq__ENA[localWidth-1:0];
    wire [width-1:0] localin$enq$v   [localWidth-1:0];
    wire             localin$enq__RDY[localWidth-1:0];
    genvar i;
    for(i = 0; i < localWidth; i = i+1) begin
        if (i < funnelWidth) begin
            assign localin$enq__ENA[i] = in[i].enq__ENA;
            assign localin$enq$v[i] = in[i].enq$v;
            assign in[i].enq__RDY = localin$enq__RDY[i];
    always @( posedge CLK) begin
      if (!nRST) begin end // nRST
      else begin
        if (in[i].enq__ENA && in[i].enq__RDY) begin
            $display( "funnelENQ %d = %x", i, in[i].enq$v);
        end; // End of in.enq__ENA
      end
    end // always @ (posedge CLK)
        end
        else begin
            assign localin$enq__ENA[i] = 0;
            assign localin$enq$v[i] = 0;
        end;
    end;
    localparam depth = $clog2(localWidth) - 1;
    for(i = 0; i <= depth; i = i+1) begin : level
       wire             valid [(localWidth/2**(i+1)) - 1: 0];
       wire [width-1:0] data  [(localWidth/2**(i+1)) - 1: 0];
       wire             ready [(localWidth/2**(i+1)) - 1: 0];
       if (i == 0)
           pipeFunnelHalf #(.funnelWidth(localWidth/2**i), .width(width)) funnel(CLK, nRST,
               localin$enq__ENA, localin$enq$v, localin$enq__RDY, valid, data, ready);
       else
           pipeFunnelHalf #(.funnelWidth(localWidth/2**i), .width(width)) funnel(CLK, nRST,
               level[i-1].valid, level[i-1].data, level[i-1].ready, valid, data, ready);
    end
    assign out.enq$v = level[depth].data[0];
    assign out.enq__ENA = level[depth].valid[0];
    assign level[depth].ready[0] = out.enq__RDY;
    always @( posedge CLK) begin
      if (!nRST) begin end // nRST
      else begin
        if (out.enq__ENA && out.enq__RDY) begin
            $display( "funnelDEQ %x", out.enq$v);
        end;
      end
    end // always @ (posedge CLK)
    end
endmodule
