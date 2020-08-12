`ifndef __clock_GENERATED__VH__
`define __clock_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __NOCDataH_DEF__
`define __NOCDataH_DEF__
typedef struct packed {
    logic [128 - 1:0] data;
    logic [16 - 1:0] length;
} NOCDataH;
`endif
`ifndef __PipeIn_OC_0_DEF__
`define __PipeIn_OC_0_DEF__
interface PipeIn_OC_0#(dataWidth = 32, funnelWidth = 99);
    logic enq__ENA;
    logic [dataWidth - 1:0] enq$v;
    logic enq__RDY;
    modport server (input  enq__ENA, enq$v,
                    output enq__RDY);
    modport client (output enq__ENA, enq$v,
                    input  enq__RDY);
endinterface
`endif
`ifndef __PipeIn_OC_1_DEF__
`define __PipeIn_OC_1_DEF__
interface PipeIn_OC_1#(dataWidth = 32, funnelWidth = 99);
    logic enq__ENA;
    logic [dataWidth - 1:0] enq$v;
    logic enq__RDY;
    modport server (input  enq__ENA, enq$v,
                    output enq__RDY);
    modport client (output enq__ENA, enq$v,
                    input  enq__RDY);
endinterface
`endif
`ifndef __MIOBUF_DEF__
`define __MIOBUF_DEF__
interface MIOBUF;
    logic  I;
    logic  IO;
    logic  O;
    logic  T;
    modport server (input  I, T,
                    output O);
    modport client (output I, T,
                    input  O);
endinterface
`endif
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
`ifndef __PipeIn_DEF__
`define __PipeIn_DEF__
interface PipeIn;
    logic enq__ENA;
    logic [(16 + 128) - 1:0] enq$v;
    logic enq__RDY;
    modport server (input  enq__ENA, enq$v,
                    output enq__RDY);
    modport client (output enq__ENA, enq$v,
                    input  enq__RDY);
endinterface
`endif
//METASTART; ModFt600
//METAINTERNAL; iobufs0; IOBUF;
//METAINTERNAL; iobufs1; IOBUF;
//METAINTERNAL; iobufs2; IOBUF;
//METAINTERNAL; iobufs3; IOBUF;
//METAINTERNAL; iobufs4; IOBUF;
//METAINTERNAL; iobufs5; IOBUF;
//METAINTERNAL; iobufs6; IOBUF;
//METAINTERNAL; iobufs7; IOBUF;
//METAINTERNAL; iobufs8; IOBUF;
//METAINTERNAL; iobufs9; IOBUF;
//METAINTERNAL; iobufs10; IOBUF;
//METAINTERNAL; iobufs11; IOBUF;
//METAINTERNAL; iobufs12; IOBUF;
//METAINTERNAL; iobufs13; IOBUF;
//METAINTERNAL; iobufs14; IOBUF;
//METAINTERNAL; iobufs15; IOBUF;
//METAGUARD; RULE$handshake; 1;
//METAGUARD; RULE$iobufs; 1;
//METARULES; RULE$handshake; RULE$iobufs
`endif
