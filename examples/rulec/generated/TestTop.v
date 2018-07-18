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
    reg CMRlastWriteDataSeen;
    reg ctrlPort_0_interruptEnableReg;
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
    wire [5:0]CMRdone$in$enq$v;
    wire CMRdone$in$enq__ENA;
    wire CMRdone$in$enq__RDY;
    wire CMRdone$out$deq__ENA;
    wire CMRdone$out$deq__RDY;
    wire [5:0]CMRdone$out$first;
    wire CMRdone$out$first__RDY;
    wire [31:0]ReadData$in$enq$v$data;
    wire [5:0]ReadData$in$enq$v$id;
    wire ReadData$in$enq__ENA;
    wire ReadData$in$enq__RDY;
    wire ReadData$out$deq__ENA;
    wire ReadData$out$deq__RDY;
    wire [37:0]ReadData$out$first;
    wire ReadData$out$first__RDY;
    wire [4:0]reqArs$in$enq$v$addr;
    wire [9:0]reqArs$in$enq$v$count;
    wire [5:0]reqArs$in$enq$v$id;
    wire reqArs$in$enq__ENA;
    wire reqArs$in$enq__RDY;
    wire reqArs$out$deq__ENA;
    wire reqArs$out$deq__RDY;
    wire [20:0]reqArs$out$first;
    wire reqArs$out$first__RDY;
    wire [4:0]reqPortal$in$enq$v$ac$addr;
    wire [9:0]reqPortal$in$enq$v$ac$count;
    wire [5:0]reqPortal$in$enq$v$ac$id;
    wire reqPortal$in$enq$v$last;
    wire reqPortal$in$enq__ENA;
    wire reqPortal$in$enq__RDY;
    wire reqPortal$out$deq__ENA;
    wire reqPortal$out$deq__RDY;
    wire [21:0]reqPortal$out$first;
    wire reqPortal$out$first__RDY;
    wire reqrs$in$enq$v$data;
    wire reqrs$in$enq__ENA;
    wire reqrs$in$enq__RDY;
    wire reqrs$out$deq__ENA;
    wire reqrs$out$deq__RDY;
    wire reqrs$out$first;
    wire reqrs$out$first__RDY;
    wire [31:0]reqwriteData$in$enq$v$data;
    wire reqwriteData$in$enq__ENA;
    wire reqwriteData$in$enq__RDY;
    wire reqwriteData$out$deq__ENA;
    wire reqwriteData$out$deq__RDY;
    wire [31:0]reqwriteData$out$first;
    wire reqwriteData$out$first__RDY;
    wire reqws$in$enq$v$data;
    wire reqws$in$enq__ENA;
    wire reqws$in$enq__RDY;
    wire reqws$out$deq__ENA;
    wire reqws$out$deq__RDY;
    wire reqws$out$first;
    wire reqws$out$first__RDY;
    wire [4:0]write$in$enq$v$ac$addr;
    wire [9:0]write$in$enq$v$ac$count;
    wire [5:0]write$in$enq$v$ac$id;
    wire write$in$enq$v$last;
    wire write$in$enq__ENA;
    wire write$in$enq__RDY;
    wire write$out$deq__ENA;
    wire write$out$deq__RDY;
    wire [21:0]write$out$first;
    wire write$out$first__RDY;
    wire [4:0]write_req$in$enq$v$addr;
    wire [9:0]write_req$in$enq$v$count;
    wire [5:0]write_req$in$enq$v$id;
    wire write_req$in$enq__ENA;
    wire write_req$in$enq__RDY;
    wire write_req$out$deq__ENA;
    wire write_req$out$deq__RDY;
    wire [20:0]write_req$out$first;
    wire write_req$out$first__RDY;
    Fifo1_OC_12 reqrs (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(reqrs$in$enq__ENA),
        .in$enq$v({ reqrs$in$enq$v$data }),
        .in$enq__RDY(reqrs$in$enq__RDY),
        .out$deq__ENA(reqrs$out$deq__ENA),
        .out$deq__RDY(reqrs$out$deq__RDY),
        .out$first(reqrs$out$first),
        .out$first__RDY(reqrs$out$first__RDY));
    Fifo1_OC_12 reqws (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(reqws$in$enq__ENA),
        .in$enq$v({ reqws$in$enq$v$data }),
        .in$enq__RDY(reqws$in$enq__RDY),
        .out$deq__ENA(reqws$out$deq__ENA),
        .out$deq__RDY(reqws$out$deq__RDY),
        .out$first(reqws$out$first),
        .out$first__RDY(reqws$out$first__RDY));
    Fifo1_OC_14 reqArs (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(reqArs$in$enq__ENA),
        .in$enq$v({ reqArs$in$enq$v$id , reqArs$in$enq$v$count , reqArs$in$enq$v$addr }),
        .in$enq__RDY(reqArs$in$enq__RDY),
        .out$deq__ENA(reqArs$out$deq__ENA),
        .out$deq__RDY(reqArs$out$deq__RDY),
        .out$first(reqArs$out$first),
        .out$first__RDY(reqArs$out$first__RDY));
    Fifo1_OC_14 write_req (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(write_req$in$enq__ENA),
        .in$enq$v({ write_req$in$enq$v$id , write_req$in$enq$v$count , write_req$in$enq$v$addr }),
        .in$enq__RDY(write_req$in$enq__RDY),
        .out$deq__ENA(write_req$out$deq__ENA),
        .out$deq__RDY(write_req$out$deq__RDY),
        .out$first(write_req$out$first),
        .out$first__RDY(write_req$out$first__RDY));
    Fifo1_OC_16 reqPortal (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(reqPortal$in$enq__ENA),
        .in$enq$v({ reqPortal$in$enq$v$last , reqPortal$in$enq$v$ac$id , reqPortal$in$enq$v$ac$count , reqPortal$in$enq$v$ac$addr }),
        .in$enq__RDY(reqPortal$in$enq__RDY),
        .out$deq__ENA(reqPortal$out$deq__ENA),
        .out$deq__RDY(reqPortal$out$deq__RDY),
        .out$first(reqPortal$out$first),
        .out$first__RDY(reqPortal$out$first__RDY));
    Fifo1_OC_16 write (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(write$in$enq__ENA),
        .in$enq$v({ write$in$enq$v$last , write$in$enq$v$ac$id , write$in$enq$v$ac$count , write$in$enq$v$ac$addr }),
        .in$enq__RDY(write$in$enq__RDY),
        .out$deq__ENA(write$out$deq__ENA),
        .out$deq__RDY(write$out$deq__RDY),
        .out$first(write$out$first),
        .out$first__RDY(write$out$first__RDY));
    Fifo1_OC_18 ReadData (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(ReadData$in$enq__ENA),
        .in$enq$v({ ReadData$in$enq$v$id , ReadData$in$enq$v$data }),
        .in$enq__RDY(ReadData$in$enq__RDY),
        .out$deq__ENA(ReadData$out$deq__ENA),
        .out$deq__RDY(ReadData$out$deq__RDY),
        .out$first(ReadData$out$first),
        .out$first__RDY(ReadData$out$first__RDY));
    Fifo1_OC_20 reqwriteData (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(reqwriteData$in$enq__ENA),
        .in$enq$v({ reqwriteData$in$enq$v$data }),
        .in$enq__RDY(reqwriteData$in$enq__RDY),
        .out$deq__ENA(reqwriteData$out$deq__ENA),
        .out$deq__RDY(reqwriteData$out$deq__RDY),
        .out$first(reqwriteData$out$first),
        .out$first__RDY(reqwriteData$out$first__RDY));
    Fifo1_OC_22 CMRdone (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(CMRdone$in$enq__ENA),
        .in$enq$v(CMRdone$in$enq$v),
        .in$enq__RDY(CMRdone$in$enq__RDY),
        .out$deq__ENA(CMRdone$out$deq__ENA),
        .out$deq__RDY(CMRdone$out$deq__RDY),
        .out$first(CMRdone$out$first),
        .out$first__RDY(CMRdone$out$first__RDY));
    assign CMRdone$in$enq$v = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign CMRdone$in$enq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign CMRdone$out$deq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
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
    assign ReadData$in$enq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign ReadData$out$deq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign reqArs$in$enq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign reqArs$out$deq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign reqPortal$in$enq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign reqPortal$out$deq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign reqrs$in$enq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign reqrs$out$deq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign reqwriteData$in$enq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign reqwriteData$out$deq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign reqws$in$enq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign reqws$out$deq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign write$in$enq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign write$out$deq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign write_req$in$enq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign write_req$out$deq__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE

    always @( posedge CLK) begin
      if (!nRST) begin
        CMRlastWriteDataSeen <= 0;
        ctrlPort_0_interruptEnableReg <= 0;
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
