interface CounterIfc#(MAX_AMOUNT = 22);
    logic startSignal__ENA;
    logic startSignal__RDY;
    logic  busy;
    logic busy__RDY;
    modport server (input  startSignal__ENA,
                    output startSignal__RDY, busy, busy__RDY);
    modport client (output startSignal__ENA,
                    input  startSignal__RDY, busy, busy__RDY);
endinterface
