`include "before1.generated.vh"

`default_nettype none
module EchoRequestInput (input wire CLK, input wire nRST,
    input wire pipe$enq__ENA,
    input wire [191:0]pipe$enq$v,
    output wire pipe$enq__RDY,
    output wire request$say__ENA,
    output wire [31:0]request$say$meth,
    output wire [31:0]request$say$v,
    output wire request$say2__ENA,
    output wire [31:0]request$say2$meth,
    output wire [31:0]request$say2$v,
    input wire request$say2__RDY,
    input wire request$say__RDY);
    wire [31:0]pipe$enq__ENA$v_2e_addr$data$say$meth;
    wire [31:0]pipe$enq__ENA$v_2e_addr$data$say$v;
    wire [31:0]pipe$enq__ENA$v_2e_addr$data$say2$meth;
    wire [31:0]pipe$enq__ENA$v_2e_addr$data$say2$v;
    wire [31:0]pipe$enq__ENA$v_2e_addr$tag;
    assign pipe$enq__RDY = request$say__RDY & request$say2__RDY;
    assign request$say$meth = pipe$enq__ENA$v_2e_addr$data$say$meth;
    assign request$say$v = pipe$enq__ENA$v_2e_addr$data$say$v;
    assign request$say2$meth = pipe$enq__ENA$v_2e_addr$data$say2$meth;
    assign request$say2$v = pipe$enq__ENA$v_2e_addr$data$say2$v;
    assign request$say2__ENA = ( pipe$enq__ENA$v_2e_addr$tag == 32'd2 ) & pipe$enq__ENA;
    assign request$say__ENA = ( pipe$enq__ENA$v_2e_addr$tag == 32'd1 ) & pipe$enq__ENA;

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (pipe$enq__ENA & request$say__RDY & request$say2__RDY) begin // pipe$enq__ENA
            $display( "entered EchoRequestInput::enq tag %d" , pipe$enq__ENA$v_2e_addr$tag );
        end; // End of pipe$enq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
