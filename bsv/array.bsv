
package SpecialFIFOs;

import FIFO::*;
import FIFOF::*;

export mkSizedDFIFOF;
interface SCounter;
   method Action incr;
   method Action decr;
   method Bool isEq(Integer n);
   method Action setNext (b value, Vector#(n, Reg#(b)) as);
   method Action set (b value, Vector#(n, Reg#(b)) as);
   method Action clear;
endinterface

module mkSCtr#(Reg#(UInt#(s)) c)(SCounter);
   method Action incr; c <= c+1; endmethod
   method Action decr; c <= c-1; endmethod
   method isEq(n) = (c==fromInteger(n));
   method Action setNext (b value, Vector#(n, Reg#(b)) as); as[c] <= value; endmethod
   method Action set (b value, Vector#(n, Reg#(b)) as); as[c-1] <= value; endmethod
   method Action clear; c <= 0; endmethod
endmodule

// A counter which can count up to m inclusive (m known at compile time):
module mkSCounter#(Integer m)(SCounter);
   let _i = ?;
   if      (m<2)      begin Reg#(UInt#(1))  r <- mkReg(0); _i <- mkSCtr(r); end
   else if (m<4)      begin Reg#(UInt#(2))  r <- mkReg(0); _i <- mkSCtr(r); end
   else if (m<8)      begin Reg#(UInt#(3))  r <- mkReg(0); _i <- mkSCtr(r); end
   return _i;
endmodule

/*jca
module mkSizedDFIFOF#(Integer n, a dflt) (FIFOF#(a))
   provisos (Bits#(a,sa));

   // If the queue contains n elements, they are in q[0]..q[n-1].  The head of
   // the queue (the "first" element) is in q[0], the tail in q[n-1].

   Reg#(a) q[n];
   for (Integer i=0; i<n; i=i+1)
      q[i] <- mkReg(dflt);
   SCounter cntr <- mkSCounter(n);

   PulseWire enqueueing <- mkPulseWire();
   Wire#(a)      x_wire <- mkWire();
   PulseWire dequeueing <- mkPulseWire();

   let empty = cntr.isEq(0);
   let full  = cntr.isEq(n);

   rule incCtr (enqueueing && !dequeueing);
      cntr.incr;
      cntr.setNext(x_wire, q);
   endrule
   rule decCtr (dequeueing && !enqueueing);
      for (Integer i=0; i<n; i=i+1)
	 q[i] <= (i==(n - 1) ? dflt : q[i + 1]);
      cntr.decr;
   endrule
   rule both (dequeueing && enqueueing);
      for (Integer i=0; i<n; i=i+1)
	 if (!cntr.isEq(i + 1)) q[i] <= (i==(n - 1) ? dflt : q[i + 1]);
      cntr.set(x_wire, q);
   endrule

   method Action deq;
      if (!empty) dequeueing.send;
   endmethod

   method first; // no implicit conditions on first!!!
      return q[0];
   endmethod

   method Action enq(x) if (!full);
      enqueueing.send;
      x_wire <= x;
   endmethod

   method notEmpty = !empty;
   method notFull  = !full;

   method Action clear;
      cntr.clear;
   endmethod
endmodule
jca*/

endpackage
