`include "atomicclib.vh"

//METASTART; VsimTop
//METAINTERNAL; user; UserTop;
//METAINTERNAL; sink_0; VsimReceive(width=32);
//METAINTERNAL; source_0; VsimSend(width=32);
//METACONNECT; user$write.enq__ENA; sink_0$port.enq__ENA
//METACONNECT; user$write.enq__RDY; sink_0$port.enq__RDY
//METACONNECT; user$read.enq__ENA; source_0$port.enq__ENA
//METACONNECT; user$read.enq__RDY; source_0$port.enq__RDY
