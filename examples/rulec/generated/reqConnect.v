`include "rulec.generated.vh"

module reqConnect (input CLK, input nRST,
    input wad$enq__ENA,
    input [127:0]wad$enq$v,
    input [15:0]wad$enq$length,
    output wad$enq__RDY,
    output request$enq__ENA,
    output [127:0]request$enq$v,
    input request$enq__RDY);
    wire CLK, nRST;
    assign request$enq$v = wad$enq$v ;
    assign request$enq__ENA = wad$enq__ENA ;
    assign wad$enq__RDY = request$enq__RDY ;

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (wad$enq__ENA) begin
            $display( "reqConnect.enq v %llx len %lx" , wad$enq$v , wad$enq$len );
        end; // End of wad$enq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

