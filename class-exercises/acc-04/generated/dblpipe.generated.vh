`ifndef __dblpipe_GENERATED__VH__
`define __dblpipe_GENERATED__VH__

//METASTART; DblPipe
//METAINTERNAL; one; LfsrFib(LN=8,TAPS=45);
//METAINTERNAL; two; LfsrFib(LN=8,TAPS=45);
//METAINVOKE; shiftBit__ENA; :one$shiftBit__ENA;:two$shiftBit__ENA;
//METAGUARD; shiftBit; one$shiftBit__RDY && two$shiftBit__RDY;
//METAGUARD; outBit; 1;
//METAINVOKE; RULE$updateRule__ENA; :one$outBit;:two$outBit;
//METAGUARD; RULE$updateRule; one$outBit__RDY && two$outBit__RDY;
//METARULES; RULE$updateRule
//METASTART; LfsrFib
//METAGUARD; shiftBit; 1;
//METAGUARD; outBit; 1;
`endif
