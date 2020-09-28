`include "before1.generated.vh"

`default_nettype none
module EchoIndicationOutput (input wire CLK, input wire nRST,
    EchoIndication.server indication,
    PipeIn.client pipe);
    reg even;
    EchoIndication_data ind0;
    EchoIndication_data ind1;
    reg ind_busy;
    logic RULE$output_rulee__ENA;
    logic RULE$output_rulee__RDY;
    logic RULE$output_ruleo__ENA;
    logic RULE$output_ruleo__RDY;
    // Extra assigments, not to output wires
    assign RULE$output_rulee__ENA = !( ( ( ( ind_busy != 0 ) & ( even != 0 ) ) == 0 ) || ( !pipe.enq__RDY ) );
    assign RULE$output_rulee__RDY = !( ( ( ( ind_busy != 0 ) & ( even != 0 ) ) == 0 ) || ( !pipe.enq__RDY ) );
    assign RULE$output_ruleo__ENA = !( ( ( ( ind_busy != 0 ) & ( even == 0 ) ) == 0 ) || ( !pipe.enq__RDY ) );
    assign RULE$output_ruleo__RDY = !( ( ( ( ind_busy != 0 ) & ( even == 0 ) ) == 0 ) || ( !pipe.enq__RDY ) );
    assign indication.heard__RDY = !( 0 == ( ind_busy ^ 1 ) );
    assign pipe.enq__ENA = ( !( ( ( ind_busy != 0 ) & ( even != 0 ) ) == 0 ) ) | ( !( ( ( ind_busy != 0 ) & ( even == 0 ) ) == 0 ) );
    always_comb begin
    pipe.enq$v = 0;
    unique case(1'b1)
    !( ( ( ind_busy != 0 ) & ( even != 0 ) ) == 0 ): pipe.enq$v = ind0;
    !( ( ( ind_busy != 0 ) & ( even == 0 ) ) == 0 ): pipe.enq$v = ind1;
    endcase
    end

    always @( posedge CLK) begin
      if (!nRST) begin
        even <= 0;
        ind0 <= 0;
        ind1 <= 0;
        ind_busy <= 0;
      end // nRST
      else begin
        if (RULE$output_rulee__ENA && RULE$output_rulee__RDY) begin // RULE$output_rulee__ENA
            ind_busy <= 0 != 0;
        end; // End of RULE$output_rulee__ENA
        if (RULE$output_ruleo__ENA && RULE$output_ruleo__RDY) begin // RULE$output_ruleo__ENA
            ind_busy <= 0 != 0;
        end; // End of RULE$output_ruleo__ENA
        if (indication.heard__ENA && indication.heard__RDY) begin // indication.heard__ENA
            ind_busy <= 1 != 0;
            even <= even ^ 1;
            $display( "[%s:%d]EchoIndicationOutput even %d" , "indication$heard" , 127 , even );
            if (!even) begin
            ind0.tag <= 1;
            ind0.data$heard$meth <= indication.heard$meth;
            ind0.data$heard$v <= indication.heard$v;
            end;
            if (even) begin
            ind1.tag <= 1;
            ind1.data$heard$meth <= indication.heard$meth;
            ind1.data$heard$v <= indication.heard$v;
            end;
        end; // End of indication.heard__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
