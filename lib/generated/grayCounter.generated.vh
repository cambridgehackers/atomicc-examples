`ifndef __grayCounter_GENERATED__VH__
`define __grayCounter_GENERATED__VH__

//METASTART; GrayCounter
//METAINTERNAL; trace; VsimTrace;
//METAEXCLUSIVE; RULE$incdec__ENA; ifc$writeBin__ENA
//METABEFORE; RULE$incdec__ENA; :ifc$writeBin__ENA; :ifc$writeGray__ENA
//METAGUARD; RULE$incdec; !( ifc$increment__ENA == ifc$decrement__ENA );
//METAGUARD; ifc$decrement; 1;
//METAINVOKE; ifc$flag__ENA; :trace$flag__ENA;
//METAGUARD; ifc$flag; trace$flag__RDY;
//METAGUARD; ifc$increment; 1;
//METAGUARD; ifc$readBin; 1;
//METAGUARD; ifc$readGray; 1;
//METAGUARD; ifc$writeBin; 1;
//METAGUARD; ifc$writeGray; 1;
//METARULES; RULE$incdec
`endif
