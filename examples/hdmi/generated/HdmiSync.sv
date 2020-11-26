`include "hdmi.generated.vh"

`default_nettype none
module HdmiSync #(
    parameter integer widthAddr = 12,
    parameter integer heightAddr = 12)(
    input wire CLK, input wire nRST,
    output wire dataEnable,
    output wire dataEnable__RDY,
    output wire hSync,
    output wire hSync__RDY,
    output wire vSync,
    output wire vSync__RDY,
    input wire setup__ENA,
    input wire [widthAddr - 1:0]setup$ahEnd,
    input wire [widthAddr - 1:0]setup$ahFrontEnd,
    input wire [widthAddr - 1:0]setup$ahBackSync,
    input wire [widthAddr - 1:0]setup$ahSyncWidth,
    input wire [heightAddr - 1:0]setup$avEnd,
    input wire [heightAddr - 1:0]setup$avFrontEnd,
    input wire [heightAddr - 1:0]setup$avBackSync,
    input wire [heightAddr - 1:0]setup$avSyncWidth,
    output wire setup__RDY,
    HdmiDataIfc.client data);
    reg [widthAddr - 1:0]hBackSync;
    reg [widthAddr - 1:0]hEnd;
    reg [widthAddr - 1:0]hFrontEnd;
    reg [widthAddr - 1:0]hSyncWidth;
    reg [widthAddr - 1:0]lineCount;
    reg [widthAddr - 1:0]pixelCount;
    reg run;
    reg [widthAddr - 1:0]vBackSync;
    reg [widthAddr - 1:0]vEnd;
    reg [widthAddr - 1:0]vFrontEnd;
    reg [widthAddr - 1:0]vSyncWidth;
    logic RULE$updatePixel__ENA;
    assign dataEnable = run && ( lineCount >= vBackSync ) && ( lineCount <= vFrontEnd ) && ( pixelCount >= hBackSync ) && ( pixelCount <= hFrontEnd );
    assign dataEnable__RDY = 1'd1;
    assign hSync = pixelCount < hSyncWidth;
    assign hSync__RDY = 1'd1;
    assign setup__RDY = 1'd1;
    assign vSync = lineCount < vSyncWidth;
    assign vSync__RDY = 1'd1;
    // Extra assigments, not to output wires
    assign RULE$updatePixel__ENA = run && data.setXY__RDY;
    assign data.setXY$dataEnable = ( ( run && ( lineCount >= vBackSync ) && ( lineCount <= vFrontEnd ) && ( pixelCount >= hBackSync ) && ( pixelCount <= hFrontEnd ) ) != 0 ) && run;
    assign data.setXY$x = run ? ( pixelCount - hBackSync ) : 0;
    assign data.setXY$y = run ? ( lineCount - vBackSync ) : 0;
    assign data.setXY__ENA = run;

    always @( posedge CLK) begin
      if (!nRST) begin
        hBackSync <= 0;
        hEnd <= 0;
        hFrontEnd <= 0;
        hSyncWidth <= 0;
        lineCount <= 0;
        pixelCount <= 0;
        run <= 0;
        vBackSync <= 0;
        vEnd <= 0;
        vFrontEnd <= 0;
        vSyncWidth <= 0;
      end // nRST
      else begin
        if (run && data.setXY__RDY && RULE$updatePixel__ENA) begin // RULE$updatePixel__ENA
            if (!( pixelCount < hEnd ))
            pixelCount <= 0;
            if (( !( pixelCount < hEnd ) ) && ( lineCount == vEnd ))
            lineCount <= 0;
            if (( lineCount != vEnd ) && ( !( pixelCount < hEnd ) ))
            lineCount <= lineCount + 1;
            if (pixelCount < hEnd)
            pixelCount <= pixelCount + 1;
        end; // End of RULE$updatePixel__ENA
        if (setup__ENA) begin // setup__ENA
            hEnd <= setup$ahEnd;
            hFrontEnd <= setup$ahFrontEnd;
            hBackSync <= setup$ahBackSync;
            hSyncWidth <= setup$ahSyncWidth;
            vEnd <= setup$avEnd;
            vFrontEnd <= setup$avFrontEnd;
            vBackSync <= setup$avBackSync;
            vSyncWidth <= setup$avSyncWidth;
            run <= 1'd1;
        end; // End of setup__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
