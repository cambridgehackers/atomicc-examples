`ifndef __ft600_GENERATED__VH__
`define __ft600_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __Ft600_DEF__
`define __Ft600_DEF__
interface Ft600;
    logic  usb_clk;
    logic  usb_rxf;
    logic  usb_txe;
    logic  usb_rd_n;
    logic  usb_wr_n;
    logic  usb_oe_n;
    logic [16 - 1:0] usb_ad;
    modport server (input  usb_clk, usb_rxf, usb_txe,
                    output usb_rd_n, usb_wr_n, usb_oe_n);
    modport client (output usb_clk, usb_rxf, usb_txe,
                    input  usb_rd_n, usb_wr_n, usb_oe_n);
endinterface
`endif
//METASTART; ModFt600
//METAINTERNAL; iov; IobufVec(iovecWidth=16);
//METAGUARD; RULE$handshake; 1'd1;
//METARULES; RULE$handshake
`endif
