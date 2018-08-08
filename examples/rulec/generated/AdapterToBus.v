`include "rulec.generated.vh"

`default_nettype none
module AdapterToBus (input wire CLK, input wire nRST,
    input wire in$enq__ENA,
    input wire [127:0]in$enq$v,
    input wire [15:0]in$enq$length,
    output wire in$enq__RDY,
    output wire out$enq__ENA,
    output wire [31:0]out$enq$v,
    output wire [15:0]out$enq$length,
    input wire out$enq__RDY);
    reg [127:0]buffer;
    reg [15:0]remain;
    assign in$enq__RDY = remain == 16'd0;
    assign out$enq$length = remain;
    assign out$enq$v = buffer;
    assign out$enq__ENA = remain != 16'd0;

    always @( posedge CLK) begin
      if (!nRST) begin
        buffer <= 0;
        remain <= 0;
      end // nRST
      else begin
        if (( remain != 16'd0 ) & out$enq__RDY) begin // RULEcopyRule__ENA
            remain <= remain + ( -1 );
            buffer <= buffer >> 32;
        end; // End of RULEcopyRule__ENA
        if (in$enq__ENA & ( remain == 16'd0 )) begin // in$enq__ENA
            buffer <= in$enq$v;
            remain <= in$enq$length + 1;
        end; // End of in$enq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
