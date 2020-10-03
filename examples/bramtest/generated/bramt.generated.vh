`ifndef __bramt_GENERATED__VH__
`define __bramt_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __BtestRequest_DEF__
`define __BtestRequest_DEF__
interface BtestRequest;
    logic read__ENA;
    logic [32 - 1:0] read$addr;
    logic read__RDY;
    logic write__ENA;
    logic [32 - 1:0] write$addr;
    logic [32 - 1:0] write$data;
    logic write__RDY;
    modport server (input  read__ENA, read$addr, write__ENA, write$addr, write$data,
                    output read__RDY, write__RDY);
    modport client (output read__ENA, read$addr, write__ENA, write$addr, write$data,
                    input  read__RDY, write__RDY);
endinterface
`endif
`ifndef __BtestIndication_DEF__
`define __BtestIndication_DEF__
interface BtestIndication;
    logic heard__ENA;
    logic [32 - 1:0] heard$v;
    logic heard__RDY;
    modport server (input  heard__ENA, heard$v,
                    output heard__RDY);
    modport client (output heard__ENA, heard$v,
                    input  heard__RDY);
endinterface
`endif
//METASTART; Btest
//METAINTERNAL; bram; BRAM(width=4,depth=1024);
//METAINVOKE; request.write__ENA; :bram$write__ENA;
//METAGUARD; request.write; bram$write__RDY;
//METAINVOKE; request.read__ENA; :bram$read__ENA;
//METAEXCLUSIVE; request.read__ENA; RULE$callBack__ENA
//METAGUARD; request.read; bram$read__RDY;
//METAINVOKE; RULE$callBack__ENA; :indication.heard__ENA;
//METAGUARD; RULE$callBack; !( ( 0 == waitRead ) || ( !( bram$dataOut__RDY && indication.heard__RDY ) ) );
//METARULES; RULE$callBack
//METASTART; l_top
//METAINTERNAL; M2P__indication; ___M2PBtestIndication;
//METAINTERNAL; DUT__Btest; Btest;
//METAINTERNAL; P2M__request; ___P2MBtestRequest;
//METACONNECT; DUT__Btest$indication.heard__ENA; M2P__indication$method.heard__ENA
//METACONNECT; DUT__Btest$indication.heard__RDY; M2P__indication$method.heard__RDY
//METACONNECT; DUT__Btest$request.read__ENA; P2M__request$method.read__ENA
//METACONNECT; DUT__Btest$request.read__RDY; P2M__request$method.read__RDY
//METACONNECT; DUT__Btest$request.write__ENA; P2M__request$method.write__ENA
//METACONNECT; DUT__Btest$request.write__RDY; P2M__request$method.write__RDY
//METACONNECT; P2M__request$pipe.enq__ENA; request.enq__ENA
//METACONNECT; P2M__request$pipe.enq__RDY; request.enq__RDY
//METACONNECT; indication.enq__ENA; M2P__indication$pipe.enq__ENA
//METACONNECT; indication.enq__RDY; M2P__indication$pipe.enq__RDY
//METASTART; ___M2PBtestIndication
//METAINVOKE; method.heard__ENA; :pipe.enq__ENA;
//METAGUARD; method.heard; pipe.enq__RDY;
//METASTART; ___P2MBtestRequest
//METAINVOKE; pipe.enq__ENA; pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0:method.read__ENA;pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd1:method.write__ENA;
//METAGUARD; pipe.enq; ( method.read__RDY && ( method.write__RDY || ( !( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd1 ) ) ) ) || ( ( !method.read__RDY ) && ( !( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0 ) || ( !( method.write__RDY || ( !( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd1 ) ) ) ) ) ) );
`endif
