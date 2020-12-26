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
