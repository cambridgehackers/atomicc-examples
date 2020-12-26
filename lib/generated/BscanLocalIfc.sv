interface BscanLocalIfc#(width = 32);
    logic  CLK;
    logic  nRST;
    logic  capture;
    logic  shift;
    logic  update;
    logic  capture_out;
    logic  TDO;
    logic  TDI;
    logic [width - 1:0] toBscan;
    logic [width - 1:0] fromBscan;
    modport server (input  CLK, nRST, capture, shift, update, TDI, toBscan,
                    output capture_out, TDO, fromBscan);
    modport client (output CLK, nRST, capture, shift, update, TDI, toBscan,
                    input  capture_out, TDO, fromBscan);
endinterface
