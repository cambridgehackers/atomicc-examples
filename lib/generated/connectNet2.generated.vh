`ifndef __connectNet2_GENERATED__VH__
`define __connectNet2_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __CNCONNECTNET2_DEF__
`define __CNCONNECTNET2_DEF__
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
`endif
//METASTART; CONNECTNET2
//METAGUARD; RULE$assign; 1'd1;
//METARULES; RULE$assign
`endif
