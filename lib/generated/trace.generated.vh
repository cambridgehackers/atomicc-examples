`ifndef __trace_GENERATED__VH__
`define __trace_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __BRAMIfc_DEF__
`define __BRAMIfc_DEF__
interface BRAMIfc#(depth = 1024, width = 64);
    logic write__ENA;
    logic [$clog2(depth) - 1:0] write$addr;
    logic [width - 1:0] write$data;
    logic write__RDY;
    logic read__ENA;
    logic [$clog2(depth) - 1:0] read$addr;
    logic read__RDY;
    logic [width - 1:0] dataOut;
    logic dataOut__RDY;
    modport server (input  write__ENA, write$addr, write$data, read__ENA, read$addr,
                    output write__RDY, read__RDY, dataOut, dataOut__RDY);
    modport client (output write__ENA, write$addr, write$data, read__ENA, read$addr,
                    input  write__RDY, read__RDY, dataOut, dataOut__RDY);
endinterface
`endif
`ifndef __TraceIfc_DEF__
`define __TraceIfc_DEF__
interface TraceIfc#(depth = 1024, width = 64);
    logic  CLK;
    logic  nRST;
    logic  enable;
    logic [width - 1:0] data;
    modport server (input  CLK, nRST, enable, data);
    modport client (output CLK, nRST, enable, data);
endinterface
`endif
//METASTART; Trace
//METAINTERNAL; bram; BRAM(width=64,depth=1024);
//METAINTERNAL; bscan; Bscan(id=3,width=64);
//METAGUARD; readUser.enq; 1;
//METAINVOKE; RULE$copyRule__ENA; :bram$write__ENA;
//METAGUARD; RULE$copyRule; !( ( enable == 0 ) || ( buffer == data ) || ( !bram$write__RDY ) );
//METAINVOKE; RULE$copyBRule__ENA; :bram$read__ENA;
//METAEXCLUSIVE; RULE$copyBRule__ENA; RULE$callBack__ENA
//METAGUARD; RULE$copyBRule; !( ( 0 == ( waitRead ^ 1 ) ) || ( !bram$read__RDY ) );
//METAINVOKE; RULE$callBack__ENA; :bscan$toBscan.enq__ENA;
//METAGUARD; RULE$callBack; !( ( 0 == waitRead ) || ( !( bram$dataOut__RDY && bscan$toBscan.enq__RDY ) ) );
//METAGUARD; RULE$init; 1;
//METARULES; RULE$copyRule; RULE$copyBRule; RULE$callBack; RULE$init
//METACONNECT; readUser.enq__ENA; bscan$fromBscan.enq__ENA
//METACONNECT; readUser.enq__RDY; bscan$fromBscan.enq__RDY
`endif
