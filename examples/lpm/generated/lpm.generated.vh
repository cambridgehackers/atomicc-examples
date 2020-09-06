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
    modport server (input  enter__ENA, enter$x,
                    output enter__RDY);
    modport client (output enter__ENA, enter$x,
                    input  enter__RDY);
endinterface
`endif
`ifndef __LpmMem_DEF__
`define __LpmMem_DEF__
interface LpmMem;
    logic req__ENA;
    logic [32 - 1:0] req$v;
    logic req__RDY;
    logic resAccept__ENA;
    logic resAccept__RDY;
    logic [32 - 1:0] resValue;
    logic resValue__RDY;
    modport server (input  req__ENA, req$v, resAccept__ENA,
                    output req__RDY, resAccept__RDY, resValue, resValue__RDY);
    modport client (output req__ENA, req$v, resAccept__ENA,
                    input  req__RDY, resAccept__RDY, resValue, resValue__RDY);
endinterface
`endif
//METASTART; Lpm
//METAINTERNAL; compBuf; BufTicket;
//METAINTERNAL; inQ; Fifo1Base(width=32);
//METAINTERNAL; fifo; FifoB1Base(width=23);
//METAINTERNAL; mem; LpmMemory;
//METAINVOKE; enter__ENA; :inQ$in.enq__ENA;
//METAGUARD; enter; inQ$in.enq__RDY;
//METAINVOKE; RULE$recirc__ENA; :fifo$in.enq__ENA;:fifo$out.deq__ENA;:mem$req__ENA;:mem$resAccept__ENA;
//METAEXCLUSIVE; RULE$recirc__ENA; RULE$enter__ENA; RULE$exitr__ENA
//METAGUARD; RULE$recirc; !( ( 0 == ( ( ( mem$resValue & 1 ) == 1 ) ^ 1 ) ) || ( !( mem$resValue__RDY && fifo$out.first__RDY && mem$resAccept__RDY && mem$req__RDY && fifo$out.deq__RDY && fifo$in.enq__RDY ) ) );
//METAINVOKE; RULE$exitr__ENA; :fifo$out.deq__ENA;:mem$resAccept__ENA;:outQ.enq__ENA;
//METAGUARD; RULE$exitr; ( ( mem$resValue & 1 ) == 1 ) && ( RULE$recirc__ENA == 0 ) && mem$resValue__RDY && fifo$out.first__RDY && mem$resAccept__RDY && fifo$out.deq__RDY && outQ.enq__RDY;
//METAINVOKE; RULE$enter__ENA; :fifo$in.enq__ENA;:inQ$out.deq__ENA;:mem$req__ENA;
//METAGUARD; RULE$enter; !( ( 0 == ( ( RULE$recirc__ENA != 0 ) ^ 1 ) ) || ( !( inQ$out.first__RDY && inQ$out.deq__RDY && fifo$in.enq__RDY && mem$req__RDY ) ) );
//METARULES; RULE$recirc; RULE$exitr; RULE$enter
`endif
