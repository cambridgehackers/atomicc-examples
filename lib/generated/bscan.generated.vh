`ifndef __bscan_GENERATED__VH__
`define __bscan_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __MBSCANE2IFC_DEF__
`define __MBSCANE2IFC_DEF__
interface MBSCANE2IFC;
    logic  CAPTURE;
    logic  DRCK;
    logic  RESET;
    logic  RUNTEST;
    logic  SEL;
    logic  SHIFT;
    logic  TCK;
    logic  TDI;
    logic  TDO;
    logic  TMS;
    logic  UPDATE;
    modport server (input  TDO,
                    output CAPTURE, DRCK, RESET, RUNTEST, SEL, SHIFT, TCK, TDI, TMS, UPDATE);
    modport client (output TDO,
                    input  CAPTURE, DRCK, RESET, RUNTEST, SEL, SHIFT, TCK, TDI, TMS, UPDATE);
endinterface
`endif
`ifndef __MbufgBUFG_DEF__
`define __MbufgBUFG_DEF__
interface MbufgBUFG;
    logic  I;
    logic  O;
    modport server (input  I,
                    output O);
    modport client (output I,
                    input  O);
endinterface
`endif
`ifndef __BscanLocalIfc_DEF__
`define __BscanLocalIfc_DEF__
interface BscanLocalIfc#(width = 32);
    logic  CLK;
    logic  nRST;
    logic  capture;
    logic  shift;
    logic  update;
    logic  capture_out;
    logic  TDO;
    logic  TDI;
    logic [width - 1:0] toBscan;
    logic [width - 1:0] fromBscan;
    modport server (input  CLK, nRST, capture, shift, update, TDI, toBscan,
                    output capture_out, TDO, fromBscan);
    modport client (output CLK, nRST, capture, shift, update, TDI, toBscan,
                    input  capture_out, TDO, fromBscan);
endinterface
`endif
`ifndef __SyncFFIfc_DEF__
`define __SyncFFIfc_DEF__
interface SyncFFIfc;
    logic  CLK;
    logic  nRST;
    logic  out;
    logic  in;
    modport server (input  CLK, nRST, in,
                    output out);
    modport client (output CLK, nRST, in,
                    input  out);
endinterface
`endif
//METASTART; Bscan
//METAINTERNAL; bscan; BSCANE2;
//METAINTERNAL; bscan_mytck; BUFG;
//METAINTERNAL; localBscan; BscanLocal(width=32);
//METAINTERNAL; updateF; SyncFF;
//METAINTERNAL; captureF; SyncFF;
//METAGUARD; toBscan.enq; captureF$out != 0;
//METAINVOKE; RULE$updateRule__ENA; :fromBscan.enq__ENA;
//METAGUARD; RULE$updateRule; updateF$out && fromBscan.enq__RDY;
//METAGUARD; RULE$init; 1'd1;
//METARULES; RULE$updateRule; RULE$init
//METASTART; BscanLocal
//METAEXCLUSIVE; RULE$shiftRule__ENA; RULE$init__ENA
//METAGUARD; RULE$shiftRule; 0 != shift;
//METABEFORE; RULE$init__ENA; :RULE$shiftRule__ENA
//METAGUARD; RULE$init; 1'd1;
//METARULES; RULE$shiftRule; RULE$init
`endif
