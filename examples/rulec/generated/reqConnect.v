`include "rulec.generated.vh"

`default_nettype none
module reqConnect (input wire CLK, input wire nRST,
    input wire wad$enq__ENA,
    input wire [127:0]wad$enq$v,
    input wire [15:0]wad$enq$length,
    output wire wad$enq__RDY,
    output wire request$enq__ENA,
    output wire [127:0]request$enq$v,
    input wire request$enq__RDY);
    assign request$enq$v = wad$enq$v ;
    assign request$enq__ENA = wad$enq__ENA ;
    assign wad$enq__RDY = request$enq__RDY ;

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (wad$enq__ENA & wad$enq__RDY) begin
            $display( "reqConnect.enq v %llx length %lx" , wad$enq$v , wad$enq$length );
        end; // End of wad$enq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
