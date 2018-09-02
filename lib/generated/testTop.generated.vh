`ifndef __testTop_GENERATED__VH__
`define __testTop_GENERATED__VH__

//METASTART; TestTop
//METAEXTERNAL; MAXIGP0_I; l_ainterface_OC_MaxiI;
//METAINTERNAL; reqArs; Fifo1Base$__PARAM__$width$15;
//METAINTERNAL; reqAws; Fifo1Base$__PARAM__$width$15;
//METAINTERNAL; readBeat; Fifo1Base$__PARAM__$width$16;
//METAINTERNAL; writeBeat; Fifo1Base$__PARAM__$width$16;
//METAINTERNAL; readData; Fifo1Base$__PARAM__$width$38;
//METAINTERNAL; writeData; Fifo1Base$__PARAM__$width$32;
//METAINTERNAL; writeDone; Fifo1Base$__PARAM__$width$6;
//METAINTERNAL; user; UserTop;
//METAINVOKE; MAXIGP0_O$AR__ENA; :reqArs$in$enq__ENA;
//METAGUARD; MAXIGP0_O$AR; reqArs$in$enq__RDY;
//METAINVOKE; MAXIGP0_O$AW__ENA; :reqAws$in$enq__ENA;
//METAGUARD; MAXIGP0_O$AW; reqAws$in$enq__RDY;
//METAINVOKE; MAXIGP0_O$W__ENA; :writeData$in$enq__ENA;
//METAGUARD; MAXIGP0_O$W; writeData$in$enq__RDY;
//METABEFORE; RULEinit__ENA; :RULElread__ENA; :RULElwrite__ENA; :readUser$enq__ENA
//METAGUARD; RULEinit; 1;
//METAINVOKE; RULElR__ENA; :MAXIGP0_I$R__ENA;:readData$out$deq__ENA;:readData$out$first;
//METAGUARD; RULElR; readData$out$first__RDY & readData$out$deq__RDY & MAXIGP0_I$R__RDY;
//METAINVOKE; RULElread__ENA; :readBeat$out$deq__ENA;:readBeat$out$first;1:readData$in$enq__ENA;
//METAEXCLUSIVE; RULElread__ENA; readUser$enq__ENA
//METABEFORE; RULElread__ENA; :MAXIGP0_O$AR__ENA; :readUser$enq__ENA
//METAINVOKE; RULElreadNext__ENA; :readBeat$in$enq__ENA;( readNotFirst != 0 ) ? readLast : ( RULElreadNext__ENA$temp$count == 1 ):reqArs$out$deq__ENA;:reqArs$out$first;
//METAGUARD; RULElreadNext; reqArs$out$first__RDY & readBeat$in$enq__RDY & ( ( ( readNotFirst ? readLast : ( 1 ) ) ^ 1 ) | reqArs$out$deq__RDY );
//METAGUARD; RULElread; readBeat$out$first__RDY & readBeat$out$deq__RDY & readData$in$enq__RDY;
//METAINVOKE; RULElwrite__ENA; portalWControl == 0:user$write$enq__ENA;:writeBeat$out$deq__ENA;:writeBeat$out$first;:writeData$out$deq__ENA;:writeData$out$first;RULElwrite__ENA$wb$last != 0:writeDone$in$enq__ENA;
//METAINVOKE; RULElwriteNext__ENA; ( writeNotFirst != 0 ) ? writeLast : ( RULElwriteNext__ENA$temp$count == 1 ):reqAws$out$deq__ENA;:reqAws$out$first;:writeBeat$in$enq__ENA;
//METAGUARD; RULElwriteNext; reqAws$out$first__RDY & writeBeat$in$enq__RDY & ( ( ( writeNotFirst ? writeLast : ( 1 ) ) ^ 1 ) | reqAws$out$deq__RDY );
//METAGUARD; RULElwrite; writeBeat$out$first__RDY & writeBeat$out$deq__RDY & writeData$out$first__RDY & writeData$out$deq__RDY & ( portalWControl | user$write$enq__RDY );
//METAINVOKE; RULEwriteResponse__ENA; :MAXIGP0_I$B__ENA;:writeDone$out$deq__ENA;:writeDone$out$first;
//METAGUARD; RULEwriteResponse; writeDone$out$first__RDY & MAXIGP0_I$B__RDY & writeDone$out$deq__RDY;
//METAGUARD; readUser$enq; requestLength == 16'd0;
//METARULES; RULEinit; RULElR; RULElread; RULElreadNext; RULElwrite; RULElwriteNext; RULEwriteResponse
//METACONNECT; readUser$enq__ENA; user$read$enq__ENA
//METACONNECT; readUser$enq__RDY; user$read$enq__RDY
`endif
