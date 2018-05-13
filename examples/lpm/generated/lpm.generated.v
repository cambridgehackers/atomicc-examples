`include "lpm.generated.vh"

module l_module_OC_Fifo1 (input CLK, input nRST,
    input in$enq__ENA,
    input [127:0]in$enq$v,
    output in$enq__RDY,
    input out$deq__ENA,
    output out$deq__RDY,
    output [127:0]out$first,
    output out$first__RDY);
    reg [31:0]element$data0;
    reg [31:0]element$data1;
    reg [31:0]element$data2;
    reg [31:0]element$data3;
    reg full;
    assign in$enq__RDY = 1;
    assign out$deq__RDY = 1;
    assign out$first = { element$data3  , element$data2  , element$data1  , element$data0  };
    assign out$first__RDY = 1;

    always @( posedge CLK) begin
      if (!nRST) begin
        element$data0 <= 0;
        element$data1 <= 0;
        element$data2 <= 0;
        element$data3 <= 0;
        full <= 0;
      end // nRST
      else begin
        if (in$enq__ENA) begin
            { element$data3  , element$data2  , element$data1  , element$data0  } <= in$enq$v;
            full  <= 1;
        end; // End of in$enq__ENA
        if (out$deq__ENA) begin
            full  <= 0;
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module l_module_OC_Fifo1_OC_0 (input CLK, input nRST,
    input in$enq__ENA,
    input [95:0]in$enq$v,
    output in$enq__RDY,
    input out$deq__ENA,
    output out$deq__RDY,
    output [95:0]out$first,
    output out$first__RDY);
    reg [31:0]element$a;
    reg [31:0]element$b;
    reg [31:0]element$c;
    reg full;
    assign in$enq__RDY = 0 == full ;
    assign out$deq__RDY = 0 != full ;
    assign out$first = { element$c  , element$b  , element$a  };
    assign out$first__RDY = 0 != full ;

    always @( posedge CLK) begin
      if (!nRST) begin
        element$a <= 0;
        element$b <= 0;
        element$c <= 0;
        full <= 0;
      end // nRST
      else begin
        if (in$enq__ENA) begin
            { element$c  , element$b  , element$a  } <= in$enq$v;
            full  <= 1;
        end; // End of in$enq__ENA
        if (out$deq__ENA) begin
            full  <= 0;
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module l_module_OC_Fifo2 (input CLK, input nRST,
    input in$enq__ENA,
    input [95:0]in$enq$v,
    output in$enq__RDY,
    input out$deq__ENA,
    output out$deq__RDY,
    output [95:0]out$first,
    output out$first__RDY);
    reg [31:0]element0$a;
    reg [31:0]element0$b;
    reg [31:0]element0$c;
    reg [31:0]element1$a;
    reg [31:0]element1$b;
    reg [31:0]element1$c;
    reg [31:0]rindex;
    reg [31:0]windex;
    assign in$enq__RDY = ( ( windex  + 1 ) % 2 ) != rindex ;
    assign out$deq__RDY = rindex  != windex ;
    assign out$first = ( rindex  == 32'd0 ) ? { element0$c  , element0$b  , element0$a  } : { element1$c  , element1$b  , element1$a  };
    assign out$first__RDY = rindex  != windex ;

    always @( posedge CLK) begin
      if (!nRST) begin
        element0$a <= 0;
        element0$b <= 0;
        element0$c <= 0;
        element1$a <= 0;
        element1$b <= 0;
        element1$c <= 0;
        rindex <= 0;
        windex <= 0;
      end // nRST
      else begin
        if (in$enq__ENA) begin
            windex  <= ( windex + 1 ) % 2;
            if (windex == 32'd0)
            { element0$c  , element0$b  , element0$a  } <= in$enq$v;
            if (windex == 32'd1)
            { element1$c  , element1$b  , element1$a  } <= in$enq$v;
        end; // End of in$enq__ENA
        if (out$deq__ENA) begin
            rindex  <= ( rindex + 1 ) % 2;
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module l_module_OC_Lpm (input CLK, input nRST,
    output ind$heard__ENA,
    output [31:0]ind$heard$meth,
    output [31:0]ind$heard$v,
    input ind$heard__RDY,
    input request$say__ENA,
    input [31:0]request$say$meth,
    input [31:0]request$say$v,
    output request$say__RDY);
    reg [31:0]doneCount;
    wire enter__ENA;
    wire enter__RDY;
    wire exit_rule__ENA;
    wire exit_rule__RDY;
    wire fifo$in$enq__RDY;
    wire fifo$out$deq__RDY;
    wire [95:0]fifo$out$first;
    wire fifo$out$first__RDY;
    wire inQ$out$deq__RDY;
    wire [95:0]inQ$out$first;
    wire inQ$out$first__RDY;
    wire mem$ifc$req__RDY;
    wire mem$ifc$resAccept__RDY;
    wire [95:0]mem$ifc$resValue;
    wire mem$ifc$resValue__RDY;
    wire outQ$in$enq__RDY;
    wire outQ$out$deq__RDY;
    wire [95:0]outQ$out$first;
    wire outQ$out$first__RDY;
    wire recirc__ENA;
    wire recirc__RDY;
    wire [31:0]request$say__ENA$temp$c;
    wire respond__ENA;
    wire respond__RDY;
    assign enter__ENA = enter__RDY ;
    assign enter__RDY = inQ$out$first__RDY  & inQ$out$deq__RDY  & fifo$in$enq__RDY  & mem$ifc$req__RDY ;
    assign exit_rule__ENA = exit_rule__RDY ;
    assign exit_rule__RDY = fifo$out$first__RDY  & mem$ifc$resValue__RDY  & mem$ifc$resAccept__RDY  & fifo$out$deq__RDY  & outQ$in$enq__RDY ;
    assign recirc__ENA = recirc__RDY ;
    assign recirc__RDY = fifo$out$first__RDY  & mem$ifc$resValue__RDY  & mem$ifc$resAccept__RDY  & fifo$out$deq__RDY  & fifo$in$enq__RDY  & mem$ifc$req__RDY ;
    assign respond__ENA = respond__RDY ;
    assign respond__RDY = outQ$out$first__RDY  & outQ$out$deq__RDY  & ind$heard__RDY ;
    l_module_OC_Fifo1_OC_0 inQ (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(request$say__ENA),
        .in$enq$v({ request$say__ENA$temp$c , request$say$v , request$say$meth }),
        .in$enq__RDY(request$say__RDY),
        .out$deq__ENA(enter__ENA),
        .out$deq__RDY(inQ$out$deq__RDY),
        .out$first(inQ$out$first),
        .out$first__RDY(inQ$out$first__RDY));
    l_module_OC_Fifo2 fifo (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(enter__ENA || recirc__ENA),
        .in$enq$v(enter__ENA ? { inQ$out$first[95:64] , inQ$out$first[63:32] , inQ$out$first[31:0] } : { mem$ifc$resValue[95:64] , mem$ifc$resValue[63:32] , mem$ifc$resValue[31:0] }),
        .in$enq__RDY(fifo$in$enq__RDY),
        .out$deq__ENA(exit_rule__ENA || recirc__ENA),
        .out$deq__RDY(fifo$out$deq__RDY),
        .out$first(fifo$out$first),
        .out$first__RDY(fifo$out$first__RDY));
    l_module_OC_Fifo1_OC_0 outQ (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(exit_rule__ENA),
        .in$enq$v({ fifo$out$first[95:64] , fifo$out$first[63:32] , fifo$out$first[31:0] }),
        .in$enq__RDY(outQ$in$enq__RDY),
        .out$deq__ENA(respond__ENA),
        .out$deq__RDY(outQ$out$deq__RDY),
        .out$first(outQ$out$first),
        .out$first__RDY(outQ$out$first__RDY));
    l_module_OC_LpmMemory mem (.CLK(CLK), .nRST(nRST),
        .ifc$req__ENA(enter__ENA || recirc__ENA),
        .ifc$req$v(enter__ENA ? { inQ$out$first[95:64] , inQ$out$first[63:32] , inQ$out$first[31:0] } : { fifo$out$first[95:64] , fifo$out$first[63:32] , fifo$out$first[31:0] }),
        .ifc$req__RDY(mem$ifc$req__RDY),
        .ifc$resAccept__ENA(exit_rule__ENA || recirc__ENA),
        .ifc$resAccept__RDY(mem$ifc$resAccept__RDY),
        .ifc$resValue(mem$ifc$resValue),
        .ifc$resValue__RDY(mem$ifc$resValue__RDY));
    assign ind$heard$meth = outQ$out$first[31:0] ;
    assign ind$heard$v = outQ$out$first[63:32] ;
    assign ind$heard__ENA = respond__ENA ;

    always @( posedge CLK) begin
      if (!nRST) begin
        doneCount <= 0;
      end // nRST
      else begin
        if (enter__ENA) begin
            $display( "enter: (%d, %d)" , inQ$out$first[31:0] , inQ$out$first[63:32] );
        end; // End of enter__ENA
        if (exit_rule__ENA) begin
            $display( "exit: (%d, %d)" , fifo$out$first[31:0] , fifo$out$first[63:32] );
        end; // End of exit_rule__ENA
        if (recirc__ENA) begin
            $display( "recirc: (%d, %d)" , fifo$out$first[31:0] , fifo$out$first[63:32] );
        end; // End of recirc__ENA
        if (request$say__ENA) begin
            $display( "[%s:%d] (%d, %d)" , "request$say" , 90 , request$say$meth , request$say$v );
        end; // End of request$say__ENA
        if (respond__ENA) begin
            $display( "respond: (%d, %d)" , outQ$out$first[31:0] , outQ$out$first[63:32] );
        end; // End of respond__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module l_module_OC_LpmMemory (input CLK, input nRST,
    input ifc$req__ENA,
    input [95:0]ifc$req$v,
    output ifc$req__RDY,
    input ifc$resAccept__ENA,
    output ifc$resAccept__RDY,
    output [95:0]ifc$resValue,
    output ifc$resValue__RDY);
    reg [31:0]delayCount;
    reg [31:0]saved$a;
    reg [31:0]saved$b;
    reg [31:0]saved$c;
    wire memdelay_rule__ENA;
    wire memdelay_rule__RDY;
    assign memdelay_rule__ENA = memdelay_rule__RDY ;
    assign memdelay_rule__RDY = 0 != ( delayCount  > 1 );
    assign ifc$req__RDY = delayCount  == 32'd0;
    assign ifc$resAccept__RDY = delayCount  == 32'd1;
    assign ifc$resValue = { saved$c  , saved$b  , saved$a  };
    assign ifc$resValue__RDY = delayCount  == 32'd1;

    always @( posedge CLK) begin
      if (!nRST) begin
        delayCount <= 0;
        saved$a <= 0;
        saved$b <= 0;
        saved$c <= 0;
      end // nRST
      else begin
        if (ifc$req__ENA) begin
            delayCount  <= 4;
            { saved$c  , saved$b  , saved$a  } <= ifc$req$v;
        end; // End of ifc$req__ENA
        if (ifc$resAccept__ENA) begin
            delayCount  <= 0;
        end; // End of ifc$resAccept__ENA
        if (memdelay_rule__ENA) begin
            delayCount  <= delayCount - 1;
        end; // End of memdelay_rule__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module l_module_OC_MuxPipe (input CLK, input nRST,
    input in$enq__ENA,
    input [127:0]in$enq$v,
    output in$enq__RDY,
    input forward$enq__ENA,
    input [127:0]forward$enq$v,
    output forward$enq__RDY,
    output out$enq__ENA,
    output [127:0]out$enq$v,
    input out$enq__RDY);
    wire fifoRule__ENA;
    wire fifoRule__RDY;
    wire forwardFifo$out$deq__RDY;
    wire [127:0]forwardFifo$out$first;
    wire forwardFifo$out$first__RDY;
    assign fifoRule__ENA = fifoRule__RDY ;
    assign fifoRule__RDY = forwardFifo$out$first__RDY  & out$enq__RDY  & forwardFifo$out$deq__RDY ;
    l_module_OC_Fifo1 forwardFifo (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(forward$enq__ENA),
        .in$enq$v(forward$enq$v),
        .in$enq__RDY(forward$enq__RDY),
        .out$deq__ENA(fifoRule__ENA),
        .out$deq__RDY(forwardFifo$out$deq__RDY),
        .out$first(forwardFifo$out$first),
        .out$first__RDY(forwardFifo$out$first__RDY));
    assign in$enq__RDY = out$enq__RDY ;
    assign out$enq$v = fifoRule__ENA  ? { forwardFifo$out$first[127:96]  , forwardFifo$out$first[95:64]  , forwardFifo$out$first[63:32]  , forwardFifo$out$first[31:0]  } : in$enq$v ;
    assign out$enq__ENA = fifoRule__ENA  || in$enq__ENA ;
endmodule 

