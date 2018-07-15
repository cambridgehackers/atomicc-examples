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
    wire CLK;
    wire handshake__ENA;
    wire iobufs0$I;
    wire iobufs0$O;
    wire iobufs0$T;
    wire iobufs1$I;
    wire iobufs1$O;
    wire iobufs1$T;
    wire iobufs10$I;
    wire iobufs10$O;
    wire iobufs10$T;
    wire iobufs11$I;
    wire iobufs11$O;
    wire iobufs11$T;
    wire iobufs12$I;
    wire iobufs12$O;
    wire iobufs12$T;
    wire iobufs13$I;
    wire iobufs13$O;
    wire iobufs13$T;
    wire iobufs14$I;
    wire iobufs14$O;
    wire iobufs14$T;
    wire iobufs15$I;
    wire iobufs15$O;
    wire iobufs15$T;
    wire iobufs2$I;
    wire iobufs2$O;
    wire iobufs2$T;
    wire iobufs3$I;
    wire iobufs3$O;
    wire iobufs3$T;
    wire iobufs4$I;
    wire iobufs4$O;
    wire iobufs4$T;
    wire iobufs5$I;
    wire iobufs5$O;
    wire iobufs5$T;
    wire iobufs6$I;
    wire iobufs6$O;
    wire iobufs6$T;
    wire iobufs7$I;
    wire iobufs7$O;
    wire iobufs7$T;
    wire iobufs8$I;
    wire iobufs8$O;
    wire iobufs8$T;
    wire iobufs9$I;
    wire iobufs9$O;
    wire iobufs9$T;
    wire iobufs_0__ENA;
    wire iobufs_10__ENA;
    wire iobufs_11__ENA;
    wire iobufs_12__ENA;
    wire iobufs_13__ENA;
    wire iobufs_14__ENA;
    wire iobufs_15__ENA;
    wire iobufs_1__ENA;
    wire iobufs_2__ENA;
    wire iobufs_3__ENA;
    wire iobufs_4__ENA;
    wire iobufs_5__ENA;
    wire iobufs_6__ENA;
    wire iobufs_7__ENA;
    wire iobufs_8__ENA;
    wire iobufs_9__ENA;
    wire nRST;
    assign handshake__ENA = 1;
    assign iobufs_0__ENA = 1;
    assign iobufs_10__ENA = 1;
    assign iobufs_11__ENA = 1;
    assign iobufs_12__ENA = 1;
    assign iobufs_13__ENA = 1;
    assign iobufs_14__ENA = 1;
    assign iobufs_15__ENA = 1;
    assign iobufs_1__ENA = 1;
    assign iobufs_2__ENA = 1;
    assign iobufs_3__ENA = 1;
    assign iobufs_4__ENA = 1;
    assign iobufs_5__ENA = 1;
    assign iobufs_6__ENA = 1;
    assign iobufs_7__ENA = 1;
    assign iobufs_8__ENA = 1;
    assign iobufs_9__ENA = 1;
    IOBUF iobufs0 (
        .CLK(CLK),
        .RST_N(nRST),
        .IO(usb_ad >> 0),
        .I(iobufs0$I),
        .O(iobufs0$O),
        .T(iobufs0$T));
    IOBUF iobufs1 (
        .CLK(CLK),
        .RST_N(nRST),
        .IO(usb_ad >> 1),
        .I(iobufs1$I),
        .O(iobufs1$O),
        .T(iobufs1$T));
    IOBUF iobufs2 (
        .CLK(CLK),
        .RST_N(nRST),
        .IO(usb_ad >> 2),
        .I(iobufs2$I),
        .O(iobufs2$O),
        .T(iobufs2$T));
    IOBUF iobufs3 (
        .CLK(CLK),
        .RST_N(nRST),
        .IO(usb_ad >> 3),
        .I(iobufs3$I),
        .O(iobufs3$O),
        .T(iobufs3$T));
    IOBUF iobufs4 (
        .CLK(CLK),
        .RST_N(nRST),
        .IO(usb_ad >> 4),
        .I(iobufs4$I),
        .O(iobufs4$O),
        .T(iobufs4$T));
    IOBUF iobufs5 (
        .CLK(CLK),
        .RST_N(nRST),
        .IO(usb_ad >> 5),
        .I(iobufs5$I),
        .O(iobufs5$O),
        .T(iobufs5$T));
    IOBUF iobufs6 (
        .CLK(CLK),
        .RST_N(nRST),
        .IO(usb_ad >> 6),
        .I(iobufs6$I),
        .O(iobufs6$O),
        .T(iobufs6$T));
    IOBUF iobufs7 (
        .CLK(CLK),
        .RST_N(nRST),
        .IO(usb_ad >> 7),
        .I(iobufs7$I),
        .O(iobufs7$O),
        .T(iobufs7$T));
    IOBUF iobufs8 (
        .CLK(CLK),
        .RST_N(nRST),
        .IO(usb_ad >> 8),
        .I(iobufs8$I),
        .O(iobufs8$O),
        .T(iobufs8$T));
    IOBUF iobufs9 (
        .CLK(CLK),
        .RST_N(nRST),
        .IO(usb_ad >> 9),
        .I(iobufs9$I),
        .O(iobufs9$O),
        .T(iobufs9$T));
    IOBUF iobufs10 (
        .CLK(CLK),
        .RST_N(nRST),
        .IO(usb_ad >> 10),
        .I(iobufs10$I),
        .O(iobufs10$O),
        .T(iobufs10$T));
    IOBUF iobufs11 (
        .CLK(CLK),
        .RST_N(nRST),
        .IO(usb_ad >> 11),
        .I(iobufs11$I),
        .O(iobufs11$O),
        .T(iobufs11$T));
    IOBUF iobufs12 (
        .CLK(CLK),
        .RST_N(nRST),
        .IO(usb_ad >> 12),
        .I(iobufs12$I),
        .O(iobufs12$O),
        .T(iobufs12$T));
    IOBUF iobufs13 (
        .CLK(CLK),
        .RST_N(nRST),
        .IO(usb_ad >> 13),
        .I(iobufs13$I),
        .O(iobufs13$O),
        .T(iobufs13$T));
    IOBUF iobufs14 (
        .CLK(CLK),
        .RST_N(nRST),
        .IO(usb_ad >> 14),
        .I(iobufs14$I),
        .O(iobufs14$O),
        .T(iobufs14$T));
    IOBUF iobufs15 (
        .CLK(CLK),
        .RST_N(nRST),
        .IO(usb_ad >> 15),
        .I(iobufs15$I),
        .O(iobufs15$O),
        .T(iobufs15$T));
    assign iobufs0$I = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign iobufs0$T = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign iobufs1$I = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign iobufs1$T = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign iobufs10$I = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign iobufs10$T = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign iobufs11$I = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign iobufs11$T = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign iobufs12$I = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign iobufs12$T = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign iobufs13$I = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign iobufs13$T = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign iobufs14$I = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign iobufs14$T = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign iobufs15$I = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign iobufs15$T = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign iobufs2$I = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign iobufs2$T = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign iobufs3$I = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign iobufs3$T = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign iobufs4$I = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign iobufs4$T = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign iobufs5$I = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign iobufs5$T = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign iobufs6$I = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign iobufs6$T = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign iobufs7$I = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign iobufs7$T = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign iobufs8$I = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign iobufs8$T = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign iobufs9$I = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign iobufs9$T = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign usb_ad = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign usb_oe_n = usb_rxf_delay;
    assign usb_rd_n = usb_rxf_delay != 2'd0;
    assign usb_wr_n = usb_txe_delay | usb_fifo_empty | ( usb_rxf_delay ^ ( -1 ) );

    always @( posedge CLK) begin
      if (!nRST) begin
        usb_fifo_empty <= 0;
        usb_rxf_delay <= 0;
        usb_txe_delay <= 0;
      end // nRST
      else begin
        if (handshake__ENA & 1) begin
            usb_fifo_empty <= 0;
            usb_rxf_delay <= ( usb_rxf_delay << 1 ) | usb_rxf;
            usb_txe_delay <= usb_txe;
        end; // End of handshake__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
