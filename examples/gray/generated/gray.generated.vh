`ifndef __gray_GENERATED__VH__
`define __gray_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __GrayCounterIfc_DEF__
`define __GrayCounterIfc_DEF__
interface GrayCounterIfc#(width = 4);
    logic increment__ENA;
    logic increment__RDY;
    logic decrement__ENA;
    logic decrement__RDY;
    logic [width - 1:0] readGray;
    logic readGray__RDY;
    logic writeGray__ENA;
    logic [width - 1:0] writeGray$v;
    logic writeGray__RDY;
    logic [width - 1:0] readBin;
    logic readBin__RDY;
    logic writeBin__ENA;
    logic [width - 1:0] writeBin$v;
    logic writeBin__RDY;
    modport server (input  increment__ENA, decrement__ENA, writeGray__ENA, writeGray$v, writeBin__ENA, writeBin$v,
                    output increment__RDY, decrement__RDY, readGray, readGray__RDY, writeGray__RDY, readBin, readBin__RDY, writeBin__RDY);
    modport client (output increment__ENA, decrement__ENA, writeGray__ENA, writeGray$v, writeBin__ENA, writeBin$v,
                    input  increment__RDY, decrement__RDY, readGray, readGray__RDY, writeGray__RDY, readBin, readBin__RDY, writeBin__RDY);
endinterface
`endif
`ifndef __GrayCounterIfc_DEF__
`define __GrayCounterIfc_DEF__
interface GrayCounterIfc#(width = width);
    logic increment__ENA;
    logic increment__RDY;
    logic decrement__ENA;
    logic decrement__RDY;
    logic [width - 1:0] readGray;
    logic readGray__RDY;
    logic writeGray__ENA;
    logic [width - 1:0] writeGray$v;
    logic writeGray__RDY;
    logic [width - 1:0] readBin;
    logic readBin__RDY;
    logic writeBin__ENA;
    logic [width - 1:0] writeBin$v;
    logic writeBin__RDY;
    modport server (input  increment__ENA, decrement__ENA, writeGray__ENA, writeGray$v, writeBin__ENA, writeBin$v,
                    output increment__RDY, decrement__RDY, readGray, readGray__RDY, writeGray__RDY, readBin, readBin__RDY, writeBin__RDY);
    modport client (output increment__ENA, decrement__ENA, writeGray__ENA, writeGray$v, writeBin__ENA, writeBin$v,
                    input  increment__RDY, decrement__RDY, readGray, readGray__RDY, writeGray__RDY, readBin, readBin__RDY, writeBin__RDY);
endinterface
`endif
//METASTART; Test
//METAINTERNAL; counter; GrayCounter(width=4);
//METACONNECT; request.increment__ENA; counter.increment__ENA
//METACONNECT; request.increment__RDY; counter.increment__RDY
//METACONNECT; request.decrement__ENA; counter.decrement__ENA
//METACONNECT; request.decrement__RDY; counter.decrement__RDY
//METACONNECT; request.readGray; counter.readGray
//METACONNECT; request.readGray__RDY; counter.readGray__RDY
//METACONNECT; request.writeGray__ENA; counter.writeGray__ENA
//METACONNECT; request.writeGray__RDY; counter.writeGray__RDY
//METACONNECT; request.readBin; counter.readBin
//METACONNECT; request.readBin__RDY; counter.readBin__RDY
//METACONNECT; request.writeBin__ENA; counter.writeBin__ENA
//METACONNECT; request.writeBin__RDY; counter.writeBin__RDY
//METASTART; l_top
//METAINTERNAL; DUT__Test; Test;
//METAINTERNAL; P2M__request; ___P2MGrayCounterIfc(width=4);
//METACONNECT; DUT__Test$request.increment__ENA; P2M__request$method.increment__ENA
//METACONNECT; DUT__Test$request.increment__RDY; P2M__request$method.increment__RDY
//METACONNECT; DUT__Test$request.decrement__ENA; P2M__request$method.decrement__ENA
//METACONNECT; DUT__Test$request.decrement__RDY; P2M__request$method.decrement__RDY
//METACONNECT; DUT__Test$request.readGray; P2M__request$method.readGray
//METACONNECT; DUT__Test$request.readGray__RDY; P2M__request$method.readGray__RDY
//METACONNECT; DUT__Test$request.writeGray__ENA; P2M__request$method.writeGray__ENA
//METACONNECT; DUT__Test$request.writeGray__RDY; P2M__request$method.writeGray__RDY
//METACONNECT; DUT__Test$request.readBin; P2M__request$method.readBin
//METACONNECT; DUT__Test$request.readBin__RDY; P2M__request$method.readBin__RDY
//METACONNECT; DUT__Test$request.writeBin__ENA; P2M__request$method.writeBin__ENA
//METACONNECT; DUT__Test$request.writeBin__RDY; P2M__request$method.writeBin__RDY
//METACONNECT; P2M__request$pipe.enq__ENA; request.enq__ENA
//METACONNECT; P2M__request$pipe.enq__RDY; request.enq__RDY
//METACONNECT; indication.enq__ENA; P2M__request$returnInd.enq__ENA
//METACONNECT; indication.enq__RDY; P2M__request$returnInd.enq__RDY
//METASTART; ___P2MGrayCounterIfc
//METAINVOKE; pipe.enq__ENA; pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd1:method.decrement__ENA;pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0:method.increment__ENA;pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd5:method.writeBin__ENA;pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd3:method.writeGray__ENA;pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd2:returnInd.enq__ENA;pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == width:returnInd.enq__ENA;
//METAGUARD; pipe.enq; ( method.increment__RDY && ( ( method.decrement__RDY && returnInd.enq__RDY && ( ( method.writeGray__RDY && ( method.writeBin__RDY || ( !( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd5 ) ) ) ) || ( ( !method.writeGray__RDY ) && ( !( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd3 ) || ( !( method.writeBin__RDY || ( !( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd5 ) ) ) ) ) ) ) ) ) || ( ( !method.decrement__RDY ) && ( !( ( method.writeGray__RDY && ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd1 ) || ( !( method.writeBin__RDY || ( !( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd5 ) ) ) ) ) ) || ( ( !method.writeGray__RDY ) && ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd3 ) || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd1 ) || ( !( method.writeBin__RDY || ( !( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd5 ) ) ) ) ) ) || ( !returnInd.enq__RDY ) ) ) ) ) ) || ( ( !method.increment__RDY ) && ( !( ( method.decrement__RDY && ( ( method.writeGray__RDY && ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0 ) || ( !( method.writeBin__RDY || ( !( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd5 ) ) ) ) ) ) || ( ( !method.writeGray__RDY ) && ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd3 ) || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0 ) || ( !( method.writeBin__RDY || ( !( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd5 ) ) ) ) ) ) || ( !returnInd.enq__RDY ) ) ) || ( ( !method.decrement__RDY ) && ( ( method.writeGray__RDY && ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd1 ) || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0 ) || ( !( method.writeBin__RDY || ( !( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd5 ) ) ) ) ) ) || ( ( !method.writeGray__RDY ) && ( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd3 ) || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd1 ) || ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0 ) || ( !( method.writeBin__RDY || ( !( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd5 ) ) ) ) ) ) || ( !returnInd.enq__RDY ) ) ) ) ) );
`endif
