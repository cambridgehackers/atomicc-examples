`include "atomicclib.vh"

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
