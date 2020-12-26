interface SPIMasterIfc#(width = 26);
    logic  CLK;
    logic  nRST;
    logic  clock;
    logic  mosi;
    logic  miso;
    modport server (input  miso,
                    output clock, mosi);
    modport client (output miso,
                    input  clock, mosi);
endinterface
