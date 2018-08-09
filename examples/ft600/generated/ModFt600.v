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
    wire [31:0]RULEiobufs__ENA$i;
    wire iobufs0$IO;
    wire nRST;
    IOBUF iobufs0 (
        .IO(iobufs0$IO),
        .I(0),
        .O(),
        .T(0));
    IOBUF iobufs1 (
        .IO(),
        .I(0),
        .O(),
        .T(0));
    IOBUF iobufs2 (
        .IO(),
        .I(0),
        .O(),
        .T(0));
    IOBUF iobufs3 (
        .IO(),
        .I(0),
        .O(),
        .T(0));
    IOBUF iobufs4 (
        .IO(),
        .I(0),
        .O(),
        .T(0));
    IOBUF iobufs5 (
        .IO(),
        .I(0),
        .O(),
        .T(0));
    IOBUF iobufs6 (
        .IO(),
        .I(0),
        .O(),
        .T(0));
    IOBUF iobufs7 (
        .IO(),
        .I(0),
        .O(),
        .T(0));
    IOBUF iobufs8 (
        .IO(),
        .I(0),
        .O(),
        .T(0));
    IOBUF iobufs9 (
        .IO(),
        .I(0),
        .O(),
        .T(0));
    IOBUF iobufs10 (
        .IO(),
        .I(0),
        .O(),
        .T(0));
    IOBUF iobufs11 (
        .IO(),
        .I(0),
        .O(),
        .T(0));
    IOBUF iobufs12 (
        .IO(),
        .I(0),
        .O(),
        .T(0));
    IOBUF iobufs13 (
        .IO(),
        .I(0),
        .O(),
        .T(0));
    IOBUF iobufs14 (
        .IO(),
        .I(0),
        .O(),
        .T(0));
    IOBUF iobufs15 (
        .IO(),
        .I(0),
        .O(),
        .T(0));
    assign iobufs0$IO = ( RULEiobufs__ENA$i == 32'd0 ) ? ( usb_ad >> RULEiobufs__ENA$i ) : 0;
    assign usb_ad = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign usb_oe_n = usb_rxf_delay[ 0 ];
    assign usb_rd_n = usb_rxf_delay != 2'd0;
    assign usb_wr_n = usb_txe_delay | usb_fifo_empty | ( usb_rxf_delay ^ ( -1 ) );
    // Extra assigments, not to output wires
    assign RULEiobufs__ENA$i = RULEiobufs__ENA$i + 32'd1;

    always @( posedge CLK) begin
      if (!nRST) begin
        usb_fifo_empty <= 0;
        usb_rxf_delay <= 0;
        usb_txe_delay <= 0;
      end // nRST
      else begin
        // RULEhandshake__ENA
            usb_fifo_empty <= 0;
            usb_rxf_delay <= ( usb_rxf_delay << 1 ) | usb_rxf;
            usb_txe_delay <= usb_txe;
        // End of RULEhandshake__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
