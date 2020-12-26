interface HdmiDataIfc#(heightAddr = 13, widthAddr = 12);
    logic setXY__ENA;
    logic [widthAddr - 1:0] setXY$x;
    logic [heightAddr - 1:0] setXY$y;
    logic  setXY$dataEnable;
    logic setXY__RDY;
    modport server (input  setXY__ENA, setXY$x, setXY$y, setXY$dataEnable,
                    output setXY__RDY);
    modport client (output setXY__ENA, setXY$x, setXY$y, setXY$dataEnable,
                    input  setXY__RDY);
endinterface
