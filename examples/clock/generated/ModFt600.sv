`include "atomicc.generated.vh"
`default_nettype none
module ModFt600 (
    input wire usb_clk,
    input wire usb_rxf,
    input wire usb_txe,
    output wire usb_rd_n,
    output wire usb_wr_n,
    output wire usb_oe_n,
    inout wire [16 - 1:0]usb_ad);
    reg usb_fifo_empty;
    reg [2 - 1:0]usb_rxf_delay;
    reg usb_txe_delay;
    logic CLK;
    logic iobufs$I [16 - 1:0];
    logic iobufs$IO [16 - 1:0];
    logic iobufs$O [16 - 1:0];
    logic iobufs$T [16 - 1:0];
    logic nRST;
    IOBUF iobufs [16 - 1:0] (
        .I(iobufs$I),
        .IO(iobufs$IO),
        .O(iobufs$O),
        .T(iobufs$T));
    assign usb_ad = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign usb_oe_n = usb_rxf_delay[ 0 ];
    assign usb_rd_n = ( usb_rxf_delay != 0 ) && 1'd1;
    assign usb_wr_n = usb_txe_delay || usb_fifo_empty || ( !usb_rxf_delay[ 0 ] );
for(genvar __inst$Genvar1 = 0; __inst$Genvar1 < 16; __inst$Genvar1 = 1) begin
    assign iobufs$IO[ __inst$Genvar1 ] = usb_ad >> __inst$Genvar1;
    end;

    always @( posedge CLK) begin
      if (!nRST) begin
        usb_fifo_empty <= 1'd0;
        usb_rxf_delay <= 2'd0;
        usb_txe_delay <= 1'd0;
      end // nRST
      else begin
        // RULE$handshake__ENA
            usb_fifo_empty <= 1'd0;
            usb_rxf_delay <= ( usb_rxf_delay << 1 ) | usb_rxf;
            usb_txe_delay <= usb_txe;
        // End of RULE$handshake__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
