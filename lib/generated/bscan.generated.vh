`ifndef __bscan_GENERATED__VH__
`define __bscan_GENERATED__VH__

//METASTART; Bscan
//METAINTERNAL; bscan; BSCANE2;
//METAINTERNAL; tckbuf; BUFG;
//METAINTERNAL; localBscan; BscanLocal(width=32);
//METAINVOKE; toBscan$enq__ENA; :localBscan$toBscan$enq__ENA;
//METAGUARD; toBscan$enq; localBscan$toBscan$enq__RDY;
//METAINVOKE; readBscan$enq__ENA; :fromBscan$enq__ENA;
//METAGUARD; readBscan$enq; fromBscan$enq__RDY;
//METAGUARD; RULE$init; 1;
//METARULES; RULE$init
//METASTART; BscanLocal
//METAEXCLUSIVE; toBscan$enq__ENA; RULE$shiftRule__ENA; RULE$updateRule__ENA
//METAGUARD; toBscan$enq; !( notReady || ( !capture ) );
//METAGUARD; RULE$shiftRule; shift;
//METAINVOKE; RULE$updateRule__ENA; :fromBscan$enq__ENA;
//METAGUARD; RULE$updateRule; update && fromBscan$enq__RDY;
//METABEFORE; RULE$init__ENA; :RULE$shiftRule__ENA; :toBscan$enq__ENA
//METAGUARD; RULE$init; 1;
//METARULES; RULE$shiftRule; RULE$updateRule; RULE$init
`endif
