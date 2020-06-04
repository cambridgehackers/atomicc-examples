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
    bool       last;
    AddrCount  ac;
} PortalInfo;
typedef struct {
    AXIId      id;
    BusData    data;
} ReadResp;

class AxiTop __implements AxiTopIfc {
    bool intEnable, writeNotFirst, writeLast, readNotFirst, readLast;
    bool selectRIndReq, portalRControl, selectWIndReq, portalWControl;
    bool hasIndication, writeReady;
    AXICount readCount, writeCount;
    AXIAddr readAddr, writeAddr;
    BusData requestValue;

    Fifo1<AddrCount>  reqArs, reqAws;
    Fifo1<PortalInfo> readBeat,writeBeat;
    Fifo1<ReadResp>   readData;
    Fifo1<BusData>    writeData;
    Fifo1<AXIId>      writeDone;
    UserTop user;
    __implements user.read readUser;

    void MAXIGP0_O.AR(BusData addr, __uint(12) id, __uint(4) len) {
        reqArs.in.enq(AddrCount{static_cast<AXIId>(id), len + 1, static_cast<AXIAddr>(addr)});
        portalRControl = __bitsubstr(addr, 11, __bitsize(AXIAddr)) == 0;
        selectRIndReq = __bitsubstr(addr, 12);
    }
    void MAXIGP0_O.AW(BusData addr, __uint(12) id, __uint(4) len) {
        reqAws.in.enq(AddrCount{static_cast<AXIId>(id), len + 1, static_cast<AXIAddr>(addr)});
        portalWControl = __bitsubstr(addr, 11, __bitsize(AXIAddr)) == 0;
        selectWIndReq = __bitsubstr(addr, 12);
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
        auto currentRBeat = readBeat.out.first();
        bool currentChannel = selectRIndReq ? false : hasIndication;
        BusData res, portalCtrlInfo;
        if (!portalRControl && currentRBeat.ac.addr == 0)
            hasIndication = false;
        switch (currentRBeat.ac.addr) {
        case 0:    portalCtrlInfo = currentChannel; break;
        case 8:    portalCtrlInfo = 1; break;
        case 0xc:  portalCtrlInfo = currentChannel; break;
        case 0x10: portalCtrlInfo = selectRIndReq ? 6 : 5; break;
        case 0x14: portalCtrlInfo = 2; break;
        default:   portalCtrlInfo = 0; break;
        }
        switch (currentRBeat.ac.addr) {
        case 0:   res = requestValue; break;
        case 4:   res = __ready(user.write.enq); break;
        default:  res = 0; break;
        }
        readData.in.enq(ReadResp{currentRBeat.ac.id, portalRControl ? portalCtrlInfo : res});
        readBeat.out.deq();
    }
    __rule lreadNext {
        auto currentRead = reqArs.out.first();
        bool readLastNext = readNotFirst ? readLast : currentRead.count == 1;
        auto readburstCount = readNotFirst ? readCount : currentRead.count;
        auto readAddrUpdate = readNotFirst ? readAddr : currentRead.addr;
        readBeat.in.enq(PortalInfo{readLastNext, currentRead.id, readburstCount, readAddrUpdate});
        readNotFirst = !readLastNext;
        readCount = readburstCount - 1 ;
        readLast = readburstCount == 2 ;
        readAddr = readAddrUpdate + 4 ;
        if (readLastNext)
            reqArs.out.deq();
    }
    __rule lR {
        auto currentReadData = readData.out.first();
        readData.out.deq();
        MAXIGP0_I->R(currentReadData.data, currentReadData.id, 1, 0);
    }
    __rule lwrite {
        auto currentWBeat = writeBeat.out.first();
        auto currentWData = writeData.out.first();
        if (currentWBeat.last)
            writeDone.in.enq(currentWBeat.ac.id);
        if (!portalWControl)
            user.write.enq(currentWData, currentWBeat.ac.addr != 0);
        else if (currentWBeat.ac.addr == 4)
            intEnable = __bitsubstr(currentWData, 0, 0);
        writeBeat.out.deq();
        writeData.out.deq();
    }
    __rule lwriteNext {
        auto currentWrite = reqAws.out.first();
        bool writeLastNext = writeNotFirst ? writeLast : currentWrite.count == 1;
        auto writeBurstCount = writeNotFirst ? writeCount : currentWrite.count;
        auto writeAddrUpdate = writeNotFirst ? writeAddr : currentWrite.addr;
        writeBeat.in.enq(PortalInfo{writeLastNext, currentWrite.id, writeBurstCount, writeAddrUpdate});
        writeNotFirst = !writeLastNext ;
        writeCount = writeBurstCount - 1 ;
        writeLast = writeBurstCount == 2 ;
        writeAddr = writeAddrUpdate + 4 ;
        if (writeLastNext)
            reqAws.out.deq();
    }
    __rule writeResponse {
        MAXIGP0_I->B(writeDone.out.first(), 0);
        writeDone.out.deq();
    }
};
