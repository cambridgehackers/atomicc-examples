`include "atomicclib.vh"

//METASTART; LfsrEquiv
//METAINTERNAL; fib; LfsrFib(LN=8,TAPS=45);
//METAINTERNAL; gal; LfsrGal(LN=8,TAPS=45);
//METAINVOKE; shiftBit__ENA; :fib$shiftBit__ENA;:gal$shiftBit__ENA;
//METAGUARD; shiftBit; fib$shiftBit__RDY && gal$shiftBit__RDY;
//METAGUARD; outBit; 1'd1;
//METAGUARD; RULE$updateRule; fib$outBit__RDY && gal$outBit__RDY;
//METARULES; RULE$updateRule
//METASTART; LfsrFib
//METAGUARD; shiftBit; 1'd1;
//METAGUARD; outBit; 1'd1;
//METASTART; LfsrGal
//METAGUARD; shiftBit; 1'd1;
//METAGUARD; outBit; 1'd1;
