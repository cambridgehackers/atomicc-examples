`ifndef __MultiCycleProc_GENERATED__VH__
`define __MultiCycleProc_GENERATED__VH__

//METASTART; MultiCycleProc
//METAEXTERNAL; dec; Decoder;
//METAEXTERNAL; exec; Executer;
//METAEXTERNAL; rf; RegFile;
//METAEXTERNAL; pgm; IMem;
//METAEXTERNAL; dmem; DMem;
//METAINVOKE; RULE$decode__ENA; :dec$getAddr;:dec$getArithOp;:dec$getDst;:dec$getOp;:dec$getSrc1;:dec$getSrc2;:pgm$read;
//METAEXCLUSIVE; RULE$decode__ENA; RULE$execArith__ENA
//METAGUARD; RULE$decode; ( d2e_valid == 0 ) && pgm$read__RDY && dec$getOp__RDY && dec$getArithOp__RDY && dec$getSrc1__RDY && dec$getSrc2__RDY && dec$getDst__RDY && dec$getAddr__RDY;
//METAINVOKE; RULE$execArith__ENA; :exec$basicExec;:rf$read;
//METAEXCLUSIVE; RULE$execArith__ENA; RULE$writeBack__ENA
//METAGUARD; RULE$execArith; ( d2e_valid == 1 ) && ( e2w_valid == 0 ) && rf$read__RDY && exec$basicExec__RDY;
//METAINVOKE; RULE$writeBack__ENA; :rf$write__ENA;
//METABEFORE; RULE$writeBack__ENA; :RULE$execArith__ENA
//METAGUARD; RULE$writeBack; ( e2w_valid == 1 ) && rf$write__RDY;
//METARULES; RULE$decode; RULE$execArith; RULE$writeBack
`endif
