`include "before1.generated.vh"

`default_nettype none
module EchoIndicationOutput (input wire CLK, input wire nRST,
    input wire indication$heard__ENA,
    input wire [31:0]indication$heard$meth,
    input wire [31:0]indication$heard$v,
    output wire indication$heard__RDY,
    output wire pipe$enq__ENA,
    output wire [95:0]pipe$enq$v,
    input wire pipe$enq__RDY);
    reg even;
    reg [31:0]ind0$data$heard$meth;
    reg [31:0]ind0$data$heard$v;
    reg [31:0]ind0$tag;
    reg [31:0]ind1$data$heard$meth;
    reg [31:0]ind1$data$heard$v;
    reg [31:0]ind1$tag;
    reg ind_busy;
    wire RULEoutput_rulee__ENA;
    wire RULEoutput_rulee__RDY;
    wire RULEoutput_ruleo__ENA;
    wire RULEoutput_ruleo__RDY;
    assign RULEoutput_rulee__ENA = ( ( ind_busy & even ) != 0 ) & pipe$enq__RDY;
    assign RULEoutput_ruleo__ENA = ( ( ind_busy & ( !even ) ) != 0 ) & pipe$enq__RDY;
    assign indication$heard__RDY = !ind_busy;
    assign pipe$enq$v = ( ( ( ind_busy & even ) != 0 ) & pipe$enq__RDY ) ? { ind0$data$heard$v , ind0$data$heard$meth , ind0$tag } : { ind1$data$heard$v , ind1$data$heard$meth , ind1$tag };
    assign pipe$enq__ENA = ( ( ind_busy & even ) != 0 ) || ( ( ind_busy & ( !even ) ) != 0 );
    // Extra assigments, not to output wires
    assign RULEoutput_rulee__RDY = ( ( ind_busy & even ) != 0 ) & pipe$enq__RDY;
    assign RULEoutput_ruleo__RDY = ( ( ind_busy & ( !even ) ) != 0 ) & pipe$enq__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
        even <= 0;
        ind0$data$heard$meth <= 0;
        ind0$data$heard$v <= 0;
        ind0$tag <= 0;
        ind1$data$heard$meth <= 0;
        ind1$data$heard$v <= 0;
        ind1$tag <= 0;
        ind_busy <= 0;
      end // nRST
      else begin
        if (RULEoutput_rulee__ENA & ( ( ind_busy & even ) != 0 ) & pipe$enq__RDY) begin
            ind_busy <= 0;
        end; // End of RULEoutput_rulee__ENA
        if (RULEoutput_ruleo__ENA & ( ( ind_busy & ( !even ) ) != 0 ) & pipe$enq__RDY) begin
            ind_busy <= 0;
        end; // End of RULEoutput_ruleo__ENA
        if (indication$heard__ENA & indication$heard__RDY) begin
            ind_busy <= 1;
            even <= even ^ 1;
            $display( "[%s:%d]EchoIndicationOutput even %d" , "indication$heard" , 114 , even );
            if (even) begin
            ind1$tag <= 1;
            ind1$data$heard$meth <= indication$heard$meth;
            ind1$data$heard$v <= indication$heard$v;
            end;
            if (even ^ 1) begin
            ind0$tag <= 1;
            ind0$data$heard$meth <= indication$heard$meth;
            ind0$data$heard$v <= indication$heard$v;
            end;
        end; // End of indication$heard__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
