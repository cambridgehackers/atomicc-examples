`ifndef __gray_GENERATED__VH__
`define __gray_GENERATED__VH__

//METASTART; l_top
//METAINTERNAL; DUT__Test; GrayCounter(width=4);
//METAINTERNAL; P2M__request; ___P2MGrayCounterIfc(width=4);
//METACONNECT; DUT__Test$request$increment__ENA; P2M__request$method$increment__ENA
//METACONNECT; DUT__Test$request$increment__RDY; P2M__request$method$increment__RDY
//METACONNECT; DUT__Test$request$decrement__ENA; P2M__request$method$decrement__ENA
//METACONNECT; DUT__Test$request$decrement__RDY; P2M__request$method$decrement__RDY
//METACONNECT; DUT__Test$request$readGray; P2M__request$method$readGray
//METACONNECT; DUT__Test$request$readGray__RDY; P2M__request$method$readGray__RDY
//METACONNECT; DUT__Test$request$writeGray__ENA; P2M__request$method$writeGray__ENA
//METACONNECT; DUT__Test$request$writeGray__RDY; P2M__request$method$writeGray__RDY
//METACONNECT; DUT__Test$request$readBin; P2M__request$method$readBin
//METACONNECT; DUT__Test$request$readBin__RDY; P2M__request$method$readBin__RDY
//METACONNECT; DUT__Test$request$writeBin__ENA; P2M__request$method$writeBin__ENA
//METACONNECT; DUT__Test$request$writeBin__RDY; P2M__request$method$writeBin__RDY
//METACONNECT; request$enq__ENA; P2M__request$pipe$enq__ENA
//METACONNECT; request$enq__RDY; P2M__request$pipe$enq__RDY
//METACONNECT; indication$enq__ENA; P2M__request$returnInd$enq__ENA
//METACONNECT; indication$enq__RDY; P2M__request$returnInd$enq__RDY
//METASTART; ___P2MGrayCounterIfc
//METAEXTERNAL; returnInd; PipeIn;
//METAINVOKE; pipe$enq__ENA; pipe$enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd1:method$decrement__ENA;pipe$enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0:method$increment__ENA;pipe$enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd5:method$writeBin__ENA;pipe$enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd3:method$writeGray__ENA;pipe$enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd2:returnInd$enq__ENA;pipe$enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == width:returnInd$enq__ENA;
//METAGUARD; pipe$enq; method$increment__RDY && method$decrement__RDY && returnInd$enq__RDY && method$writeGray__RDY && method$writeBin__RDY;
`endif
