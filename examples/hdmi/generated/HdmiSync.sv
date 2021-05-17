`include "atomicc.generated.vh"
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
    input wire run__ENA,
    output wire run__RDY,
    HdmiDataIfc.client data);
    reg [widthAddr - 1:0]hBackSync;
    reg [widthAddr - 1:0]hEnd;
    reg [widthAddr - 1:0]hFrontEnd;
    reg [widthAddr - 1:0]hSyncWidth;
    reg [widthAddr - 1:0]lineCount;
    reg [widthAddr - 1:0]pixelCount;
    reg runFlag;
    reg [widthAddr - 1:0]vBackSync;
    reg [widthAddr - 1:0]vEnd;
    reg [widthAddr - 1:0]vFrontEnd;
    reg [widthAddr - 1:0]vSyncWidth;
    logic RULE$updatePixel__ENA;
    assign dataEnable = runFlag && ( lineCount >= vBackSync ) && ( lineCount <= vFrontEnd ) && ( pixelCount >= hBackSync ) && ( pixelCount <= hFrontEnd );
    assign dataEnable__RDY = 1'd1;
    assign hSync = runFlag && ( pixelCount < hSyncWidth );
    assign hSync__RDY = 1'd1;
    assign run__RDY = 1'd1;
    assign setup__RDY = 1'd1;
    assign vSync = runFlag && ( lineCount < vSyncWidth );
    assign vSync__RDY = 1'd1;
    // Extra assigments, not to output wires
    assign RULE$updatePixel__ENA = runFlag && data.setXY__RDY;
    assign data.setXY$dataEnable = ( runFlag && ( lineCount >= vBackSync ) && ( lineCount <= vFrontEnd ) && ( pixelCount >= hBackSync ) && ( pixelCount <= hFrontEnd ) ) != 0;
    assign data.setXY$x = pixelCount - hBackSync;
    assign data.setXY$y = lineCount - vBackSync;
    assign data.setXY__ENA = runFlag;

    always @( posedge CLK) begin
      if (!nRST) begin
        hBackSync <= (widthAddr) ' ('d0);
        hEnd <= (widthAddr) ' ('d0);
        hFrontEnd <= (widthAddr) ' ('d0);
        hSyncWidth <= (widthAddr) ' ('d0);
        lineCount <= (widthAddr) ' ('d0);
        pixelCount <= (widthAddr) ' ('d0);
        runFlag <= 1'd0;
        vBackSync <= (widthAddr) ' ('d0);
        vEnd <= (widthAddr) ' ('d0);
        vFrontEnd <= (widthAddr) ' ('d0);
        vSyncWidth <= (widthAddr) ' ('d0);
      end // nRST
      else begin
        if (runFlag && data.setXY__RDY && RULE$updatePixel__ENA) begin // RULE$updatePixel__ENA
            if (!( pixelCount < hEnd ))
            pixelCount <= (widthAddr) ' ('d0);
            if (( !( pixelCount < hEnd ) ) && ( lineCount == vEnd ))
            lineCount <= (widthAddr) ' ('d0);
            if (( lineCount != vEnd ) && ( !( pixelCount < hEnd ) ))
            lineCount <= lineCount + ( (widthAddr) ' ('d1) );
            if (pixelCount < hEnd)
            pixelCount <= pixelCount + ( (widthAddr) ' ('d1) );
        end; // End of RULE$updatePixel__ENA
        if (run__ENA) begin // run__ENA
            runFlag <= 1'd1;
        end; // End of run__ENA
        if (setup__ENA) begin // setup__ENA
            hEnd <= setup$ahEnd;
            hFrontEnd <= setup$ahFrontEnd;
            hBackSync <= setup$ahBackSync;
            hSyncWidth <= setup$ahSyncWidth;
            vEnd <= setup$avEnd;
            vFrontEnd <= setup$avFrontEnd;
            vBackSync <= setup$avBackSync;
            vSyncWidth <= setup$avSyncWidth;
        end; // End of setup__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
