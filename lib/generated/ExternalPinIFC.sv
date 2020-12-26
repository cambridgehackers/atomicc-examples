interface ExternalPinIFC#(width = 32);
    logic [width - 1:0] in;
    logic [width - 1:0] out;
    modport server (input  in,
                    output out);
    modport client (output in,
                    input  out);
endinterface
