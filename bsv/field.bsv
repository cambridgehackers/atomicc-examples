// Copyright (c) 2013 Bluespec, Inc.  All rights reserved.
// $Revision: 32843 $
// $Date: 2013-12-16 16:25:57 +0000 (Mon, 16 Dec 2013) $

package Cntrs;
export Count(..);
export mkCount;

interface Count#(type t);
   method Action incr    (t val);
endinterface

interface VCount#(type t);
   method Action incrA   (t val);
endinterface

module vCount0 (VCount#(t)) provisos (Literal#(t) ,Bits#(t,st));
   method Action incrA   (t val); endmethod
endmodule

module vCount #(t resetVal) (VCount#(t)) provisos (Bits#(t,st));
endmodule

module mkCount #(t resetVal) (Count#(t)) provisos ( Arith#(t) ,Bits#(t,st));
   let _i <- valueOf(st) != 0 ?  vCount (resetVal) :  vCount0;
   method Action incr    (t val) = _i.incrA(val);
endmodule

endpackage
