/* Copyright (c) 2018 The Connectal Project
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
#include "fifo.h"
#include "axiTop.h"
#include "userTop.h"

typedef __uint(5) AXIAddr;
typedef __uint(6) AXIId;
typedef __uint(4) AXICount;
typedef struct {
    AXIId      id;
    AXICount   count;
    AXIAddr    addr;
} AddrCount;
typedef struct {
  __uint(1) last;
  AddrCount ac;
} PortalInfo;
typedef struct {
  AXIId      id;
  __uint(BusTypeWidth)    data;
} ReadResp;
typedef struct {
  __uint(BusTypeWidth)    data;
} BusData;

class AxiTop __implements AxiTopIfc {
    __uint(1) intEnable, writeNotFirst, writeLast;
    __uint(1) readNotFirst, readLast, selectRIndReq, portalRControl, selectWIndReq, portalWControl;
    AXICount readCount, writeCount;
    AXIAddr readAddr, writeAddr;

    Fifo1<AddrCount>  reqArs, reqAws;
    Fifo1<PortalInfo> readBeat,writeBeat;
    Fifo1<ReadResp>   readData;
    Fifo1<BusData>    writeData;
    Fifo1<AXIId>      writeDone;
    UserTop user;
    __implements user.read readUser;

    void MAXIGP0_O.AR(__uint(32) addr, __uint(12) id, __uint(4) len) {
        reqArs.in.enq(AddrCount{static_cast<AXIId>(id), len + 1, static_cast<AXIAddr>(addr)});
        portalRControl = __bitsubstr(addr, 11, 5) == 0;
        selectRIndReq = __bitsubstr(addr, 12);
    }
    void MAXIGP0_O.AW(__uint(32) addr, __uint(12) id, __uint(4) len) {
        reqAws.in.enq(AddrCount{static_cast<AXIId>(id), len + 1, static_cast<AXIAddr>(addr)});
        portalWControl = __bitsubstr(addr, 11, 5) == 0;
        selectWIndReq = __bitsubstr(addr, 12);
    }
    void MAXIGP0_O.W(__uint(32) data, __uint(12) id, __uint(1) last) {
        writeData.in.enq(BusData{data});
    }
    __uint(BusTypeWidth) requestValue;
    __uint(1) hasIndication;
    __uint(1) writeReady;
    void readUser.enq(__uint(BusTypeWidth) v, bool last) if (!hasIndication) {
        requestValue = v;
        hasIndication = 1;//!last;
    }

    __rule init {
       _.interrupt = (hasIndication != 0) && intEnable;
    }
    __rule lread {
        auto temp = readBeat.out.first();
        readBeat.out.deq();
        __uint(BusTypeWidth) res, portalCtrlInfo;
        __uint(1) zzIntrChannel = !selectRIndReq ? hasIndication : 0;
        if (!portalRControl && temp.ac.addr == 0)
            hasIndication = 0;
        switch (temp.ac.addr) {
          case 0: portalCtrlInfo = zzIntrChannel; break;
          case 8: portalCtrlInfo = 1; break;
          case 0xc: portalCtrlInfo = zzIntrChannel; break;
          case 0x10: portalCtrlInfo = selectRIndReq ? 6 : 5; break;
          case 0x14: portalCtrlInfo = 2; break;
          default: portalCtrlInfo = 0; break;
        }
        switch (temp.ac.addr) {
          case 0: res = requestValue; break;
          case 4: res = __ready(user.write.enq); break;
          default: res = 0; break;
        }
        readData.in.enq(ReadResp{temp.ac.id, portalRControl ? portalCtrlInfo : res});
    }
    __rule lreadNext {
        auto temp = reqArs.out.first();
        auto readAddrupdate = readNotFirst ? readAddr : temp.addr;
        AXICount readburstCount = readNotFirst ? readCount : temp.count;
        __uint(1) readLastNext = readNotFirst ? readLast : temp.count == 1;
        readBeat.in.enq(PortalInfo{readLastNext, temp.id, readburstCount, readAddrupdate});
        readAddr = readAddrupdate + 4 ;
        readCount = readburstCount - 1 ;
        readNotFirst = !readLastNext;
        readLast = readburstCount == 2 ;
        if (readLastNext)
            reqArs.out.deq();
    }
    __rule lR {
        auto temp = readData.out.first();
        readData.out.deq();
        MAXIGP0_I->R(temp.data, temp.id, 1, 0);
    }
    __rule lwrite {
        auto wb = writeBeat.out.first();
        writeBeat.out.deq();
        auto temp = writeData.out.first();
        writeData.out.deq();
        if (wb.last)
            writeDone.in.enq(wb.ac.id);
        if (!portalWControl)
            user.write.enq(temp.data, wb.ac.addr != 0);
        else if (wb.ac.addr == 4)
            intEnable = __bitsubstr(temp.data, 0, 0);
    }
    __rule lwriteNext {
        auto temp = reqAws.out.first();
        auto writeAddrupdate = writeNotFirst ? writeAddr : temp.addr;
        AXICount writeburstCount = writeNotFirst ? writeCount : temp.count;
        __uint(1) writeLastNext = writeNotFirst ? writeLast : temp.count == 1;
        writeBeat.in.enq(PortalInfo{writeLastNext, temp.id, writeburstCount, writeAddrupdate});
        writeAddr = writeAddrupdate + 4 ;
        writeCount = writeburstCount - 1 ;
        writeNotFirst = !writeLastNext ;
        writeLast = writeburstCount == 2 ;
        if (writeLastNext)
            reqAws.out.deq();
    }
    __rule writeResponse {
        MAXIGP0_I->B(writeDone.out.first(), 0);
        writeDone.out.deq();
    }
};
