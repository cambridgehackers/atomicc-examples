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
    logic  TDO;
    logic  TDI;
    modport server (input  capture, shift, update, TDI,
                    output TDO);
    modport client (output capture, shift, update, TDI,
                    input  TDO);
endinterface
`endif
//METASTART; Bscan
//METAINTERNAL; bscan; BSCANE2;
//METAINTERNAL; tckbuf; BUFG;
//METAINTERNAL; localBscan; BscanLocal(width=32);
//METAINVOKE; toBscan.enq__ENA; :localBscan.toBscan$enq__ENA;
//METAGUARD; toBscan.enq; localBscan.toBscan$enq__RDY;
//METAINVOKE; readBscan.enq__ENA; :fromBscan.enq__ENA;
//METAGUARD; readBscan.enq; fromBscan.enq__RDY;
//METAGUARD; RULE$init; 1;
//METARULES; RULE$init
//METASTART; BscanLocal
//METAEXCLUSIVE; toBscan.enq__ENA; RULE$shiftRule__ENA; RULE$updateRule__ENA
//METAGUARD; toBscan.enq; capture & ( notReady ^ 1 );
//METAGUARD; RULE$shiftRule; 0 != shift;
//METAINVOKE; RULE$updateRule__ENA; :fromBscan.enq__ENA;
//METAGUARD; RULE$updateRule; !( ( 0 == update ) || ( !fromBscan.enq__RDY ) );
//METABEFORE; RULE$init__ENA; :RULE$shiftRule__ENA; :toBscan.enq__ENA
//METAGUARD; RULE$init; 1;
//METARULES; RULE$shiftRule; RULE$updateRule; RULE$init
`endif
