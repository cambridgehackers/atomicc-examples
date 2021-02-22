`include "atomicc.generated.vh"
`default_nettype none
module HdmiPattern #(
    parameter integer widthAddr = 12,
    parameter integer heightAddr = 12)(
    input wire CLK, input wire nRST,
    input wire setup__ENA,
    input wire [widthAddr - 1:0]setup$aactivePixels,
    input wire [heightAddr - 1:0]setup$aactiveLines,
    input wire [8 - 1:0]setup$apattern,
    input wire [20 - 1:0]setup$arampStep,
    output wire setup__RDY,
    output wire [36 - 1:0]data,
    output wire data__RDY,
    HdmiDataIfc.server calculate);
    reg [widthAddr - 1:0]activeLines;
    reg [widthAddr - 1:0]activePixels;
    reg [8 - 1:0]pattern;
    reg [36 - 1:0]pixelValue;
    reg [20 - 1:0]rampStep;
    reg [20 - 1:0]rampValue;
    logic [8 - 1:0]_calculate$setXY$b_out;
    logic [8 - 1:0]_calculate$setXY$g_out;
    logic [8 - 1:0]_calculate$setXY$r_out;
    logic [4 - 1:0]_calculate$setXY$zero;
    assign data = pixelValue;
    assign data__RDY = 1'd1;
    assign setup__RDY = 1'd1;
    // Extra assigments, not to output wires
    assign _calculate$setXY$b_out = _calculate$setXY$r_out;
    assign _calculate$setXY$g_out = _calculate$setXY$r_out;
    assign _calculate$setXY$zero = 4'd0;
    assign calculate.setXY__RDY = 1'd1;
    always_comb begin
    _calculate$setXY$r_out = 0;
    unique case(1'b1)
    ( ( calculate.setXY$y == 0 ) && calculate.setXY$dataEnable && ( pattern == 1 ) ) || ( ( calculate.setXY$y != 0 ) && calculate.setXY$dataEnable && ( pattern == 1 ) && ( ( calculate.setXY$x == 0 ) || ( calculate.setXY$x == activePixels ) || ( calculate.setXY$y == activeLines ) ) ): _calculate$setXY$r_out = 8'd255;
    ( ( !calculate.setXY$dataEnable ) || ( ( calculate.setXY$y != activeLines ) && ( calculate.setXY$x != activePixels ) && ( calculate.setXY$x != 0 ) && ( calculate.setXY$y != 0 ) && ( pattern == 1 ) ) ) && ( calculate.setXY$dataEnable || ( pattern == 1 ) ): _calculate$setXY$r_out = 8'd0;
    ( ( calculate.setXY$x & 1 ) != 0 ) && ( pattern != 1 ) && ( pattern == 2 ) && calculate.setXY$dataEnable: _calculate$setXY$r_out = 8'd255;
    ( ( !calculate.setXY$dataEnable ) || ( ( pattern != 1 ) && ( ( calculate.setXY$x & 1 ) == 0 ) && ( pattern == 2 ) ) ) && ( calculate.setXY$dataEnable || ( ( pattern != 1 ) && ( pattern == 2 ) ) ): _calculate$setXY$r_out = 8'd0;
    ( ( calculate.setXY$y & 1 ) != 0 ) && ( pattern != 2 ) && ( pattern != 1 ) && ( pattern == 3 ) && calculate.setXY$dataEnable: _calculate$setXY$r_out = 8'd255;
    ( ( !calculate.setXY$dataEnable ) || ( ( pattern != 2 ) && ( pattern != 1 ) && ( ( calculate.setXY$y & 1 ) == 0 ) && ( pattern == 3 ) ) ) && ( calculate.setXY$dataEnable || ( ( pattern != 2 ) && ( pattern != 1 ) && ( pattern == 3 ) ) ): _calculate$setXY$r_out = 8'd0;
    ( pattern != 3 ) && ( pattern != 2 ) && ( pattern != 1 ) && ( pattern == 4 ): _calculate$setXY$r_out = rampValue[ ( ( 8 + widthAddr ) - 1 ) : widthAddr ];
    ( pattern != 4 ) && ( pattern != 3 ) && ( pattern != 2 ) && ( pattern != 1 ): _calculate$setXY$r_out = 8'd0;
    default:;
    endcase
    end

    always @( posedge CLK) begin
      if (!nRST) begin
        activeLines <= 0;
        activePixels <= 0;
        pattern <= 0;
        pixelValue <= 0;
        rampStep <= 0;
        rampValue <= 0;
      end // nRST
      else begin
        if (calculate.setXY__ENA) begin // calculate.setXY__ENA
            pixelValue <= { _calculate$setXY$r_out , _calculate$setXY$zero , _calculate$setXY$g_out , _calculate$setXY$zero , _calculate$setXY$b_out , _calculate$setXY$zero };
            if (( calculate.setXY$x != activePixels ) && ( pattern != 3 ) && ( pattern != 2 ) && ( pattern != 1 ) && ( pattern == 4 ) && calculate.setXY$dataEnable)
            rampValue <= rampValue + rampStep;
            if (( pattern != 3 ) && ( pattern != 2 ) && ( pattern != 1 ) && ( pattern == 4 ) && ( calculate.setXY$x == activePixels ) && calculate.setXY$dataEnable)
            rampValue <= 20'd0;
        end; // End of calculate.setXY__ENA
        if (setup__ENA) begin // setup__ENA
            activePixels <= setup$aactivePixels;
            activeLines <= setup$aactiveLines;
            pattern <= setup$apattern;
            rampStep <= setup$arampStep;
        end; // End of setup__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
