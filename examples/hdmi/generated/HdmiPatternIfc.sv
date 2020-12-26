interface HdmiPatternIfc#(heightAddr = 12, widthAddr = 12);
    logic setup__ENA;
    logic [widthAddr - 1:0] setup$aactivePixels;
    logic [heightAddr - 1:0] setup$aactiveLines;
    logic [8 - 1:0] setup$apattern;
    logic [20 - 1:0] setup$arampStep;
    logic setup__RDY;
    logic [36 - 1:0] data;
    logic data__RDY;
    modport server (input  setup__ENA, setup$aactivePixels, setup$aactiveLines, setup$apattern, setup$arampStep,
                    output setup__RDY, data, data__RDY);
    modport client (output setup__ENA, setup$aactivePixels, setup$aactiveLines, setup$apattern, setup$arampStep,
                    input  setup__RDY, data, data__RDY);
endinterface
