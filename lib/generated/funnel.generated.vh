`include "atomicclib.vh"

//METASTART; FunnelBufferedBase
//METAINTERNAL; buffer0; FifoPBase(width=32);
//METAINTERNAL; base; FunnelBase(funnelWidth=4,width=32);
//METAGUARD; RULE$init; 1'd1;
//METARULES; RULE$init
//METACONNECT; base$out.enq__ENA; out.enq__ENA
//METACONNECT; base$out.enq__RDY; out.enq__RDY
