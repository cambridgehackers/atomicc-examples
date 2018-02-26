`include "lpm.generated.vh"

module l_module_OC_Fifo2 (
    input CLK,
    input nRST,
    input in$enq__ENA,
    input [95:0]in$enq$v,
    output in$enq__RDY,
    input out$deq__ENA,
    output out$deq__RDY,
    output [95:0]out$first,
    output out$first__RDY);
    reg[95:0] element0;
    reg[95:0] element1;
    reg[31:0] rindex;
    reg[31:0] windex;
    assign in$enq__RDY = ((windex + 1) % 2) != rindex;
    assign out$deq__RDY = rindex != windex;
    assign out$first = *(rindex == 0 ? element0:&element1);
    assign out$first__RDY = rindex != windex;

    always @( posedge CLK) begin
      if (!nRST) begin
        element0 <= 0;
        element1 <= 0;
        rindex <= 0;
        windex <= 0;
      end // nRST
      else begin
        if (in$enq__ENA) begin
            *(windex == 0 ? element0:&element1) <= in$enq$v;
            windex <= (windex + 1) % 2;
        end; // End of in$enq__ENA
        if (out$deq__ENA) begin
            rindex <= (rindex + 1) % 2;
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module l_module_OC_Lpm (
    input CLK,
    input nRST,
    input request$say__ENA,
    input [31:0]request$say$meth,
    input [31:0]request$say$v,
    output request$say__RDY,
    output ind$heard__ENA,
    output [31:0]ind$heard$meth,
    output [31:0]ind$heard$v,
    input ind$heard__RDY);
    reg[31:0] doneCount;
    wire fifo$in$enq__RDY;
    wire fifo$out$deq__RDY;
    wire [95:0]fifo$out$first;
    wire fifo$out$first__RDY;
    wire inQ$out$deq__RDY;
    wire inQ$out$first__RDY;
    wire mem$ifc$req__RDY;
    wire mem$ifc$resAccept__RDY;
    wire [95:0]mem$ifc$resValue;
    wire mem$ifc$resValue__RDY;
    wire outQ$in$enq__RDY;
    wire outQ$out$deq__RDY;
    wire outQ$out$first__RDY;
    wire [31:0]request$say__ENA$temp$a;
    wire [31:0]request$say__ENA$temp$b;
    wire [31:0]request$say__ENA$temp$c;
    wire [31:0]respond__ENA$temp$a;
    wire [31:0]respond__ENA$temp$b;
    l_module_OC_Fifo1 inQ (
        CLK,
        nRST,
        request$say__ENA,
        { request$say__ENA$temp$a , request$say__ENA$temp$b , request$say__ENA$temp$c },
        request$say__RDY,
        enter__ENA,
        inQ$out$deq__RDY,
        enter__ENA$temp,
        inQ$out$first__RDY);
    l_module_OC_Fifo2 fifo (
        CLK,
        nRST,
        enter__ENA || recirc__ENA,
        enter__ENA ? enter__ENA$temp : recirc__ENA$mtemp,
        fifo$in$enq__RDY,
        exit_rule__ENA || recirc__ENA,
        fifo$out$deq__RDY,
        exit_rule__ENA$temp,
        fifo$out$first__RDY);
    l_module_OC_Fifo1 outQ (
        CLK,
        nRST,
        exit_rule__ENA,
        fifo$out$first,
        outQ$in$enq__RDY,
        respond__ENA,
        outQ$out$deq__RDY,
        respond__ENA$temp,
        outQ$out$first__RDY);
    l_module_OC_LpmMemory mem (
        CLK,
        nRST,
        enter__ENA || recirc__ENA,
        enter__ENA ? enter__ENA$temp : recirc__ENA$temp,
        mem$ifc$req__RDY,
        exit_rule__ENA || recirc__ENA,
        mem$ifc$resAccept__RDY,
        exit_rule__ENA$mtemp,
        mem$ifc$resValue__RDY);
    assign ind$heard$meth = respond__ENA$temp$a;
    assign ind$heard$v = respond__ENA$temp$b;
    assign ind$heard__ENA = respond__ENA;
    // Extra assigments, not to output wires
    assign enter__RDY = ((inQ$out$first__RDY & inQ$out$deq__RDY) & fifo$in$enq__RDY) & mem$ifc$req__RDY;
    assign exit_rule__RDY = (((fifo$out$first__RDY & mem$ifc$resValue__RDY) & mem$ifc$resAccept__RDY) & fifo$out$deq__RDY) & outQ$in$enq__RDY;
    assign recirc__ENA$mtemp = mem$ifc$resValue;
    assign recirc__ENA$temp = fifo$out$first;
    assign recirc__RDY = ((((fifo$out$first__RDY & mem$ifc$resValue__RDY) & mem$ifc$resAccept__RDY) & fifo$out$deq__RDY) & fifo$in$enq__RDY) & mem$ifc$req__RDY;
    assign request$say__ENA$temp$a = request$say$meth;
    assign request$say__ENA$temp$b = request$say$v;
    assign respond__RDY = (outQ$out$first__RDY & outQ$out$deq__RDY) & ind$heard__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
        doneCount <= 0;
      end // nRST
    end // always @ (posedge CLK)
endmodule 

module l_module_OC_LpmMemory (
    input CLK,
    input nRST,
    input ifc$req__ENA,
    input [95:0]ifc$req$v,
    output ifc$req__RDY,
    input ifc$resAccept__ENA,
    output ifc$resAccept__RDY,
    output [95:0]ifc$resValue,
    output ifc$resValue__RDY);
    reg[31:0] delayCount;
    reg[95:0] saved;
    assign ifc$req__RDY = delayCount == 0;
    assign ifc$resAccept__RDY = delayCount == 1;
    assign ifc$resValue = saved;
    assign ifc$resValue__RDY = delayCount == 1;
    // Extra assigments, not to output wires
    assign memdelay_rule__RDY = delayCount > 1;

    always @( posedge CLK) begin
      if (!nRST) begin
        delayCount <= 0;
        saved <= 0;
      end // nRST
      else begin
        if (ifc$req__ENA) begin
            delayCount <= 4;
            saved <= ifc$req$v;
        end; // End of ifc$req__ENA
        if (ifc$resAccept__ENA) begin
            delayCount <= 0;
        end; // End of ifc$resAccept__ENA
        if (memdelay_rule__ENA) begin
            delayCount <= delayCount - 1;
        end; // End of memdelay_rule__ENA
      end
    end // always @ (posedge CLK)
endmodule 

