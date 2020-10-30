`ifndef __tracebuf_GENERATED__VH__
`define __tracebuf_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __AtB_DEF__
`define __AtB_DEF__
interface AtB#(owidth = 32, width = 64);
    logic clear__ENA;
    logic clear__RDY;
    modport server (input  clear__ENA,
                    output clear__RDY);
    modport client (output clear__ENA,
                    input  clear__RDY);
endinterface
`endif
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
interface TraceIfc#(depth = 1024, sensitivity = 99, width = 64);
    logic  CLK;
    logic  nRST;
    logic  enable;
    logic [width - 1:0] data;
    logic clear__ENA;
    logic clear__RDY;
    modport server (input  CLK, nRST, enable, data, clear__ENA,
                    output clear__RDY);
    modport client (output CLK, nRST, enable, data, clear__ENA,
                    input  clear__RDY);
endinterface
`endif
//METASTART; Trace
//METAINTERNAL; bram; BRAM(width=64,depth=1024);
//METAINTERNAL; radapter; AdapterToBus(width=64,owidth=32);
//METAINVOKE; RULE$copyRule__ENA; :bram$write__ENA;
//METAGUARD; RULE$copyRule; !( ( enable == 0 ) || ( buffer == data[ ( ( width - 32 ) - 1 ) : ( ( width - 32 ) - sensitivity ) ] ) || ( !bram$write__RDY ) );
//METAGUARD; RULE$init; 1'd1;
//METAINVOKE; RULE$readCallBack__ENA; :radapter$in.enq__ENA;
//METAGUARD; RULE$readCallBack; bram$dataOut__RDY && radapter$in.enq__RDY;
//METAINVOKE; clear__ENA; :radapter$clear__ENA;
//METAGUARD; clear; radapter$clear__RDY;
//METAGUARD; out.first; radapter$out.first__RDY;
//METAINVOKE; out.deq__ENA; radapter$out$last:bram$read__ENA;:radapter$out.deq__ENA;
//METAGUARD; out.deq; radapter$out.last__RDY && ( ( bram$read__RDY && radapter$out.deq__RDY ) || ( ( !bram$read__RDY ) && ( !( radapter$out$last || ( !radapter$out.deq__RDY ) ) ) ) );
//METARULES; RULE$copyRule; RULE$init; RULE$readCallBack
`endif
