`include "clock.generated.vh"

`default_nettype none
module ModFt600 (
    input wire usb_clk,
    input wire usb_rxf,
    input wire usb_txe,
    output wire usb_rd_n,
    output wire usb_wr_n,
    output wire usb_oe_n,
    inout wire [15:0]usb_ad);
    wire CLK;
    wire nRST;
    reg usb_fifo_empty;
    reg [1:0]usb_rxf_delay;
    reg usb_txe_delay;
    wire RULEhandshake__ENA;
    wire RULEhandshake__RDY;
    wire RULEiobufs_0__ENA;
    wire RULEiobufs_0__RDY;
    wire RULEiobufs_10__ENA;
    wire RULEiobufs_10__RDY;
    wire RULEiobufs_11__ENA;
    wire RULEiobufs_11__RDY;
    wire RULEiobufs_12__ENA;
    wire RULEiobufs_12__RDY;
    wire RULEiobufs_13__ENA;
    wire RULEiobufs_13__RDY;
    wire RULEiobufs_14__ENA;
    wire RULEiobufs_14__RDY;
    wire RULEiobufs_15__ENA;
    wire RULEiobufs_15__RDY;
    wire RULEiobufs_1__ENA;
    wire RULEiobufs_1__RDY;
    wire RULEiobufs_2__ENA;
    wire RULEiobufs_2__RDY;
    wire RULEiobufs_3__ENA;
    wire RULEiobufs_3__RDY;
    wire RULEiobufs_4__ENA;
    wire RULEiobufs_4__RDY;
    wire RULEiobufs_5__ENA;
    wire RULEiobufs_5__RDY;
    wire RULEiobufs_6__ENA;
    wire RULEiobufs_6__RDY;
    wire RULEiobufs_7__ENA;
    wire RULEiobufs_7__RDY;
    wire RULEiobufs_8__ENA;
    wire RULEiobufs_8__RDY;
    wire RULEiobufs_9__ENA;
    wire RULEiobufs_9__RDY;
    assign RULEhandshake__ENA = 1;
    assign RULEiobufs_0__ENA = 1;
    assign RULEiobufs_10__ENA = 1;
    assign RULEiobufs_11__ENA = 1;
    assign RULEiobufs_12__ENA = 1;
    assign RULEiobufs_13__ENA = 1;
    assign RULEiobufs_14__ENA = 1;
    assign RULEiobufs_15__ENA = 1;
    assign RULEiobufs_1__ENA = 1;
    assign RULEiobufs_2__ENA = 1;
    assign RULEiobufs_3__ENA = 1;
    assign RULEiobufs_4__ENA = 1;
    assign RULEiobufs_5__ENA = 1;
    assign RULEiobufs_6__ENA = 1;
    assign RULEiobufs_7__ENA = 1;
    assign RULEiobufs_8__ENA = 1;
    assign RULEiobufs_9__ENA = 1;
    assign usb_oe_n = usb_rxf_delay;
    assign usb_rd_n = usb_rxf_delay != 2'd0;
    assign usb_wr_n = usb_txe_delay | usb_fifo_empty | ( usb_rxf_delay ^ ( -1 ) );
    IOBUF iobufs0 (
        .CLK(),
        .RST_N(),
        .IO(usb_ad >> 0),
        .I(0),
        .O(),
        .T(0));
    IOBUF iobufs1 (
        .CLK(),
        .RST_N(),
        .IO(usb_ad >> 1),
        .I(0),
        .O(),
        .T(0));
    IOBUF iobufs2 (
        .CLK(),
        .RST_N(),
        .IO(usb_ad >> 2),
        .I(0),
        .O(),
        .T(0));
    IOBUF iobufs3 (
        .CLK(),
        .RST_N(),
        .IO(usb_ad >> 3),
        .I(0),
        .O(),
        .T(0));
    IOBUF iobufs4 (
        .CLK(),
        .RST_N(),
        .IO(usb_ad >> 4),
        .I(0),
        .O(),
        .T(0));
    IOBUF iobufs5 (
        .CLK(),
        .RST_N(),
        .IO(usb_ad >> 5),
        .I(0),
        .O(),
        .T(0));
    IOBUF iobufs6 (
        .CLK(),
        .RST_N(),
        .IO(usb_ad >> 6),
        .I(0),
        .O(),
        .T(0));
    IOBUF iobufs7 (
        .CLK(),
        .RST_N(),
        .IO(usb_ad >> 7),
        .I(0),
        .O(),
        .T(0));
    IOBUF iobufs8 (
        .CLK(),
        .RST_N(),
        .IO(usb_ad >> 8),
        .I(0),
        .O(),
        .T(0));
    IOBUF iobufs9 (
        .CLK(),
        .RST_N(),
        .IO(usb_ad >> 9),
        .I(0),
        .O(),
        .T(0));
    IOBUF iobufs10 (
        .CLK(),
        .RST_N(),
        .IO(usb_ad >> 10),
        .I(0),
        .O(),
        .T(0));
    IOBUF iobufs11 (
        .CLK(),
        .RST_N(),
        .IO(usb_ad >> 11),
        .I(0),
        .O(),
        .T(0));
    IOBUF iobufs12 (
        .CLK(),
        .RST_N(),
        .IO(usb_ad >> 12),
        .I(0),
        .O(),
        .T(0));
    IOBUF iobufs13 (
        .CLK(),
        .RST_N(),
        .IO(usb_ad >> 13),
        .I(0),
        .O(),
        .T(0));
    IOBUF iobufs14 (
        .CLK(),
        .RST_N(),
        .IO(usb_ad >> 14),
        .I(0),
        .O(),
        .T(0));
    IOBUF iobufs15 (
        .CLK(),
        .RST_N(),
        .IO(usb_ad >> 15),
        .I(0),
        .O(),
        .T(0));
    assign usb_ad = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    // Extra assigments, not to output wires
    assign RULEhandshake__RDY = 1;
    assign RULEiobufs_0__RDY = 1;
    assign RULEiobufs_10__RDY = 1;
    assign RULEiobufs_11__RDY = 1;
    assign RULEiobufs_12__RDY = 1;
    assign RULEiobufs_13__RDY = 1;
    assign RULEiobufs_14__RDY = 1;
    assign RULEiobufs_15__RDY = 1;
    assign RULEiobufs_1__RDY = 1;
    assign RULEiobufs_2__RDY = 1;
    assign RULEiobufs_3__RDY = 1;
    assign RULEiobufs_4__RDY = 1;
    assign RULEiobufs_5__RDY = 1;
    assign RULEiobufs_6__RDY = 1;
    assign RULEiobufs_7__RDY = 1;
    assign RULEiobufs_8__RDY = 1;
    assign RULEiobufs_9__RDY = 1;

    always @( posedge CLK) begin
      if (!nRST) begin
        usb_fifo_empty <= 0;
        usb_rxf_delay <= 0;
        usb_txe_delay <= 0;
      end // nRST
      else begin
        if (RULEhandshake__ENA & 1) begin
            usb_fifo_empty <= 0;
            usb_rxf_delay <= ( usb_rxf_delay << 1 ) | usb_rxf;
            usb_txe_delay <= usb_txe;
        end; // End of RULEhandshake__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
