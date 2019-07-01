`ifndef __grayCounter_GENERATED__VH__
`define __grayCounter_GENERATED__VH__

//METASTART; GrayCounter
//METABEFORE; RULE$incdec__ENA; :ifc$writeBin__ENA; :ifc$writeGray__ENA
//METAGUARD; RULE$incdec; !( ifc$increment__ENA == ifc$decrement__ENA );
//METAGUARD; ifc$decrement; 1;
//METAGUARD; ifc$increment; 1;
//METABEFORE; ifc$readBin; :RULE$incdec__ENA; :ifc$writeBin__ENA; :ifc$writeGray__ENA
//METAGUARD; ifc$readBin; 1;
//METAGUARD; ifc$readGray; 1;
//METAGUARD; ifc$writeBin; 1;
//METAGUARD; ifc$writeGray; 1;
//METARULES; RULE$incdec
`endif
