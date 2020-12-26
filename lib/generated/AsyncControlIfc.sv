interface AsyncControlIfc;
    logic  CLK;
    logic  nRST;
    logic  start;
    logic  ack;
    logic  clear;
    logic  out;
    logic  done;
    modport server (input  CLK, nRST, start, ack, clear,
                    output out, done);
    modport client (output CLK, nRST, start, ack, clear,
                    input  out, done);
endinterface
