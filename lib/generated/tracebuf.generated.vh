`ifndef __tracebuf_GENERATED__VH__
`define __tracebuf_GENERATED__VH__
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
//METAINTERNAL; bscan; Bscan(id=3,width=32);
//METAINTERNAL; radapter; AdapterToBus(width=64,owidth=32);
//METAINVOKE; RULE$copyRule__ENA; :bram$write__ENA;
//METAGUARD; RULE$copyRule; !( ( enable == 0 ) || ( !( writeNext && bram$write__RDY ) ) );
//METAGUARD; RULE$init; 1'd1;
//METAINVOKE; readUser.enq__ENA; radapter$out$last:bram$read__ENA;:radapter$out.deq__ENA;
//METAGUARD; readUser.enq; radapter$out.last__RDY && ( ( bram$read__RDY && radapter$out.deq__RDY ) || ( ( !bram$read__RDY ) && ( !( radapter$out$last || ( !radapter$out.deq__RDY ) ) ) ) );
//METAINVOKE; RULE$readCallBack__ENA; :radapter$in.enq__ENA;
//METAGUARD; RULE$readCallBack; bram$dataOut__RDY && radapter$in.enq__RDY;
//METAINVOKE; RULE$callBack__ENA; :bscan$toBscan.enq__ENA;
//METAGUARD; RULE$callBack; radapter$out.first__RDY && bscan$toBscan.enq__RDY;
//METARULES; RULE$copyRule; RULE$init; RULE$readCallBack; RULE$callBack
//METACONNECT; readUser.enq__ENA; bscan$fromBscan.enq__ENA
//METACONNECT; readUser.enq__RDY; bscan$fromBscan.enq__RDY
`endif
