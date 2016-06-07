`include "lpm.generated.vh"

module l_class_OC_Fifo1 (
    input CLK,
    input nRST,
    input out$deq__ENA,
    output out$deq__RDY,
    input in$enq__ENA,
    input [31:0]in$enq_v,
    output in$enq__RDY,
    output [31:0]out$first,
    output out$first__RDY);
    wire out$deq__RDY_internal;
    wire out$deq__ENA_internal = out$deq__ENA && out$deq__RDY_internal;
    wire in$enq__RDY_internal;
    wire in$enq__ENA_internal = in$enq__ENA && in$enq__RDY_internal;
    reg[31:0] element;
    reg full;
    assign in$enq__RDY = in$enq__RDY_internal;
    assign in$enq__RDY_internal = full ^ 1;
    assign out$deq__RDY = out$deq__RDY_internal;
    assign out$deq__RDY_internal = full;
    assign out$first = element;
    assign out$first__RDY_internal = full;

    always @( posedge CLK) begin
      if (!nRST) begin
        element <= 0;
        full <= 0;
      end // nRST
      else begin
        if (out$deq__ENA_internal) begin
            full <= 0;
        end; // End of out$deq__ENA
        if (in$enq__ENA_internal) begin
            element <= enq_v;
            full <= 1;
        end; // End of in$enq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module l_class_OC_LpmMemory (
    input CLK,
    input nRST,
    input req__ENA,
    input [31:0]req_v.coerce0,
    input [31:0]req_v.coerce1,
    input [31:0]req_v.coerce2,
    output req__RDY,
    input resAccept__ENA,
    output resAccept__RDY,
    output [95:0]resValue,
    output resValue__RDY);
    wire memdelay__RDY_internal;
    wire memdelay__ENA_internal = rule_enable[0] && memdelay__RDY_internal;
    wire req__RDY_internal;
    wire req__ENA_internal = req__ENA && req__RDY_internal;
    wire resAccept__RDY_internal;
    wire resAccept__ENA_internal = resAccept__ENA && resAccept__RDY_internal;
    reg[31:0] delayCount;
    reg[95:0] saved;
    assign memdelay__RDY_internal = delayCount > 1;
    assign req__RDY = req__RDY_internal;
    assign req__RDY_internal = delayCount == 0;
    assign resAccept__RDY = resAccept__RDY_internal;
    assign resAccept__RDY_internal = delayCount == 1;
    assign resValue = retval;
    assign resValue__RDY_internal = delayCount == 1;
    assign rule_ready[0] = memdelay__RDY_internal;
    assign v$a = req_v_2e_coerce0;
    assign v$b = req_v_2e_coerce1;
    assign v$c = req_v_2e_coerce2;

    always @( posedge CLK) begin
      if (!nRST) begin
        delayCount <= 0;
        saved <= 0;
      end // nRST
      else begin
        if (memdelay__ENA_internal) begin
            delayCount <= delayCount - 1;
        end; // End of memdelay__ENA
        if (req__ENA_internal) begin
            delayCount <= 4;
            saved <= v;
        end; // End of req__ENA
        if (resAccept__ENA_internal) begin
            delayCount <= 0;
        end; // End of resAccept__ENA
        if (resValue_internal) begin
            retval <= saved;
        end; // End of resValue
      end
    end // always @ (posedge CLK)
endmodule 

module l_class_OC_Fifo1_OC_0 (
    input CLK,
    input nRST,
    input out$deq__ENA,
    output out$deq__RDY,
    input in$enq__ENA,
    input [95:0]in$enq_v,
    output in$enq__RDY,
    output [95:0]out$first,
    output out$first__RDY);
    wire out$deq__RDY_internal;
    wire out$deq__ENA_internal = out$deq__ENA && out$deq__RDY_internal;
    wire in$enq__RDY_internal;
    wire in$enq__ENA_internal = in$enq__ENA && in$enq__RDY_internal;
    reg[95:0] element;
    reg full;
    assign in$enq__RDY = in$enq__RDY_internal;
    assign in$enq__RDY_internal = full ^ 1;
    assign out$deq__RDY = out$deq__RDY_internal;
    assign out$deq__RDY_internal = full;
    assign out$first = retval;
    assign out$first__RDY_internal = full;

    always @( posedge CLK) begin
      if (!nRST) begin
        element <= 0;
        full <= 0;
      end // nRST
      else begin
        if (out$deq__ENA_internal) begin
            full <= 0;
        end; // End of out$deq__ENA
        if (in$enq__ENA_internal) begin
            element <= enq_v;
            full <= 1;
        end; // End of in$enq__ENA
        if (out$first_internal) begin
            retval <= element;
        end; // End of out$first
      end
    end // always @ (posedge CLK)
endmodule 

module l_class_OC_Fifo2 (
    input CLK,
    input nRST,
    input out$deq__ENA,
    output out$deq__RDY,
    input in$enq__ENA,
    input [95:0]in$enq_v,
    output in$enq__RDY,
    output [95:0]out$first,
    output out$first__RDY);
    wire out$deq__RDY_internal;
    wire out$deq__ENA_internal = out$deq__ENA && out$deq__RDY_internal;
    wire in$enq__RDY_internal;
    wire in$enq__ENA_internal = in$enq__ENA && in$enq__RDY_internal;
    reg[95:0] element0;
    reg[95:0] element1;
    reg[95:0] element2;
    reg[31:0] rindex;
    reg[31:0] windex;
    assign in$enq__RDY = in$enq__RDY_internal;
    assign in$enq__RDY_internal = ((windex + 1) % 2) != rindex;
    assign out$deq__RDY = out$deq__RDY_internal;
    assign out$deq__RDY_internal = rindex != windex;
    assign out$first = retval;
    assign out$first__RDY_internal = rindex != windex;

    always @( posedge CLK) begin
      if (!nRST) begin
        element0 <= 0;
        element1 <= 0;
        element2 <= 0;
        rindex <= 0;
        windex <= 0;
      end // nRST
      else begin
        if (out$deq__ENA_internal) begin
            rindex <= (rindex + 1) % 2;
        end; // End of out$deq__ENA
        if (in$enq__ENA_internal) begin
            *(windex == 0 ? &element0:&element1) <= enq_v;
            windex <= (windex + 1) % 2;
        end; // End of in$enq__ENA
        if (out$first_internal) begin
            retval <= *(rindex == 0 ? &element0:&element1);
        end; // End of out$first
      end
    end // always @ (posedge CLK)
endmodule 

module l_class_OC_Lpm (
    input CLK,
    input nRST,
    input say__VALID,
    input [31:0]say_meth,
    input [31:0]say_v,
    output say__READY,
    output indication$heard__VALID,
    output [31:0]indication$heard_meth,
    output [31:0]indication$heard_v,
    input indication$heard__READY);
    wire enter__RDY_internal;
    wire enter__ENA_internal = rule_enable[0] && enter__RDY_internal;
    wire exit__RDY_internal;
    wire exit__ENA_internal = rule_enable[1] && exit__RDY_internal;
    wire recirc__RDY_internal;
    wire recirc__ENA_internal = rule_enable[2] && recirc__RDY_internal;
    wire respond__RDY_internal;
    wire respond__ENA_internal = rule_enable[3] && respond__RDY_internal;
    wire say__READY_internal;
    wire say__VALID_internal = say__VALID && say__READY_internal;
    wire inQ$out$deq__RDY;
    wire [95:0]inQ$out$first;
    wire inQ$out$first__RDY;
    l_class_OC_Fifo1_OC_0 inQ (
        CLK,
        nRST,
        enter__ENA_internal,
        inQ$out$deq__RDY,
        say__VALID_internal,
        temp,
        say__READY_internal,
        inQ$out$first,
        inQ$out$first__RDY);
    wire fifo$out$deq__RDY;
    wire fifo$in$enq__RDY;
    wire [95:0]fifo$out$first;
    wire fifo$out$first__RDY;
    l_class_OC_Fifo2 fifo (
        CLK,
        nRST,
        exit__ENA_internal || recirc__ENA_internal,
        fifo$out$deq__RDY,
        enter__ENA_internal || recirc__ENA_internal,
        enter__ENA_internal ? temp : temp,
        fifo$in$enq__RDY,
        fifo$out$first,
        fifo$out$first__RDY);
    wire outQ$out$deq__RDY;
    wire outQ$in$enq__RDY;
    wire [95:0]outQ$out$first;
    wire outQ$out$first__RDY;
    l_class_OC_Fifo1_OC_0 outQ (
        CLK,
        nRST,
        respond__ENA_internal,
        outQ$out$deq__RDY,
        exit__ENA_internal,
        temp,
        outQ$in$enq__RDY,
        outQ$out$first,
        outQ$out$first__RDY);
    wire mem$memdelay__ENA;
    wire mem$memdelay__RDY;
    wire [31:0]mem$req_v.coerce0;
    wire [31:0]mem$req_v.coerce1;
    wire [31:0]mem$req_v.coerce2;
    wire mem$req__RDY;
    wire mem$resAccept__RDY;
    wire [95:0]mem$resValue;
    wire mem$resValue__RDY;
    l_class_OC_LpmMemory mem (
        CLK,
        nRST,
        enter__ENA_internal || recirc__ENA_internal,
        mem$req_v.coerce0,
        mem$req_v.coerce1,
        mem$req_v.coerce2,
        mem$req__RDY,
        exit__ENA_internal || recirc__ENA_internal,
        mem$resAccept__RDY,
        mem$resValue,
        mem$resValue__RDY);
    reg[31:0] doneCount;
    assign enter__RDY_internal = ((inQ$out$first__RDY & inQ$out$deq__RDY) & fifo$in$enq__RDY) & mem$req__RDY;
    assign exit__RDY_internal = (((fifo$out$first__RDY & mem$resValue__RDY) & mem$resAccept__RDY) & fifo$out$deq__RDY) & outQ$in$enq__RDY;
    assign indication$heard__VALID = respond__ENA_internal;
    assign indication$heard_meth = say_meth;
    assign indication$heard_v = say_v;
    assign mem$req_req_v.coerce0 = enter__ENA_internal ? temp$a : temp$a;
    assign mem$req_req_v.coerce1 = enter__ENA_internal ? temp$b : temp$b;
    assign mem$req_req_v.coerce2 = enter__ENA_internal ? temp$c : temp$c;
    assign mtemp$a = mtemp$a;
    assign mtemp$b = mtemp$b;
    assign mtemp$c = mtemp$c;
    assign recirc__RDY_internal = ((((fifo$out$first__RDY & mem$resValue__RDY) & mem$resAccept__RDY) & fifo$out$deq__RDY) & fifo$in$enq__RDY) & mem$req__RDY;
    assign respond__RDY_internal = (outQ$out$first__RDY & outQ$out$deq__RDY) & indication$heard__READY;
    assign rule_ready[0] = enter__RDY_internal;
    assign rule_ready[1] = exit__RDY_internal;
    assign rule_ready[2] = recirc__RDY_internal;
    assign rule_ready[3] = respond__RDY_internal;
    assign say__READY = say__READY_internal;
    assign temp$c = outQ$out$first.c;

    always @( posedge CLK) begin
      if (!nRST) begin
        doneCount <= 0;
      end // nRST
    end // always @ (posedge CLK)
endmodule 

module l_class_OC_foo (
    input CLK,
    input nRST,
    input indication$heard__VALID,
    input [31:0]indication$heard_meth,
    input [31:0]indication$heard_v,
    output indication$heard__READY);
    wire indication$heard__READY_internal;
    wire indication$heard__VALID_internal = indication$heard__VALID && indication$heard__READY_internal;
    assign indication$heard__READY = indication$heard__READY_internal;
    assign indication$heard__READY_internal = 1;
endmodule 

