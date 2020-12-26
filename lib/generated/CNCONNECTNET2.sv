interface CNCONNECTNET2;
    logic  IN1;
    logic  IN2;
    logic  OUT1;
    logic  OUT2;
    modport server (input  IN1, IN2,
                    output OUT1, OUT2);
    modport client (output IN1, IN2,
                    input  OUT1, OUT2);
endinterface
