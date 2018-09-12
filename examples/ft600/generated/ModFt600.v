`include "ft600.generated.vh"

`default_nettype none
module ModFt600 (
    input wire usb_clk,
    input wire usb_rxf,
    input wire usb_txe,
    output wire usb_rd_n,
    output wire usb_wr_n,
    output wire usb_oe_n,
    inout wire [15:0]usb_ad);
    reg usb_fifo_empty;
    reg [1:0]usb_rxf_delay;
    reg usb_txe_delay;
    wire CLK;
    wire nRST;
    IOBUF iobufs0 (
        .IO(usb_ad >> 0),
        .I(0),
        .O(),
        .T(usb_rxf_delay[ 0 ]));
    IOBUF iobufs1 (
        .IO(usb_ad >> 1),
        .I(0),
        .O(),
        .T(usb_rxf_delay[ 0 ]));
    IOBUF iobufs2 (
        .IO(usb_ad >> 2),
        .I(0),
        .O(),
        .T(usb_rxf_delay[ 0 ]));
    IOBUF iobufs3 (
        .IO(usb_ad >> 3),
        .I(0),
        .O(),
        .T(usb_rxf_delay[ 0 ]));
    IOBUF iobufs4 (
        .IO(usb_ad >> 4),
        .I(0),
        .O(),
        .T(usb_rxf_delay[ 0 ]));
    IOBUF iobufs5 (
        .IO(usb_ad >> 5),
        .I(0),
        .O(),
        .T(usb_rxf_delay[ 0 ]));
    IOBUF iobufs6 (
        .IO(usb_ad >> 6),
        .I(0),
        .O(),
        .T(usb_rxf_delay[ 0 ]));
    IOBUF iobufs7 (
        .IO(usb_ad >> 7),
        .I(0),
        .O(),
        .T(usb_rxf_delay[ 0 ]));
    IOBUF iobufs8 (
        .IO(usb_ad >> 8),
        .I(0),
        .O(),
        .T(usb_rxf_delay[ 0 ]));
    IOBUF iobufs9 (
        .IO(usb_ad >> 9),
        .I(0),
        .O(),
        .T(usb_rxf_delay[ 0 ]));
    IOBUF iobufs10 (
        .IO(usb_ad >> 10),
        .I(0),
        .O(),
        .T(usb_rxf_delay[ 0 ]));
    IOBUF iobufs11 (
        .IO(usb_ad >> 11),
        .I(0),
        .O(),
        .T(usb_rxf_delay[ 0 ]));
    IOBUF iobufs12 (
        .IO(usb_ad >> 12),
        .I(0),
        .O(),
        .T(usb_rxf_delay[ 0 ]));
    IOBUF iobufs13 (
        .IO(usb_ad >> 13),
        .I(0),
        .O(),
        .T(usb_rxf_delay[ 0 ]));
    IOBUF iobufs14 (
        .IO(usb_ad >> 14),
        .I(0),
        .O(),
        .T(usb_rxf_delay[ 0 ]));
    IOBUF iobufs15 (
        .IO(usb_ad >> 15),
        .I(0),
        .O(),
        .T(usb_rxf_delay[ 0 ]));
    assign usb_ad = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign usb_oe_n = usb_rxf_delay[ 0 ];
    assign usb_rd_n = usb_rxf_delay != 2'd0;
    assign usb_wr_n = usb_txe_delay | usb_fifo_empty | ( usb_rxf_delay ^ ( -1 ) );

    always @( posedge CLK) begin
      if (!nRST) begin
        usb_fifo_empty <= 0;
        usb_rxf_delay <= 0;
        usb_txe_delay <= 0;
      end // nRST
      else begin
        // RULE$handshake__ENA
            usb_fifo_empty <= 0;
            usb_rxf_delay <= ( usb_rxf_delay << 1 ) | usb_rxf;
            usb_txe_delay <= usb_txe;
        // End of RULE$handshake__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
