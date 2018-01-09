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
    wire in$enq__RDY_internal;
    wire out$deq__RDY_internal;
    reg[95:0] element0;
    reg[95:0] element1;
    reg[95:0] element2;
    reg[31:0] rindex;
    reg[31:0] windex;
    assign in$enq__RDY_internal = ((windex + 1) % 2) != rindex;
    assign out$deq__RDY_internal = rindex != windex;
    assign out$first = *(rindex == 0 ? element0:&element1);
    assign out$first__RDY_internal = rindex != windex;
    assign in$enq__RDY = in$enq__RDY_internal;
    assign out$deq__RDY = out$deq__RDY_internal;

    always @( posedge CLK) begin
      if (!nRST) begin
        element0 <= 0;
        element1 <= 0;
        element2 <= 0;
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
    wire ifc$req__RDY_internal;
    wire ifc$resAccept__RDY_internal;
    reg[31:0] delayCount;
    reg[95:0] saved;
    assign ifc$req__RDY_internal = delayCount == 0;
    assign ifc$resAccept__RDY_internal = delayCount == 1;
    assign ifc$resValue = saved;
    assign ifc$resValue__RDY_internal = delayCount == 1;
    assign memdelay_rule__RDY_internal = delayCount > 1;
    assign ifc$req__RDY = ifc$req__RDY_internal;
    assign ifc$resAccept__RDY = ifc$resAccept__RDY_internal;

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
    wire request$say__RDY_internal;
    wire inQ$out$deq__RDY;
    wire [95:0]inQ$out$first;
    wire inQ$out$first__RDY;
    l_module_OC_Fifo1 inQ (
        CLK,
        nRST,
        request$say__ENA_internal,
        temp_2e_i,
        request$say__RDY_internal,
        enter__ENA_internal,
        inQ$out$deq__RDY,
        inQ$out$first,
        inQ$out$first__RDY);
    wire fifo$in$enq__RDY;
    wire fifo$out$deq__RDY;
    wire [95:0]fifo$out$first;
    wire fifo$out$first__RDY;
    l_module_OC_Fifo2 fifo (
        CLK,
        nRST,
        enter__ENA_internal || recirc__ENA_internal,
        mem$ifc$req$v,
        fifo$in$enq__RDY,
        exit_rule__ENA_internal || recirc__ENA_internal,
        fifo$out$deq__RDY,
        fifo$out$first,
        fifo$out$first__RDY);
    wire outQ$in$enq__RDY;
    wire outQ$out$deq__RDY;
    wire [95:0]outQ$out$first;
    wire outQ$out$first__RDY;
    l_module_OC_Fifo1 outQ (
        CLK,
        nRST,
        exit_rule__ENA_internal,
        outQ$out$first,
        outQ$in$enq__RDY,
        respond__ENA_internal,
        outQ$out$deq__RDY,
        outQ$out$first,
        outQ$out$first__RDY);
    wire [95:0]mem$ifc$req$v;
    wire mem$ifc$req__RDY;
    wire mem$ifc$resAccept__RDY;
    wire [95:0]mem$ifc$resValue;
    wire mem$ifc$resValue__RDY;
    l_module_OC_LpmMemory mem (
        CLK,
        nRST,
        enter__ENA_internal || recirc__ENA_internal,
        mem$ifc$req$v,
        mem$ifc$req__RDY,
        exit_rule__ENA_internal || recirc__ENA_internal,
        mem$ifc$resAccept__RDY,
        mem$ifc$resValue,
        mem$ifc$resValue__RDY);
    reg[31:0] doneCount;
    assign enter__RDY_internal = ((inQ$out$first__RDY & inQ$out$deq__RDY) & fifo$in$enq__RDY) & mem$ifc$req__RDY;
    assign exit_rule__RDY_internal = (((fifo$out$first__RDY & mem$ifc$resValue__RDY) & mem$ifc$resAccept__RDY) & fifo$out$deq__RDY) & outQ$in$enq__RDY;
    assign ind$heard$meth = temp$a;
    assign ind$heard$v = temp$b;
    assign ind$heard__ENA = respond__ENA_internal;
    assign mtemp = mtemp;
    assign recirc__RDY_internal = ((((fifo$out$first__RDY & mem$ifc$resValue__RDY) & mem$ifc$resAccept__RDY) & fifo$out$deq__RDY) & fifo$in$enq__RDY) & mem$ifc$req__RDY;
    assign respond__RDY_internal = (outQ$out$first__RDY & outQ$out$deq__RDY) & ind$heard__RDY;
    assign temp_2e_i$a = request$say$meth;
    assign temp_2e_i$b = request$say$v;
    assign request$say__RDY = request$say__RDY_internal;

    always @( posedge CLK) begin
      if (!nRST) begin
        doneCount <= 0;
      end // nRST
    end // always @ (posedge CLK)
endmodule 

