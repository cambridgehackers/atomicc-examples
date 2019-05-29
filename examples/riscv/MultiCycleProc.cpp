/* Copyright (c) 2019 Accelerated Tech, Inc
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included
 * in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */
#include "atomicc.h"

__interface IMem {
  int read(int pc);
};

__interface Decoder {
  int getOp(int inst);
};

__module MultiCycleProc {
  Decoder *dec;
  IMem *pgm;

  int pc;
  int rf;
  // registers passing info from decode stage to exec stage
  bool d2e_valid;
  int d2e_op;
  int d2e_arithOp;
  int d2e_src1;
  int d2e_src2;
  int d2e_dst;
  int d2e_addr;
  // registers passing info from exec stage to writeback stage
  bool e2w_valid;
  int e2w_dst;
  int e2w_val;

  MultiCycleProc(Decoder *dec, IMem *pgm) : dec(dec), pgm(pgm) {
    pc = 0;
    d2e_valid = false;
    e2w_valid = false;
  }

  __rule decode if (!d2e_valid) {
    int inst = pgm->read(pc);
    d2e_op = dec->getOp(inst);
    d2e_valid = true;
  }

  __rule execArith if (d2e_valid) {
    d2e_valid = false;
  }

};
