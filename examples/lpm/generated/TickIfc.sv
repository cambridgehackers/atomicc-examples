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
