`ifndef __lpm_GENERATED__VH__
`define __lpm_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __ProcessData_DEF__
`define __ProcessData_DEF__
typedef struct packed {
    logic [3 - 1:0] state;
    logic [16 - 1:0] IPA;
    logic [4 - 1:0] ticket;
} ProcessData;
`endif
`ifndef __TickIfc_DEF__
`define __TickIfc_DEF__
interface TickIfc;
    logic [4 - 1:0] getTicket;
    logic getTicket__RDY;
    logic allocateTicket__ENA;
    logic allocateTicket__RDY;
    modport server (input  allocateTicket__ENA,
                    output getTicket, getTicket__RDY, allocateTicket__RDY);
    modport client (output allocateTicket__ENA,
                    input  getTicket, getTicket__RDY, allocateTicket__RDY);
endinterface
`endif
`ifndef __LpmIfc_DEF__
`define __LpmIfc_DEF__
interface LpmIfc;
    logic enter__ENA;
    logic [32 - 1:0] enter$x;
    logic enter__RDY;
    logic write__ENA;
    logic [32 - 1:0] write$addr;
    logic [32 - 1:0] write$data;
    logic write__RDY;
    modport server (input  enter__ENA, enter$x, write__ENA, write$addr, write$data,
                    output enter__RDY, write__RDY);
    modport client (output enter__ENA, enter$x, write__ENA, write$addr, write$data,
                    input  enter__RDY, write__RDY);
endinterface
`endif
`ifndef __LpmMemIfc_DEF__
`define __LpmMemIfc_DEF__
interface LpmMemIfc;
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
`ifndef __LpmRequest_DEF__
`define __LpmRequest_DEF__
interface LpmRequest;
    logic enter__ENA;
    logic [32 - 1:0] enter$data;
    logic enter__RDY;
    logic write__ENA;
    logic [32 - 1:0] write$addr;
    logic [32 - 1:0] write$data;
    logic write__RDY;
    modport server (input  enter__ENA, enter$data, write__ENA, write$addr, write$data,
                    output enter__RDY, write__RDY);
    modport client (output enter__ENA, enter$data, write__ENA, write$addr, write$data,
                    input  enter__RDY, write__RDY);
endinterface
`endif
`ifndef __LpmIndication_DEF__
`define __LpmIndication_DEF__
interface LpmIndication;
    logic out__ENA;
    logic [32 - 1:0] out$data;
    logic out__RDY;
    modport server (input  out__ENA, out$data,
                    output out__RDY);
    modport client (output out__ENA, out$data,
                    input  out__RDY);
endinterface
`endif
//METASTART; BufTicket
//METAGUARD; getTicket; 1'd1;
//METAGUARD; allocateTicket; 1'd1;
//METASTART; Lpm
//METAINTERNAL; inQ; Fifo1Base(width=32);
//METAINTERNAL; compBuf; BufTicket;
//METAINTERNAL; fifo; Fifo1Base(width=23);
//METAINTERNAL; mem; LpmMem;
//METAINVOKE; enter__ENA; :inQ$in.enq__ENA;
//METAGUARD; enter; inQ$in.enq__RDY;
//METAINVOKE; RULE$enterRule__ENA; :compBuf$allocateTicket__ENA;:fifo$in.enq__ENA;:inQ$out.deq__ENA;:mem$read__ENA;
//METAEXCLUSIVE; RULE$enterRule__ENA; RULE$recircRule__ENA
//METAGUARD; RULE$enterRule; !( ( 0 == ( ( RULE$recircRule__ENA != 0 ) ^ 1 ) ) || ( !( inQ$out.first__RDY && compBuf$getTicket__RDY && compBuf$allocateTicket__RDY && inQ$out.deq__RDY && fifo$in.enq__RDY && mem$read__RDY ) ) );
//METAINVOKE; RULE$recircRule__ENA; :fifo$in.enq__ENA;:fifo$out.deq__ENA;:mem$out.deq__ENA;:mem$read__ENA;
//METAEXCLUSIVE; RULE$recircRule__ENA; RULE$exitRule__ENA
//METAGUARD; RULE$recircRule; !( ( 0 == ( ( ( mem$out$first & 1 ) == 1 ) ^ 1 ) ) || ( !( mem$out.first__RDY && fifo$out.first__RDY && mem$out.deq__RDY && mem$read__RDY && fifo$out.deq__RDY && fifo$in.enq__RDY ) ) );
//METAINVOKE; RULE$exitRule__ENA; :fifo$out.deq__ENA;:mem$out.deq__ENA;:outQ.enq__ENA;
//METAGUARD; RULE$exitRule; ( ( mem$out$first & 1 ) == 1 ) && ( RULE$recircRule__ENA == 0 ) && mem$out.first__RDY && fifo$out.first__RDY && outQ.enq__RDY && mem$out.deq__RDY && fifo$out.deq__RDY;
//METAINVOKE; write__ENA; :mem$write__ENA;
//METAGUARD; write; mem$write__RDY;
//METARULES; RULE$enterRule; RULE$recircRule; RULE$exitRule
//METASTART; LpmMem
//METAINTERNAL; RAM; BRAM(width=32,depth=1024);
//METAINVOKE; read__ENA; :RAM$read__ENA;
//METAEXCLUSIVE; read__ENA; out.deq__ENA
//METAGUARD; read; !( ( 0 == ( valid ^ 1 ) ) || ( !RAM$read__RDY ) );
//METAGUARD; out.first; !( ( 0 == valid ) || ( !RAM$dataOut__RDY ) );
//METAGUARD; out.deq; 0 != valid;
//METAINVOKE; write__ENA; :RAM$write__ENA;
//METAGUARD; write; RAM$write__RDY;
//METASTART; LpmTest
//METAINTERNAL; test; Lpm;
//METAINVOKE; request.enter__ENA; :test$enter__ENA;
//METAGUARD; request.enter; test$enter__RDY;
//METAINVOKE; request.write__ENA; :test$write__ENA;
//METAGUARD; request.write; test$write__RDY;
//METAINVOKE; response.enq__ENA; :indication.out__ENA;
//METAGUARD; response.enq; indication.out__RDY;
//METACONNECT; response.enq__ENA; test$outQ.enq__ENA
//METACONNECT; response.enq__RDY; test$outQ.enq__RDY
//METASTART; l_top
//METAINTERNAL; M2P__indication; ___M2PLpmIndication;
//METAINTERNAL; DUT__LpmTest; LpmTest;
//METAINTERNAL; P2M__request; ___P2MLpmRequest;
//METACONNECT; DUT__LpmTest$indication.out__ENA; M2P__indication$method.out__ENA
//METACONNECT; DUT__LpmTest$indication.out__RDY; M2P__indication$method.out__RDY
//METACONNECT; DUT__LpmTest$request.enter__ENA; P2M__request$method.enter__ENA
//METACONNECT; DUT__LpmTest$request.enter__RDY; P2M__request$method.enter__RDY
//METACONNECT; DUT__LpmTest$request.write__ENA; P2M__request$method.write__ENA
//METACONNECT; DUT__LpmTest$request.write__RDY; P2M__request$method.write__RDY
//METACONNECT; P2M__request$pipe.enq__ENA; request.enq__ENA
//METACONNECT; P2M__request$pipe.enq__RDY; request.enq__RDY
//METACONNECT; indication.enq__ENA; M2P__indication$pipe.enq__ENA
//METACONNECT; indication.enq__RDY; M2P__indication$pipe.enq__RDY
//METASTART; ___M2PLpmIndication
//METAINVOKE; method.out__ENA; :pipe.enq__ENA;
//METAGUARD; method.out; pipe.enq__RDY;
//METASTART; ___P2MLpmRequest
//METAINVOKE; pipe.enq__ENA; pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0:method.enter__ENA;pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd1:method.write__ENA;
//METAGUARD; pipe.enq; ( method.enter__RDY && ( method.write__RDY || ( !( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd1 ) ) ) ) || ( ( !method.enter__RDY ) && ( !( ( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd0 ) || ( !( method.write__RDY || ( !( pipe.enq$v[ ( ( 16 + 128 ) - 1 ) : ( ( 16 + 128 ) - 16 ) ] == 16'd1 ) ) ) ) ) ) );
`endif
