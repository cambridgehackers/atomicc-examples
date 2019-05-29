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

__interface RegFile {
  int read(int regnum);
  void write(int regnum, int regval);
};

__interface IMem {
  int read(int pc);
};

__interface Decoder {
  int getOp(int inst);
  int getArithOp(int inst);
  int getSrc1(int inst);
  int getSrc2(int inst);
  int getDst(int inst);
  int getAddr(int inst);
};

struct ExecResult {
  int nextPC;
  int addr;
  int data;
};

__interface Executer {
  ExecResult basicExec(int op, int src1, int src2);
};

__module MultiCycleProc {
  Decoder *dec;
  Executer *exec;
  RegFile *rf;
  IMem *pgm;

  int pc;
  // registers passing info from decode stage to exec stage
  int d2e_valid;
  int d2e_op;
  int d2e_arithOp;
  int d2e_src1;
  int d2e_src2;
  int d2e_dst;
  int d2e_addr;
  // registers passing info from exec stage to writeback stage
  int e2w_valid;
  int e2w_dst;
  int e2w_val;
  int e2w_addr;
  int e2w_nextPC;

  MultiCycleProc(Decoder *dec, Executer *exec, RegFile *rf, IMem *pgm) : dec(dec), exec(exec), rf(rf), pgm(pgm) {
    pc = 0;
    d2e_valid = 0;
    e2w_valid = 0;
  }

  __rule decode if (d2e_valid == 0) {
    int inst = pgm->read(pc);
    d2e_op = dec->getOp(inst);
    d2e_arithOp = dec->getArithOp(inst);
    d2e_src1 = dec->getSrc1(inst);
    d2e_src2 = dec->getSrc2(inst);
    d2e_dst = dec->getDst(inst);
    d2e_addr = dec->getAddr(inst);
    d2e_valid = 1;
  }

  __rule execArith if (d2e_valid == 1 && e2w_valid == 0) {
    d2e_valid = 0;
    e2w_dst = d2e_dst;
    int val1 = rf->read(d2e_src1);
    int val2 = rf->read(d2e_src2);
    ExecResult val = exec->basicExec(d2e_op, val1, val2);
    e2w_val = val.data;
    e2w_nextPC = val.nextPC;
    e2w_addr = val.addr;
    e2w_valid = 1;
  }

  __rule writeBack if (e2w_valid == 1) {
    rf->write(e2w_dst, e2w_val);
    e2w_valid = 0;
    pc = e2w_nextPC;
  }

};
