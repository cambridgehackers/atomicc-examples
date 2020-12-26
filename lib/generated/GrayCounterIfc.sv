interface GrayCounterIfc#(width = 10);
    logic increment__ENA;
    logic increment__RDY;
    logic decrement__ENA;
    logic decrement__RDY;
    logic [width - 1:0] readGray;
    logic readGray__RDY;
    logic writeGray__ENA;
    logic [width - 1:0] writeGray$v;
    logic writeGray__RDY;
    logic [width - 1:0] readBin;
    logic readBin__RDY;
    logic writeBin__ENA;
    logic [width - 1:0] writeBin$v;
    logic writeBin__RDY;
    modport server (input  increment__ENA, decrement__ENA, writeGray__ENA, writeGray$v, writeBin__ENA, writeBin$v,
                    output increment__RDY, decrement__RDY, readGray, readGray__RDY, writeGray__RDY, readBin, readBin__RDY, writeBin__RDY);
    modport client (output increment__ENA, decrement__ENA, writeGray__ENA, writeGray$v, writeBin__ENA, writeBin$v,
                    input  increment__RDY, decrement__RDY, readGray, readGray__RDY, writeGray__RDY, readBin, readBin__RDY, writeBin__RDY);
endinterface
