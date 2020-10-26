// Copyright (c) 2020 The Connectal Project

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

module SelectIndex#(parameter width=32, parameter funnelWidth=4)(
    output [width-1:0] out,
    input [width-1: 0] in[funnelWidth - 1: 0],
    input [$clog2(funnelWidth) - 1:0]index);

    function [width-1:0] encode;
        input [width-1: 0] in[funnelWidth - 1: 0];
        input [$clog2(funnelWidth) - 1:0]index;

        integer i;
        begin : _encode
            encode = width'(0);
            for (i = 0; i < funnelWidth; i = i + 1)
                if (i == index) begin
                    encode = in[i];
                    disable _encode;
                end
        end
    endfunction

    assign out = encode(in, index);
endmodule

