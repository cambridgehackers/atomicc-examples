`include "before1.generated.vh"

module Connect (input CLK, input nRST,
    input request$say__ENA,
    input [31:0]request$say$meth,
    input [31:0]request$say$v,
    input request$say2__ENA,
    input [31:0]request$say2$meth,
    input [31:0]request$say2$v,
    output request$say2__RDY,
    output request$say__RDY,
    output indication$heard__ENA,
    output [31:0]indication$heard$meth,
    output [31:0]indication$heard$v,
    input indication$heard__RDY);
    wire CLK, nRST;
    wire lEII_test$pipe$enq__RDY;
    wire lEIO$indication$heard__RDY;
    wire [95:0]lEIO$pipe$enq$v;
    wire lEIO$pipe$enq__ENA;
    wire lERI$pipe$enq__RDY;
    wire [31:0]lERI$request$say$meth;
    wire [31:0]lERI$request$say$v;
    wire [31:0]lERI$request$say2$meth;
    wire [31:0]lERI$request$say2$v;
    wire lERI$request$say2__ENA;
    wire lERI$request$say__ENA;
    wire [191:0]lERO_test$pipe$enq$v;
    wire lERO_test$pipe$enq__ENA;
    wire [31:0]lEcho$indication$heard$meth;
    wire [31:0]lEcho$indication$heard$v;
    wire lEcho$indication$heard__ENA;
    wire lEcho$request$say2__RDY;
    wire lEcho$request$say__RDY;
    wire lEcho$swap$x2y__RDY;
    wire lEcho$swap$y2x__RDY;
    wire lEcho$swap$y2xnull__RDY;
    wire swap2_rule__ENA;
    wire swap2_rule__RDY;
    wire swap_rule__ENA;
    wire swap_rule__RDY;
    assign swap2_rule__ENA = swap2_rule__RDY ;
    assign swap2_rule__RDY = lEcho$swap$y2xnull__RDY ;
    assign swap_rule__ENA = swap_rule__RDY ;
    assign swap_rule__RDY = lEcho$swap$x2y__RDY  & lEcho$swap$y2x__RDY ;
    EchoIndicationOutput lEIO (.CLK(CLK), .nRST(nRST),
        .indication$heard__ENA(lEcho$indication$heard__ENA),
        .indication$heard$meth(lEcho$indication$heard$meth),
        .indication$heard$v(lEcho$indication$heard$v),
        .indication$heard__RDY(lEIO$indication$heard__RDY),
        .pipe$enq__ENA(lEIO$pipe$enq__ENA),
        .pipe$enq$v(lEIO$pipe$enq$v),
        .pipe$enq__RDY(lEII_test$pipe$enq__RDY));
    EchoRequestInput lERI (.CLK(CLK), .nRST(nRST),
        .pipe$enq__ENA(lERO_test$pipe$enq__ENA),
        .pipe$enq$v(lERO_test$pipe$enq$v),
        .pipe$enq__RDY(lERI$pipe$enq__RDY),
        .request$say__ENA(lERI$request$say__ENA),
        .request$say$meth(lERI$request$say$meth),
        .request$say$v(lERI$request$say$v),
        .request$say2__ENA(lERI$request$say2__ENA),
        .request$say2$meth(lERI$request$say2$meth),
        .request$say2$v(lERI$request$say2$v),
        .request$say2__RDY(lEcho$request$say2__RDY),
        .request$say__RDY(lEcho$request$say__RDY));
    Echo lEcho (.CLK(CLK), .nRST(nRST),
        .request$say__ENA(lERI$request$say__ENA),
        .request$say$meth(lERI$request$say$meth),
        .request$say$v(lERI$request$say$v),
        .request$say2__ENA(lERI$request$say2__ENA),
        .request$say2$meth(lERI$request$say2$meth),
        .request$say2$v(lERI$request$say2$v),
        .request$say2__RDY(lEcho$request$say2__RDY),
        .request$say__RDY(lEcho$request$say__RDY),
        .swap$x2y__ENA(swap_rule__ENA),
        .swap$x2y__RDY(lEcho$swap$x2y__RDY),
        .swap$y2x__ENA(swap_rule__ENA),
        .swap$y2x__RDY(lEcho$swap$y2x__RDY),
        .swap$y2xnull__ENA(swap2_rule__ENA),
        .swap$y2xnull__RDY(lEcho$swap$y2xnull__RDY),
        .indication$heard__ENA(lEcho$indication$heard__ENA),
        .indication$heard$meth(lEcho$indication$heard$meth),
        .indication$heard$v(lEcho$indication$heard$v),
        .indication$heard__RDY(lEIO$indication$heard__RDY));
    EchoRequestOutput lERO_test (.CLK(CLK), .nRST(nRST),
        .request$say__ENA(request$say__ENA),
        .request$say$meth(request$say$meth),
        .request$say$v(request$say$v),
        .request$say2__ENA(request$say2__ENA),
        .request$say2$meth(request$say2$meth),
        .request$say2$v(request$say2$v),
        .request$say2__RDY(request$say2__RDY),
        .request$say__RDY(request$say__RDY),
        .pipe$enq__ENA(lERO_test$pipe$enq__ENA),
        .pipe$enq$v(lERO_test$pipe$enq$v),
        .pipe$enq__RDY(lERI$pipe$enq__RDY));
    EchoIndicationInput lEII_test (.CLK(CLK), .nRST(nRST),
        .pipe$enq__ENA(lEIO$pipe$enq__ENA),
        .pipe$enq$v(lEIO$pipe$enq$v),
        .pipe$enq__RDY(lEII_test$pipe$enq__RDY),
        .indication$heard__ENA(indication$heard__ENA),
        .indication$heard$meth(indication$heard$meth),
        .indication$heard$v(indication$heard$v),
        .indication$heard__RDY(indication$heard__RDY));

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (swap2_rule__ENA) begin
            $display( "swap2_rule:Connect" );
        end; // End of swap2_rule__ENA
        if (swap_rule__ENA) begin
            $display( "swap_rule:Connect" );
        end; // End of swap_rule__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module Echo (input CLK, input nRST,
    input request$say__ENA,
    input [31:0]request$say$meth,
    input [31:0]request$say$v,
    input request$say2__ENA,
    input [31:0]request$say2$meth,
    input [31:0]request$say2$v,
    output request$say2__RDY,
    output request$say__RDY,
    input swap$x2y__ENA,
    output swap$x2y__RDY,
    input swap$y2x__ENA,
    output swap$y2x__RDY,
    input swap$y2xnull__ENA,
    output swap$y2xnull__RDY,
    output indication$heard__ENA,
    output [31:0]indication$heard$meth,
    output [31:0]indication$heard$v,
    input indication$heard__RDY);
    wire CLK, nRST;
    reg busy;
    reg busy_delay;
    reg [31:0]meth_delay;
    reg [31:0]meth_temp;
    reg [31:0]v_delay;
    reg [31:0]v_temp;
    reg [31:0]x;
    reg [31:0]y;
    wire delay_rule__ENA;
    wire delay_rule__RDY;
    wire respond_rule__ENA;
    wire respond_rule__RDY;
    assign delay_rule__ENA = delay_rule__RDY ;
    assign delay_rule__RDY = ( busy  & ( !busy_delay  ) ) != 0;
    assign respond_rule__ENA = respond_rule__RDY ;
    assign respond_rule__RDY = busy_delay  & indication$heard__RDY ;
    assign indication$heard$meth = meth_delay ;
    assign indication$heard$v = v_delay ;
    assign indication$heard__ENA = respond_rule__ENA ;
    assign request$say2__RDY = !busy ;
    assign request$say__RDY = !busy ;
    assign swap$x2y__RDY = 1;
    assign swap$y2x__RDY = 1;
    assign swap$y2xnull__RDY = 1;

    always @( posedge CLK) begin
      if (!nRST) begin
        busy <= 0;
        busy_delay <= 0;
        meth_delay <= 0;
        meth_temp <= 0;
        v_delay <= 0;
        v_temp <= 0;
        x <= 0;
        y <= 0;
      end // nRST
      else begin
        if (delay_rule__ENA) begin
            busy  <= 0;
            busy_delay  <= 1;
            meth_delay  <= meth_temp;
            v_delay  <= v_temp;
            $display( "delay_rule: Echo" );
        end; // End of delay_rule__ENA
        if (request$say__ENA) begin
            meth_temp  <= request$say$meth;
            v_temp  <= request$say$v;
            busy  <= 1;
            $display( "[%s:%d]Echo" , "request$say" , 186 );
        end; // End of request$say__ENA
        if (request$say2__ENA) begin
            meth_temp  <= request$say2$meth;
            v_temp  <= request$say2$v;
            busy  <= 1;
            $display( "[%s:%d]Echo" , "request$say2" , 192 );
        end; // End of request$say2__ENA
        if (respond_rule__ENA) begin
            busy_delay  <= 0;
            $display( "respond_rule: Echo" );
        end; // End of respond_rule__ENA
        if (swap$x2y__ENA) begin
            y  <= x;
            $display( "[%s:%d]Echo" , "swap$x2y" , 206 );
        end; // End of swap$x2y__ENA
        if (swap$y2x__ENA) begin
            x  <= y;
            $display( "[%s:%d]Echo" , "swap$y2x" , 198 );
        end; // End of swap$y2x__ENA
        if (swap$y2xnull__ENA) begin
            $display( "[%s:%d]Echo" , "swap$y2xnull" , 202 );
        end; // End of swap$y2xnull__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module EchoIndicationInput (input CLK, input nRST,
    input pipe$enq__ENA,
    input [95:0]pipe$enq$v,
    output pipe$enq__RDY,
    output indication$heard__ENA,
    output [31:0]indication$heard$meth,
    output [31:0]indication$heard$v,
    input indication$heard__RDY);
    wire CLK, nRST;
    reg busy_delay;
    reg [31:0]meth_delay;
    reg [31:0]v_delay;
    wire input_rule__ENA;
    wire input_rule__RDY;
    assign input_rule__ENA = input_rule__RDY ;
    assign input_rule__RDY = busy_delay  & indication$heard__RDY ;
    assign indication$heard$meth = meth_delay ;
    assign indication$heard$v = v_delay ;
    assign indication$heard__ENA = input_rule__ENA ;
    assign pipe$enq__RDY = !busy_delay ;

    always @( posedge CLK) begin
      if (!nRST) begin
        busy_delay <= 0;
        meth_delay <= 0;
        v_delay <= 0;
      end // nRST
      else begin
        if (input_rule__ENA) begin
            busy_delay  <= 0;
            $display( "input_rule: EchoIndicationInput" );
        end; // End of input_rule__ENA
        if (pipe$enq__ENA) begin
            $display( "%s: EchoIndicationInput tag %d" , "pipe$enq" , pipe$enq$v[31:0] );
            if (pipe$enq$v[31:0] == 32'd1) begin
            meth_delay  <= pipe$enq$v[63:32];
            v_delay  <= pipe$enq$v[95:64];
            busy_delay  <= 1;
            end;
        end; // End of pipe$enq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module EchoIndicationOutput (input CLK, input nRST,
    input indication$heard__ENA,
    input [31:0]indication$heard$meth,
    input [31:0]indication$heard$v,
    output indication$heard__RDY,
    output pipe$enq__ENA,
    output [95:0]pipe$enq$v,
    input pipe$enq__RDY);
    wire CLK, nRST;
    reg even;
    reg [31:0]ind0$data$heard$meth;
    reg [31:0]ind0$data$heard$v;
    reg [31:0]ind0$tag;
    reg [31:0]ind1$data$heard$meth;
    reg [31:0]ind1$data$heard$v;
    reg [31:0]ind1$tag;
    reg ind_busy;
    wire output_rulee__ENA;
    wire output_rulee__RDY;
    wire output_ruleo__ENA;
    wire output_ruleo__RDY;
    assign output_rulee__ENA = output_rulee__RDY ;
    assign output_rulee__RDY = ( ( ind_busy  & even  ) != 0 ) & pipe$enq__RDY ;
    assign output_ruleo__ENA = output_ruleo__RDY ;
    assign output_ruleo__RDY = ( ( ind_busy  & ( !even  ) ) != 0 ) & pipe$enq__RDY ;
    assign indication$heard__RDY = !ind_busy ;
    assign pipe$enq$v = output_rulee__ENA  ? { ind0$data$heard$v  , ind0$data$heard$meth  , ind0$tag  } : { ind1$data$heard$v  , ind1$data$heard$meth  , ind1$tag  };
    assign pipe$enq__ENA = output_rulee__ENA  || output_ruleo__ENA ;

    always @( posedge CLK) begin
      if (!nRST) begin
        even <= 0;
        ind0$data$heard$meth <= 0;
        ind0$data$heard$v <= 0;
        ind0$tag <= 0;
        ind1$data$heard$meth <= 0;
        ind1$data$heard$v <= 0;
        ind1$tag <= 0;
        ind_busy <= 0;
      end // nRST
      else begin
        if (indication$heard__ENA) begin
            ind_busy  <= 1;
            even  <= even ^ 1;
            $display( "[%s:%d]EchoIndicationOutput even %d" , "indication$heard" , 114 , even );
            if (even ^ 1) begin
            ind0$tag  <= 1;
            ind0$data$heard$meth  <= indication$heard$meth;
            ind0$data$heard$v  <= indication$heard$v;
            end;
            if (even) begin
            ind1$tag  <= 1;
            ind1$data$heard$meth  <= indication$heard$meth;
            ind1$data$heard$v  <= indication$heard$v;
            end;
        end; // End of indication$heard__ENA
        if (output_rulee__ENA) begin
            ind_busy  <= 0;
        end; // End of output_rulee__ENA
        if (output_ruleo__ENA) begin
            ind_busy  <= 0;
        end; // End of output_ruleo__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module EchoRequestInput (input CLK, input nRST,
    input pipe$enq__ENA,
    input [191:0]pipe$enq$v,
    output pipe$enq__RDY,
    output request$say__ENA,
    output [31:0]request$say$meth,
    output [31:0]request$say$v,
    output request$say2__ENA,
    output [31:0]request$say2$meth,
    output [31:0]request$say2$v,
    input request$say2__RDY,
    input request$say__RDY);
    wire CLK, nRST;
    assign pipe$enq__RDY = request$say__RDY  & request$say2__RDY ;
    assign request$say$meth = pipe$enq$v[63:32] ;
    assign request$say$v = pipe$enq$v[95:64] ;
    assign request$say2$meth = pipe$enq$v[127:96] ;
    assign request$say2$v = pipe$enq$v[159:128] ;
    assign request$say2__ENA = ( pipe$enq$v[31:0]  == 32'd2 ) & pipe$enq__ENA ;
    assign request$say__ENA = ( pipe$enq$v[31:0]  == 32'd1 ) & pipe$enq__ENA ;

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (pipe$enq__ENA) begin
            $display( "entered EchoRequestInput::enq tag %d" , pipe$enq$v[31:0] );
        end; // End of pipe$enq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module EchoRequestOutput (input CLK, input nRST,
    input request$say__ENA,
    input [31:0]request$say$meth,
    input [31:0]request$say$v,
    input request$say2__ENA,
    input [31:0]request$say2$meth,
    input [31:0]request$say2$v,
    output request$say2__RDY,
    output request$say__RDY,
    output pipe$enq__ENA,
    output [191:0]pipe$enq$v,
    input pipe$enq__RDY);
    wire CLK, nRST;
    wire [31:0]request$say2__ENA$ind$data$say$meth;
    wire [31:0]request$say2__ENA$ind$data$say$v;
    wire [31:0]request$say2__ENA$ind$data$say2$meth;
    wire [31:0]request$say2__ENA$ind$data$say2$v;
    wire [31:0]request$say2__ENA$ind$data$say2$v2;
    wire [31:0]request$say__ENA$ind$data$say$meth;
    wire [31:0]request$say__ENA$ind$data$say$v;
    wire [31:0]request$say__ENA$ind$data$say2$meth;
    wire [31:0]request$say__ENA$ind$data$say2$v;
    wire [31:0]request$say__ENA$ind$data$say2$v2;
    assign pipe$enq$v = request$say__ENA  ? { request$say__ENA$ind$data$say2$v2  , request$say__ENA$ind$data$say2$v  , request$say__ENA$ind$data$say2$meth  , request$say__ENA$ind$data$say$v  , request$say__ENA$ind$data$say$meth  , 32'd1 } : { request$say2__ENA$ind$data$say2$v2  , request$say2__ENA$ind$data$say2$v  , request$say2__ENA$ind$data$say2$meth  , request$say2__ENA$ind$data$say$v  , request$say2__ENA$ind$data$say$meth  , 32'd2 };
    assign pipe$enq__ENA = request$say__ENA  || request$say2__ENA ;
    assign request$say2__RDY = pipe$enq__RDY ;
    assign request$say__RDY = pipe$enq__RDY ;

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (request$say__ENA) begin
            request$say__ENA$ind$data$say$meth  <= request$say$meth;
            request$say__ENA$ind$data$say$v  <= request$say$v;
            $display( "entered EchoRequestOutput::say" );
        end; // End of request$say__ENA
        if (request$say2__ENA) begin
            request$say2__ENA$ind$data$say2$meth  <= request$say2$meth;
            request$say2__ENA$ind$data$say2$v  <= request$say2$v;
            $display( "entered EchoRequestOutput::say2" );
        end; // End of request$say2__ENA
      end
    end // always @ (posedge CLK)
endmodule 

module Fifo1 (input CLK, input nRST,
    input in$enq__ENA,
    input [127:0]in$enq$v,
    output in$enq__RDY,
    input out$deq__ENA,
    output out$deq__RDY,
    output [127:0]out$first,
    output out$first__RDY);
    wire CLK, nRST;
    reg [31:0]element$data0;
    reg [31:0]element$data1;
    reg [31:0]element$data2;
    reg [31:0]element$data3;
    reg full;
    assign in$enq__RDY = !full ;
    assign out$deq__RDY = full ;
    assign out$first = { element$data3  , element$data2  , element$data1  , element$data0  };
    assign out$first__RDY = full ;

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

module MuxPipe (input CLK, input nRST,
    input in$enq__ENA,
    input [127:0]in$enq$v,
    output in$enq__RDY,
    input forward$enq__ENA,
    input [127:0]forward$enq$v,
    output forward$enq__RDY,
    output out$enq__ENA,
    output [127:0]out$enq$v,
    input out$enq__RDY);
    wire CLK, nRST;
    wire fifoRule__ENA;
    wire fifoRule__RDY;
    wire forwardFifo$out$deq__RDY;
    wire [127:0]forwardFifo$out$first;
    wire forwardFifo$out$first__RDY;
    assign fifoRule__ENA = fifoRule__RDY ;
    assign fifoRule__RDY = forwardFifo$out$first__RDY  & out$enq__RDY  & forwardFifo$out$deq__RDY ;
    Fifo1 forwardFifo (.CLK(CLK), .nRST(nRST),
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

