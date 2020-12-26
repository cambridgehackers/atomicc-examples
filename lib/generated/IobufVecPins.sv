interface IobufVecPins#(iovecWidth = 999999);
    logic [iovecWidth - 1:0] IO;
    logic [iovecWidth - 1:0] I;
    logic [iovecWidth - 1:0] O;
    logic  T;
    modport server (input  I, T,
                    output O);
    modport client (output I, T,
                    input  O);
endinterface
