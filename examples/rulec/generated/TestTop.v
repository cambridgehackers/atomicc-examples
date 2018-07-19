`include "zynqTop.generated.vh"

`default_nettype none
module TestTop (input wire CLK, input wire nRST,
    input wire MAXIGP0_O$AR__ENA,
    input wire [31:0]MAXIGP0_O$AR$addr,
    input wire [11:0]MAXIGP0_O$AR$id,
    input wire [3:0]MAXIGP0_O$AR$len,
    output wire MAXIGP0_O$AR__RDY,
    input wire MAXIGP0_O$AW__ENA,
    input wire [31:0]MAXIGP0_O$AW$addr,
    input wire [11:0]MAXIGP0_O$AW$id,
    input wire [3:0]MAXIGP0_O$AW$len,
    output wire MAXIGP0_O$AW__RDY,
    input wire MAXIGP0_O$W__ENA,
    input wire [31:0]MAXIGP0_O$W$data,
    input wire [11:0]MAXIGP0_O$W$id,
    input wire MAXIGP0_O$W$last,
    output wire MAXIGP0_O$W__RDY,
    output wire MAXIGP0_I$B__ENA,
    output wire [11:0]MAXIGP0_I$B$id,
    output wire [1:0]MAXIGP0_I$B$resp,
    input wire MAXIGP0_I$B__RDY,
    output wire MAXIGP0_I$R__ENA,
    output wire [31:0]MAXIGP0_I$R$data,
    output wire [11:0]MAXIGP0_I$R$id,
    output wire MAXIGP0_I$R$last,
    output wire [1:0]MAXIGP0_I$R$resp,
    input wire MAXIGP0_I$R__RDY);
    reg intEnable;
    reg [31:0]portalCtrlInfo;
    reg portalRControl;
    reg portalWControl;
    reg [4:0]readAddr;
    reg [9:0]readCount;
    reg readFirst;
    reg readLast;
    reg [31:0]requestValue;
    reg selectRIndReq;
    reg selectWIndReq;
    reg [4:0]writeAddr;
    reg [9:0]writeCount;
    reg writeFirst;
    reg writeLast;
    wire [4:0]readBeat$in$enq$v$ac$addr;
    wire [9:0]readBeat$in$enq$v$ac$count;
    wire [5:0]readBeat$in$enq$v$ac$id;
    wire readBeat$in$enq$v$last;
    wire readBeat$in$enq__ENA;
    wire readBeat$in$enq__RDY;
    wire readBeat$out$deq__ENA;
    wire readBeat$out$deq__RDY;
    wire [21:0]readBeat$out$first;
    wire readBeat$out$first__RDY;
    wire [31:0]readData$in$enq$v$data;
    wire [5:0]readData$in$enq$v$id;
    wire readData$in$enq__ENA;
    wire readData$in$enq__RDY;
    wire readData$out$deq__ENA;
    wire readData$out$deq__RDY;
    wire [37:0]readData$out$first;
    wire readData$out$first__RDY;
    wire [4:0]reqArs$in$enq$v$addr;
    wire [9:0]reqArs$in$enq$v$count;
    wire [5:0]reqArs$in$enq$v$id;
    wire reqArs$in$enq__ENA;
    wire reqArs$in$enq__RDY;
    wire reqArs$out$deq__ENA;
    wire reqArs$out$deq__RDY;
    wire [20:0]reqArs$out$first;
    wire reqArs$out$first__RDY;
    wire [4:0]reqAws$in$enq$v$addr;
    wire [9:0]reqAws$in$enq$v$count;
    wire [5:0]reqAws$in$enq$v$id;
    wire reqAws$in$enq__ENA;
    wire reqAws$in$enq__RDY;
    wire reqAws$out$deq__ENA;
    wire reqAws$out$deq__RDY;
    wire [20:0]reqAws$out$first;
    wire reqAws$out$first__RDY;
    wire [4:0]writeBeat$in$enq$v$ac$addr;
    wire [9:0]writeBeat$in$enq$v$ac$count;
    wire [5:0]writeBeat$in$enq$v$ac$id;
    wire writeBeat$in$enq$v$last;
    wire writeBeat$in$enq__ENA;
    wire writeBeat$in$enq__RDY;
    wire writeBeat$out$deq__ENA;
    wire writeBeat$out$deq__RDY;
    wire [21:0]writeBeat$out$first;
    wire writeBeat$out$first__RDY;
    wire [31:0]writeData$in$enq$v$data;
    wire writeData$in$enq__ENA;
    wire writeData$in$enq__RDY;
    wire writeData$out$deq__ENA;
    wire writeData$out$deq__RDY;
    wire [31:0]writeData$out$first;
    wire writeData$out$first__RDY;
    wire [5:0]writeDone$in$enq$v;
    wire writeDone$in$enq__ENA;
    wire writeDone$in$enq__RDY;
    wire writeDone$out$deq__ENA;
    wire writeDone$out$deq__RDY;
    wire [5:0]writeDone$out$first;
    wire writeDone$out$first__RDY;
    Fifo1_OC_10 reqArs (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(reqArs$in$enq__ENA),
        .in$enq$v({ reqArs$in$enq$v$id , reqArs$in$enq$v$count , reqArs$in$enq$v$addr }),
        .in$enq__RDY(reqArs$in$enq__RDY),
        .out$deq__ENA(reqArs$out$deq__ENA),
        .out$deq__RDY(reqArs$out$deq__RDY),
        .out$first(reqArs$out$first),
        .out$first__RDY(reqArs$out$first__RDY));
    Fifo1_OC_10 reqAws (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(reqAws$in$enq__ENA),
        .in$enq$v({ reqAws$in$enq$v$id , reqAws$in$enq$v$count , reqAws$in$enq$v$addr }),
        .in$enq__RDY(reqAws$in$enq__RDY),
        .out$deq__ENA(reqAws$out$deq__ENA),
        .out$deq__RDY(reqAws$out$deq__RDY),
        .out$first(reqAws$out$first),
        .out$first__RDY(reqAws$out$first__RDY));
    Fifo1_OC_12 readBeat (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(readBeat$in$enq__ENA),
        .in$enq$v({ readBeat$in$enq$v$last , readBeat$in$enq$v$ac$id , readBeat$in$enq$v$ac$count , readBeat$in$enq$v$ac$addr }),
        .in$enq__RDY(readBeat$in$enq__RDY),
        .out$deq__ENA(readBeat$out$deq__ENA),
        .out$deq__RDY(readBeat$out$deq__RDY),
        .out$first(readBeat$out$first),
        .out$first__RDY(readBeat$out$first__RDY));
    Fifo1_OC_12 writeBeat (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(writeBeat$in$enq__ENA),
        .in$enq$v({ writeBeat$in$enq$v$last , writeBeat$in$enq$v$ac$id , writeBeat$in$enq$v$ac$count , writeBeat$in$enq$v$ac$addr }),
        .in$enq__RDY(writeBeat$in$enq__RDY),
        .out$deq__ENA(writeBeat$out$deq__ENA),
        .out$deq__RDY(writeBeat$out$deq__RDY),
        .out$first(writeBeat$out$first),
        .out$first__RDY(writeBeat$out$first__RDY));
    Fifo1_OC_14 readData (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(readData$in$enq__ENA),
        .in$enq$v({ readData$in$enq$v$id , readData$in$enq$v$data }),
        .in$enq__RDY(readData$in$enq__RDY),
        .out$deq__ENA(readData$out$deq__ENA),
        .out$deq__RDY(readData$out$deq__RDY),
        .out$first(readData$out$first),
        .out$first__RDY(readData$out$first__RDY));
    Fifo1_OC_16 writeData (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(writeData$in$enq__ENA),
        .in$enq$v({ writeData$in$enq$v$data }),
        .in$enq__RDY(writeData$in$enq__RDY),
        .out$deq__ENA(writeData$out$deq__ENA),
        .out$deq__RDY(writeData$out$deq__RDY),
        .out$first(writeData$out$first),
        .out$first__RDY(writeData$out$first__RDY));
    Fifo1_OC_18 writeDone (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(writeDone$in$enq__ENA),
        .in$enq$v(writeDone$in$enq$v),
        .in$enq__RDY(writeDone$in$enq__RDY),
        .out$deq__ENA(writeDone$out$deq__ENA),
        .out$deq__RDY(writeDone$out$deq__RDY),
        .out$first(writeDone$out$first),
        .out$first__RDY(writeDone$out$first__RDY));
    assign MAXIGP0_I$B$id = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign MAXIGP0_I$B$resp = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign MAXIGP0_I$B__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign MAXIGP0_I$R$data = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign MAXIGP0_I$R$id = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign MAXIGP0_I$R$last = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign MAXIGP0_I$R$resp = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign MAXIGP0_I$R__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign MAXIGP0_O$AR__RDY = 1;
    assign MAXIGP0_O$AW__RDY = 1;
    assign MAXIGP0_O$W__RDY = 1;
    assign readBeat$in$enq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign readBeat$out$deq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign readData$in$enq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign readData$out$deq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign reqArs$in$enq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign reqArs$out$deq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign reqAws$in$enq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign reqAws$out$deq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign writeBeat$in$enq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign writeBeat$out$deq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign writeData$in$enq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign writeData$out$deq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign writeDone$in$enq$v = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign writeDone$in$enq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign writeDone$out$deq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE

    always @( posedge CLK) begin
      if (!nRST) begin
        intEnable <= 0;
        portalCtrlInfo <= 0;
        portalRControl <= 0;
        portalWControl <= 0;
        readAddr <= 0;
        readCount <= 0;
        readFirst <= 0;
        readLast <= 0;
        requestValue <= 0;
        selectRIndReq <= 0;
        selectWIndReq <= 0;
        writeAddr <= 0;
        writeCount <= 0;
        writeFirst <= 0;
        writeLast <= 0;
      end // nRST
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
