interface LfsrFibIfc#(LN = 8, TAPS = 45);
    logic shiftBit__ENA;
    logic  shiftBit$v;
    logic shiftBit__RDY;
    logic  outBit;
    logic outBit__RDY;
    modport server (input  shiftBit__ENA, shiftBit$v,
                    output shiftBit__RDY, outBit, outBit__RDY);
    modport client (output shiftBit__ENA, shiftBit$v,
                    input  shiftBit__RDY, outBit, outBit__RDY);
endinterface
