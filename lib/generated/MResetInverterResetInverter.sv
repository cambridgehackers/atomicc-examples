interface MResetInverterResetInverter;
    logic  RESET_IN;
    logic  RESET_OUT;
    modport server (input  RESET_IN,
                    output RESET_OUT);
    modport client (output RESET_IN,
                    input  RESET_OUT);
endinterface
