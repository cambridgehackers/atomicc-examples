interface SyncFFIfc;
    logic  CLK;
    logic  nRST;
    logic  out;
    logic  in;
    modport server (input  CLK, nRST, in,
                    output out);
    modport client (output CLK, nRST, in,
                    input  out);
endinterface
