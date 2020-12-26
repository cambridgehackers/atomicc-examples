interface MIOBUF;
    logic  I;
    logic  IO;
    logic  O;
    logic  T;
    modport server (input  I, T,
                    output O);
    modport client (output I, T,
                    input  O);
endinterface
