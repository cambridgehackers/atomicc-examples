`ifndef __grayCounter_GENERATED__VH__
`define __grayCounter_GENERATED__VH__

//METASTART; GrayCounter
//METAGUARD; ifc$increment; 1;
//METAGUARD; ifc$decrement; 1;
//METAGUARD; ifc$readGray; 1;
//METAGUARD; ifc$writeGray; 1;
//METAGUARD; ifc$readBin; 1;
//METAEXCLUSIVE; ifc$writeBin__ENA; RULE$incdec__ENA
//METAGUARD; ifc$writeBin; 1;
//METABEFORE; RULE$incdec__ENA; :ifc$writeBin__ENA; :ifc$writeGray__ENA
//METAGUARD; RULE$incdec; !( ifc$increment__ENA == ifc$decrement__ENA );
//METARULES; RULE$incdec
`endif
