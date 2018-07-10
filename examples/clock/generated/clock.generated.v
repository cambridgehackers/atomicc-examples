`include "clock.generated.vh"

module l_module_OC_Fifo1 (input CLK, input nRST,
    input in$enq__ENA,
    input [127:0]in$enq$v,
    output in$enq__RDY,
    input out$deq__ENA,
    output out$deq__RDY,
    output [127:0]out$first,
    output out$first__RDY);
    wire CLK, nRST;
    reg [31:0]element$data0;
    reg [31:0]element$data1;
    reg [31:0]element$data2;
    reg [31:0]element$data3;
    reg full;
    assign in$enq__RDY = !full ;
    assign out$deq__RDY = full ;
    assign out$first = { element$data3  , element$data2  , element$data1  , element$data0  };
    assign out$first__RDY = full ;

    always @( posedge CLK) begin
      if (!nRST) begin
        element$data0 <= 0;
        element$data1 <= 0;
        element$data2 <= 0;
        element$data3 <= 0;
        full <= 0;
      end // nRST
      else begin
        if (in$enq__ENA) begin
            { element$data3  , element$data2  , element$data1  , element$data0  } <= in$enq$v;
            full  <= 1;
        end; // End of in$enq__ENA
        if (out$deq__ENA) begin
            full  <= 0;
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module l_module_OC_ModFt600 (
    input usb_clk,
    input usb_rxf,
    input usb_txe,
    output usb_rd_n,
    output usb_wr_n,
    output usb_oe_n,
    input [15:0]usb_ad);
    wire CLK, nRST;
    reg usb_fifo_empty;
    reg [1:0]usb_rxf_delay;
    reg usb_txe_delay;
    wire CLK;
    wire handshake__ENA;
    wire handshake__RDY;
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
    wire iobufs_0__RDY;
    wire iobufs_10__ENA;
    wire iobufs_10__RDY;
    wire iobufs_11__ENA;
    wire iobufs_11__RDY;
    wire iobufs_12__ENA;
    wire iobufs_12__RDY;
    wire iobufs_13__ENA;
    wire iobufs_13__RDY;
    wire iobufs_14__ENA;
    wire iobufs_14__RDY;
    wire iobufs_15__ENA;
    wire iobufs_15__RDY;
    wire iobufs_1__ENA;
    wire iobufs_1__RDY;
    wire iobufs_2__ENA;
    wire iobufs_2__RDY;
    wire iobufs_3__ENA;
    wire iobufs_3__RDY;
    wire iobufs_4__ENA;
    wire iobufs_4__RDY;
    wire iobufs_5__ENA;
    wire iobufs_5__RDY;
    wire iobufs_6__ENA;
    wire iobufs_6__RDY;
    wire iobufs_7__ENA;
    wire iobufs_7__RDY;
    wire iobufs_8__ENA;
    wire iobufs_8__RDY;
    wire iobufs_9__ENA;
    wire iobufs_9__RDY;
    wire nRST;
    assign handshake__ENA = handshake__RDY ;
    assign handshake__RDY = 1;
    assign iobufs_0__ENA = iobufs_0__RDY ;
    assign iobufs_0__RDY = 1;
    assign iobufs_10__ENA = iobufs_10__RDY ;
    assign iobufs_10__RDY = 1;
    assign iobufs_11__ENA = iobufs_11__RDY ;
    assign iobufs_11__RDY = 1;
    assign iobufs_12__ENA = iobufs_12__RDY ;
    assign iobufs_12__RDY = 1;
    assign iobufs_13__ENA = iobufs_13__RDY ;
    assign iobufs_13__RDY = 1;
    assign iobufs_14__ENA = iobufs_14__RDY ;
    assign iobufs_14__RDY = 1;
    assign iobufs_15__ENA = iobufs_15__RDY ;
    assign iobufs_15__RDY = 1;
    assign iobufs_1__ENA = iobufs_1__RDY ;
    assign iobufs_1__RDY = 1;
    assign iobufs_2__ENA = iobufs_2__RDY ;
    assign iobufs_2__RDY = 1;
    assign iobufs_3__ENA = iobufs_3__RDY ;
    assign iobufs_3__RDY = 1;
    assign iobufs_4__ENA = iobufs_4__RDY ;
    assign iobufs_4__RDY = 1;
    assign iobufs_5__ENA = iobufs_5__RDY ;
    assign iobufs_5__RDY = 1;
    assign iobufs_6__ENA = iobufs_6__RDY ;
    assign iobufs_6__RDY = 1;
    assign iobufs_7__ENA = iobufs_7__RDY ;
    assign iobufs_7__RDY = 1;
    assign iobufs_8__ENA = iobufs_8__RDY ;
    assign iobufs_8__RDY = 1;
    assign iobufs_9__ENA = iobufs_9__RDY ;
    assign iobufs_9__RDY = 1;
    l_module_OC_IOBUF iobufs0 (
        .CLK(CLK),
        .RST_N(nRST),
        .IO(usb_ad >> 0),
        .I(iobufs0$I),
        .O(iobufs0$O),
        .T(iobufs0$T));
    l_module_OC_IOBUF iobufs1 (
        .CLK(CLK),
        .RST_N(nRST),
        .IO(usb_ad >> 1),
        .I(iobufs1$I),
        .O(iobufs1$O),
        .T(iobufs1$T));
    l_module_OC_IOBUF iobufs2 (
        .CLK(CLK),
        .RST_N(nRST),
        .IO(usb_ad >> 2),
        .I(iobufs2$I),
        .O(iobufs2$O),
        .T(iobufs2$T));
    l_module_OC_IOBUF iobufs3 (
        .CLK(CLK),
        .RST_N(nRST),
        .IO(usb_ad >> 3),
        .I(iobufs3$I),
        .O(iobufs3$O),
        .T(iobufs3$T));
    l_module_OC_IOBUF iobufs4 (
        .CLK(CLK),
        .RST_N(nRST),
        .IO(usb_ad >> 4),
        .I(iobufs4$I),
        .O(iobufs4$O),
        .T(iobufs4$T));
    l_module_OC_IOBUF iobufs5 (
        .CLK(CLK),
        .RST_N(nRST),
        .IO(usb_ad >> 5),
        .I(iobufs5$I),
        .O(iobufs5$O),
        .T(iobufs5$T));
    l_module_OC_IOBUF iobufs6 (
        .CLK(CLK),
        .RST_N(nRST),
        .IO(usb_ad >> 6),
        .I(iobufs6$I),
        .O(iobufs6$O),
        .T(iobufs6$T));
    l_module_OC_IOBUF iobufs7 (
        .CLK(CLK),
        .RST_N(nRST),
        .IO(usb_ad >> 7),
        .I(iobufs7$I),
        .O(iobufs7$O),
        .T(iobufs7$T));
    l_module_OC_IOBUF iobufs8 (
        .CLK(CLK),
        .RST_N(nRST),
        .IO(usb_ad >> 8),
        .I(iobufs8$I),
        .O(iobufs8$O),
        .T(iobufs8$T));
    l_module_OC_IOBUF iobufs9 (
        .CLK(CLK),
        .RST_N(nRST),
        .IO(usb_ad >> 9),
        .I(iobufs9$I),
        .O(iobufs9$O),
        .T(iobufs9$T));
    l_module_OC_IOBUF iobufs10 (
        .CLK(CLK),
        .RST_N(nRST),
        .IO(usb_ad >> 10),
        .I(iobufs10$I),
        .O(iobufs10$O),
        .T(iobufs10$T));
    l_module_OC_IOBUF iobufs11 (
        .CLK(CLK),
        .RST_N(nRST),
        .IO(usb_ad >> 11),
        .I(iobufs11$I),
        .O(iobufs11$O),
        .T(iobufs11$T));
    l_module_OC_IOBUF iobufs12 (
        .CLK(CLK),
        .RST_N(nRST),
        .IO(usb_ad >> 12),
        .I(iobufs12$I),
        .O(iobufs12$O),
        .T(iobufs12$T));
    l_module_OC_IOBUF iobufs13 (
        .CLK(CLK),
        .RST_N(nRST),
        .IO(usb_ad >> 13),
        .I(iobufs13$I),
        .O(iobufs13$O),
        .T(iobufs13$T));
    l_module_OC_IOBUF iobufs14 (
        .CLK(CLK),
        .RST_N(nRST),
        .IO(usb_ad >> 14),
        .I(iobufs14$I),
        .O(iobufs14$O),
        .T(iobufs14$T));
    l_module_OC_IOBUF iobufs15 (
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
    assign usb_oe_n = usb_rxf_delay ;
    assign usb_rd_n = usb_rxf_delay  != 2'd0;
    assign usb_wr_n = usb_txe_delay  | usb_fifo_empty  | ( usb_rxf_delay  ^ ( -1 ) );

    always @( posedge CLK) begin
      if (!nRST) begin
        usb_fifo_empty <= 0;
        usb_rxf_delay <= 0;
        usb_txe_delay <= 0;
      end // nRST
      else begin
        if (handshake__ENA) begin
            usb_fifo_empty  <= 0;
            usb_rxf_delay  <= ( usb_rxf_delay << 1 ) | usb_rxf;
            usb_txe_delay  <= usb_txe;
        end; // End of handshake__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module l_module_OC_MuxPipe (input CLK, input nRST,
    input in$enq__ENA,
    input [127:0]in$enq$v,
    output in$enq__RDY,
    input forward$enq__ENA,
    input [127:0]forward$enq$v,
    output forward$enq__RDY,
    output out$enq__ENA,
    output [127:0]out$enq$v,
    input out$enq__RDY);
    wire CLK, nRST;
    wire fifoRule__ENA;
    wire fifoRule__RDY;
    wire forwardFifo$out$deq__RDY;
    wire [127:0]forwardFifo$out$first;
    wire forwardFifo$out$first__RDY;
    assign fifoRule__ENA = fifoRule__RDY ;
    assign fifoRule__RDY = forwardFifo$out$first__RDY  & out$enq__RDY  & forwardFifo$out$deq__RDY ;
    l_module_OC_Fifo1 forwardFifo (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(forward$enq__ENA),
        .in$enq$v(forward$enq$v),
        .in$enq__RDY(forward$enq__RDY),
        .out$deq__ENA(fifoRule__ENA),
        .out$deq__RDY(forwardFifo$out$deq__RDY),
        .out$first(forwardFifo$out$first),
        .out$first__RDY(forwardFifo$out$first__RDY));
    assign in$enq__RDY = out$enq__RDY ;
    assign out$enq$v = fifoRule__ENA  ? { forwardFifo$out$first[127:96]  , forwardFifo$out$first[95:64]  , forwardFifo$out$first[63:32]  , forwardFifo$out$first[31:0]  } : in$enq$v ;
    assign out$enq__ENA = fifoRule__ENA  || in$enq__ENA ;
endmodule 

