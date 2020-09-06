`ifndef __lpmmemory_GENERATED__VH__
`define __lpmmemory_GENERATED__VH__
`include "atomicclib.vh"

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
//METASTART; LpmMemory
//METAEXCLUSIVE; req__ENA; RULE$memdelay_rule__ENA; resAccept__ENA
//METAGUARD; req; delayCount == 0;
//METAEXCLUSIVE; resAccept__ENA; RULE$memdelay_rule__ENA
//METAGUARD; resAccept; delayCount == 1;
//METAGUARD; resValue; delayCount == 1;
//METAGUARD; RULE$memdelay_rule; 0 != ( delayCount > 1 );
//METARULES; RULE$memdelay_rule
`endif
