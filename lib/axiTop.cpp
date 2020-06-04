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
    bool intEnable, writeReady;
    bool selectRIndReq, portalRControl, selectWIndReq, portalWControl;
    AXICount readCount, writeCount;
    AXIAddr readAddr, writeAddr;

    Fifo1<AXIId>    reqArs, reqAws, writeDone;
    Fifo1<BusData>  requestValue;
    Fifo1<ReadResp> readData;
    Fifo1<BusData>  writeData;
    UserTop user;
    __implements user.read readUser;

    void MAXIGP0_O.AR(BusData addr, __uint(12) id, __uint(4) len) {
        reqArs.in.enq(id);
        portalRControl = __bitsubstr(addr, 11, __bitsize(AXIAddr)) == 0;
        selectRIndReq = __bitsubstr(addr, 12);
        readCount = len;
        readAddr = addr;
    }
    void MAXIGP0_O.AW(BusData addr, __uint(12) id, __uint(4) len) {
        reqAws.in.enq(id);
        portalWControl = __bitsubstr(addr, 11, __bitsize(AXIAddr)) == 0;
        selectWIndReq = __bitsubstr(addr, 12);
        writeCount = len;
        writeAddr = addr;
    }
    void MAXIGP0_O.W(BusData data, __uint(12) id, bool last) {
        writeData.in.enq(data);
    }
    void readUser.enq(BusData v, bool last) {
        requestValue.in.enq(v);
    }

    __rule init {
       _.interrupt = __ready(requestValue.out.deq) && intEnable;
    }
    __rule lread {
        auto currentRead = reqArs.out.first();
        bool currentChannel = selectRIndReq ? false : __ready(requestValue.out.deq);
        BusData res;
        if (portalRControl)
            switch (readAddr) {
            case 0:    res = currentChannel; break;
            case 8:    res = 1; break;
            case 0xc:  res = currentChannel; break;
            case 0x10: res = selectRIndReq ? 6 : 5; break;
            case 0x14: res = 2; break;
            default:   res = 0; break;
            }
        else
            switch (readAddr) {
            case 0:    res = requestValue.out.first();
                       requestValue.out.deq();
                       break;
            case 4:    res = __ready(user.write.enq); break;
            default:   res = 0; break;
            }
        readData.in.enq(ReadResp{currentRead, res});
        if (readCount == 0)
            reqArs.out.deq();
        readCount -= 1;
        readAddr += 4;
    }
    __rule lreadData {
        auto currentRData = readData.out.first();
        MAXIGP0_I->R(currentRData.data, currentRData.id, 1, 0);
        readData.out.deq();
    }
    __rule lwrite {
        auto currentWrite = reqAws.out.first();
        auto currentWData = writeData.out.first();
        if (!portalWControl)
            user.write.enq(currentWData, writeAddr != 0);
        else if (writeAddr == 4)
            intEnable = __bitsubstr(currentWData, 0, 0);
        writeData.out.deq();
        if (writeCount == 0) {
            writeDone.in.enq(currentWrite);
            reqAws.out.deq();
        }
        writeCount -= 1;
        writeAddr += 4;
    }
    __rule writeResponse {
        MAXIGP0_I->B(writeDone.out.first(), 0);
        writeDone.out.deq();
    }
};
