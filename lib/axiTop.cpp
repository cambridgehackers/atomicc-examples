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

// Datatypes for holding request info during processing
typedef __uint(5) AXIAddr;
typedef __uint(6) AXIId;
typedef __uint(4) AXICount;
typedef struct {
    AXIId      id;
    AXICount   count;
    AXIAddr    addr;
} AddrCount;
typedef struct {
    AXICount   count;
    AXIAddr    addr;
} BeatInfo;
typedef struct {
    AddrCount  ac;
} PortalInfo;
typedef struct {
    AXIId      id;
    BusData    data;
} ReadResp;

class AxiTop __implements AxiTopIfc {
    bool intEnable, hasIndication, writeReady;
    bool selectRIndReq, portalRControl, selectWIndReq, portalWControl;
    AXICount readCount, writeCount;
    AXIAddr readAddr, writeAddr;
    BusData requestValue;

    Fifo1<AXIId>    reqArs, reqAws;
    Fifo1<BeatInfo> readBeat,writeBeat;
    Fifo1<ReadResp> readData;
    Fifo1<BusData>  writeData;
    Fifo1<AXIId>    writeDone;
    UserTop user;
    __implements user.read readUser;

    void MAXIGP0_O.AR(BusData addr, __uint(12) id, __uint(4) len) {
        reqArs.in.enq(id);
        portalRControl = __bitsubstr(addr, 11, __bitsize(AXIAddr)) == 0;
        selectRIndReq = __bitsubstr(addr, 12);
        readCount = len + 1;
        readAddr = addr;
    }
    void MAXIGP0_O.AW(BusData addr, __uint(12) id, __uint(4) len) {
        reqAws.in.enq(id);
        portalWControl = __bitsubstr(addr, 11, __bitsize(AXIAddr)) == 0;
        selectWIndReq = __bitsubstr(addr, 12);
        writeCount = len + 1;
        writeAddr = addr;
    }
    void MAXIGP0_O.W(BusData data, __uint(12) id, bool last) {
        writeData.in.enq(data);
    }
    void readUser.enq(BusData v, bool last) if (!hasIndication) {
        requestValue = v;
        hasIndication = true;//!last;
    }

    __rule init {
       _.interrupt = hasIndication && intEnable;
    }
    __rule lread {
        auto currentRead = reqArs.out.first();
        auto currentRBeat = readBeat.out.first();
        bool currentChannel = selectRIndReq ? false : hasIndication;
        BusData res, portalCtrlInfo;
        if (!portalRControl && currentRBeat.addr == 0)
            hasIndication = false;
        switch (currentRBeat.addr) {
        case 0:    portalCtrlInfo = currentChannel; break;
        case 8:    portalCtrlInfo = 1; break;
        case 0xc:  portalCtrlInfo = currentChannel; break;
        case 0x10: portalCtrlInfo = selectRIndReq ? 6 : 5; break;
        case 0x14: portalCtrlInfo = 2; break;
        default:   portalCtrlInfo = 0; break;
        }
        switch (currentRBeat.addr) {
        case 0:   res = requestValue; break;
        case 4:   res = __ready(user.write.enq); break;
        default:  res = 0; break;
        }
        readData.in.enq(ReadResp{currentRead, portalRControl ? portalCtrlInfo : res});
        readBeat.out.deq();
        if (currentRBeat.count == 1)
            reqArs.out.deq();
    }
    __rule lreadNext {
        auto currentRead = reqArs.out.first();
        readBeat.in.enq(BeatInfo{readCount, readAddr});
        readCount -= 1 ;
        readAddr += 4 ;
    }
    __rule lR {
        auto currentRData = readData.out.first();
        readData.out.deq();
        MAXIGP0_I->R(currentRData.data, currentRData.id, 1, 0);
    }
    __rule lwrite {
        auto currentWrite = reqAws.out.first();
        auto currentWBeat = writeBeat.out.first();
        auto currentWData = writeData.out.first();
        if (currentWBeat.count == 1)
            writeDone.in.enq(currentWrite);
        if (!portalWControl)
            user.write.enq(currentWData, currentWBeat.addr != 0);
        else if (currentWBeat.addr == 4)
            intEnable = __bitsubstr(currentWData, 0, 0);
        writeBeat.out.deq();
        writeData.out.deq();
        if (currentWBeat.count == 1)
            reqAws.out.deq();
    }
    __rule lwriteNext {
        auto currentWrite = reqAws.out.first();
        writeBeat.in.enq(BeatInfo{writeCount, writeAddr});
        writeCount -= 1 ;
        writeAddr += 4 ;
    }
    __rule writeResponse {
        MAXIGP0_I->B(writeDone.out.first(), 0);
        writeDone.out.deq();
    }
};
