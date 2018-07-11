`include "rulec.generated.vh"

module AdapterToBus (input CLK, input nRST,
    input in$enq__ENA,
    input [127:0]in$enq$v,
    input [15:0]in$enq$length,
    output in$enq__RDY,
    output out$enq__ENA,
    output [31:0]out$enq$v,
    output out$enq$last,
    input out$enq__RDY);
    wire CLK, nRST;
    reg [127:0]buffer;
    reg [15:0]remain;
    wire copyRule__ENA;
    assign copyRule__ENA = ( remain  != 16'd0 ) & out$enq__RDY ;
    assign in$enq__RDY = remain  == 16'd0;
    assign out$enq$last = remain  == 16'd1;
    assign out$enq$v = buffer ;
    assign out$enq__ENA = ( remain  != 16'd0 ) & ( remain  != 16'd0 );

    always @( posedge CLK) begin
      if (!nRST) begin
        buffer <= 0;
        remain <= 0;
      end // nRST
      else begin
        if (copyRule__ENA & ( remain != 16'd0 ) & out$enq__RDY) begin
            remain  <= remain + ( -1 );
            buffer  <= buffer >> 32;
        end; // End of copyRule__ENA
        if (in$enq__ENA & in$enq__RDY) begin
            buffer  <= in$enq$v;
            remain  <= in$enq$length + 1;
        end; // End of in$enq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

