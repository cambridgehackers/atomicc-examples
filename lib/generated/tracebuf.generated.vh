`include "atomicclib.vh"

//METASTART; Trace
//METAINTERNAL; bram; BRAM(width=48,depth=1024);
//METAINTERNAL; radapter; AdapterToBus(width=48,owidth=32);
//METAINVOKE; RULE$copyRule__ENA; :bram$write__ENA;
//METAGUARD; RULE$copyRule; enable && ( buffer != data[ ( ( width - 32 ) - 1 ) : ( ( width - 32 ) - sensitivity ) ] ) && bram$write__RDY;
//METAGUARD; RULE$init; 1'd1;
//METAINVOKE; RULE$readCallBack__ENA; :radapter$in.enq__ENA;
//METAGUARD; RULE$readCallBack; bram$dataOut__RDY && radapter$in.enq__RDY;
//METAINVOKE; clear__ENA; :radapter$clear__ENA;
//METAGUARD; clear; radapter$clear__RDY;
//METAGUARD; out.first; radapter$out.first__RDY;
//METAINVOKE; out.deq__ENA; radapter$out$last:bram$read__ENA;:radapter$out.deq__ENA;
//METAGUARD; out.deq; radapter$out.last__RDY && ( ( bram$read__RDY && radapter$out.deq__RDY ) || ( ( !bram$read__RDY ) && ( !radapter$out$last ) && radapter$out.deq__RDY ) );
//METARULES; RULE$copyRule; RULE$init; RULE$readCallBack
