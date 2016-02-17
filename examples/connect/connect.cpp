/* Copyright (c) 2016 The Connectal Project
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
#include <fifo.cpp>
#include <math.h>

#define TileTagBits max(log(NumberOfTiles - 1),1)
typedef int Clock;
typedef int Reset;
#define MemOffsetSize 10
#define MemTagSize 10
#define NumReadClients 2
typedef int SGListId;

class Pipes {
public:
};

class MemRequest {
public:
};

class MemReadClient {
};

/////////////////////////////////////////////////
class MMURequest {
public:
};

class MMUIndication {
public:
};

class MMURequestInput {
public:
    MMURequest *request;
    Pipes pipes;
};
class MMUIndicationOutput {
public:
    MMUIndication ifc;
    Pipes pipes;
};

class MemServerRequest {
public:
};
class MemServerIndication {
public:
};
class MemServerRequestInput {
public:
    MemServerRequest *request;
    Pipes pipes;
};
class MemServerIndicationOutput {
public:
    MemServerIndication ifc;
    Pipes pipes;
};
/////////////////////////////////////////////////

typedef struct {
        MemRequest req;
        //FixedPoint<addrWidth> pa;
        FixedPoint<MemTagSize> rename_tag;
        //FixedPoint<log(max(1,numClients))> client;
} RRec;//#(numeric type numClients, numeric type addrWidth);

typedef struct {
   SGListId             id;
   FixedPoint<MemOffsetSize> off;
} AddrTransRequest;

class MMU {
public:
   MMURequest request;
   //Server#(AddrTransRequest,Bit#(addrWidth)) addr[2];
    MMU(int iid, bool hostMapped, MMUIndication mmuIndication) {
   //provisos(Log#(MaxNumSGLists, listIdxSize),
            //Add#(listIdxSize,8, entryIdxSize),
            //Add#(a__,addrWidth,MemOffsetSize));
    }
};

class MemReadInternal {
public:
   //Put#(TileControl) tileControl;
   //PhysMemReadClient#(addrWidth,busWidth) client;
   //MemReadServer#(busWidth) servers[numServers];
private:
   //FixedPoint<log(numTags)> compTagReg;
   //FixedPoint<log(max(1,numServers))> compClientReg;
   //Fifo1<FixedPoint<1 + log(max(1,numServers))>> clientSelect = new FIFO;
   //Fifo1<FixedPoint<log(numTags)>> serverTag = new FIFO;
   //TagGen#(numTags) tag_gen;

   //MemReadInternal(MemServerIndication ind, Server#(AddrTransRequest,FixedPoint<addrWidth)) mmus[numMMUs]) {
   //busWidthBytes = busWidth / 8;
   //beatShift = log(busWidthBytes);
   //assert( beatShift <= 8 ,
        //log(numTags) <= MemTagSize ,
        //beatShift <= BurstLenSize ,
        //(busWidth / 8) <= ByteEnableSize ,
        //);
   //Fifo1<LRec#(numServers,addrWidth)> clientRequest = new SizedFIFO(MMU_PIPELINE_DEPTH);
   //Fifo1<RRec#(numServers,addrWidth)>  serverRequest = new FIFO;
   //BRAM2Port#(FixedPoint<log(numTags)>, DRec#(numServers,addrWidth)) serverProcessing = new BRAM2Server(bramConfig);
   //BRAM2Port#(FixedPoint<log(numTags) + BurstLenSize - beatShift>, MemData#(busWidth)) clientData = new BRAM2Server(bramConfig);
   //RegFile#(FixedPoint<log(numTags)>,Tuple2#(Bool,FixedPoint<BurstLenSize>)) clientBurstLen = new RegFileFull();
   //MemReadServer#(busWidth) sv = newVector[numServers];
   //interface servers = sv;
};

class MemServerRead {
   //MemServerRead(MemServerIndication indication, MMU#(addrWidth) mmus[numMMUs]) {
   //nrc = numClients / numServers;
   //assert(
        //addrWidth <= 64 ,
        //log(busWidth / 8) <= 8 ,
        //log(busWidth / 8) <= BurstLenSize ,
        //busWidth / 8 <= ByteEnableSize ,
        //);
   //ArbitratedMMU#(addrWidth,numClients) mmu_servers[numMMUs] <- mapM(mkArbitratedMMU,map(selectMMUPort,genVector));
   //MemReadInternal#(addrWidth,busWidth,MemServerTags,nrc) readers[numClients];
   //PhysMemReadClient#(addrWidth,busWidth) read_clients[numClients];
   //MemReadServer#(busWidth) read_servers[numServers];
};

class MemServer {
public:
   MemServerRequest request;
   //PhysMemMaster#(addrWidth, busWidth) masters[nMasters];
   MemServer(MemReadClient/*#(busWidth)*/ *readClients/*[numReadClients]*/, MMU *mmus, MemServerIndication indication) {
   //nws = (numWriteClients / nMasters) * nMasters;
   //nrs = (numReadClients / nMasters) * nMasters;
   //assert(
        //log(busWidth / 8) <= 8 ,
        //log(busWidth / 8) <= BurstLenSize ,
        //addrWidth <= 64 ,
        //numWriteClients <= nws ,
        //numReadClients <= nrs ,
        //busWidth / 8 <= ByteEnableSize ,
        //);
   //MemServerRead#(addrWidth,busWidth,nMasters,nrs)  reader = new MemServerRead(indication, mmus);
   //zipWithM_(mkConnection,readClients,take(reader.servers));
   }
};

class Platform {
public:
   //PhysMemSlave#(32,32) slave;
   //PhysMemMaster#(PhysAddrWidth, DataBusWidth)) masters[NumberOfMasters];
   //Bool interrupt[MaxNumberOfPortals];
   //PinType pins;
private:
   //PhysMemSlave#(18,32) tile_slaves[NumberOfUserTiles];
   //Vector#(NumReadClients, MemReadClient#(DataBusWidth)) tile_read_clients[NumberOfUserTiles];

   //Platform(ConnectalTop tiles[NumberOfUserTiles]) {
   //MMUIndicationProxy lMMUIndicationProxy = new MMUIndicationProxy(PlatformIfcNames_MMUIndicationH2S);
   //MemServerIndicationProxy lMemServerIndicationProxy = new MemServerIndicationProxy(PlatformIfcNames_MemServerIndicationH2S);
   //MMU#(PhysAddrWidth) lMMU = new MMU(0,True, lMMUIndicationProxy.ifc);
   //MemReadClient#(DataBusWidth) tile_read_clients_renamed[NumberOfUserTiles * NumReadClients] <- zipWith3M(renameReads, concat(read_client_tile_numbers), concat(tile_read_clients), replicate(lMemServerIndicationProxy.ifc));
   //MemServer#(PhysAddrWidth,DataBusWidth,NumberOfMasters) lMemServer = new MemServer(tile_read_clients_renamed, lMMU, lMemServerIndicationProxy.ifc);
   //MMURequestWrapper lMMURequestWrapper = new MMURequestWrapper(PlatformIfcNames_MMURequestS2H, lMMU.request);
   //MemServerRequestWrapper lMemServerRequestWrapper = new MemServerRequestWrapper(PlatformIfcNames_MemServerRequestS2H, lMemServer.request);
   //StdPortal framework_portals[4];
   //framework_portals[0] = lMMUIndicationProxy.portalIfc;
   //PhysMemSlave#(18,32) framework_ctrl_mux = new SlaveMux(framework_portals);
   //let framework_intr = new InterruptMux(getInterruptVector(framework_portals));
   //PhysMemSlave#(32,32) ctrl_mux = new PhysMemSlaveMux(cons(framework_ctrl_mux,tile_slaves));
   //Bool interrupts[MaxNumberOfPortals] = replicate(interface ReadOnly; method Bool _read(); return False; endmethod endinterface);
};

/////////////////////////////////////////////////////////
class MemreadIndication {
public:
};

class MemreadRequest {
public:
};

class MemreadIndicationOutput {
public:
    MemreadIndication ifc;
    Pipes pipes;
};
class MemreadRequestInput {
public:
    MemreadRequest ifc;
    Pipes pipes;
};

class Memread {
public:
    MemReadClient *readers;
    Memread(MemreadIndication indication) {
        readers = new MemReadClient[NumReadClients];
    }
};

class CnocTop {
    MemreadIndicationOutput lMemreadIndicationOutput;
    MemreadRequestInput lMemreadRequestInput;
    Memread lMemread;
public:
    MemReadClient *readers;
    CnocTop(/*NumberOfRequests,NumberOfIndications,PhysAddrWidth,DataBusWidth,`PinType,NumberOfMasters*/) :
        lMemread(lMemreadIndicationOutput.ifc)
        {
        readers = lMemread.readers;
    //mkConnection(lMemreadRequestInput.pipes, lMemread.request);

    //let lMemreadIndicationOutputNoc <- mkPortalMsgIndication(extend(pack(IfcNames_MemreadIndicationH2S)), lMemreadIndicationOutput.portalIfc.indications, lMemreadIndicationOutput.portalIfc.messageSize);
    //let lMemreadRequestInputNoc <- mkPortalMsgRequest(extend(pack(IfcNames_MemreadRequestS2H)), lMemreadRequestInput.portalIfc.requests);
    //Vector#(NumReadClients,MemReadClient#(DataBusWidth)) nullReaders = replicate(null_mem_read_client());
    //interface requests = cons(lMemreadRequestInputNoc,nil);
    //interface indications = cons(lMemreadIndicationOutputNoc,nil);
    //interface readers = take((nullReaders));
    }
};
/////////////////////////////////////////////////////////

class XsimTop {
   CnocTop top;
   MMURequestInput lMMURequestInput;
   MMUIndicationOutput lMMUIndicationOutput;
   MemServerIndicationOutput lMemServerIndicationOutput;
   MemServerRequestInput lMemServerRequestInput;
   MMU lMMU;
   MemServer lMemServer; //#(PhysAddrWidth,DataBusWidth,NumberOfMasters) 
public:
   XsimTop(Clock derivedClock, Reset derivedReset, Clock sys_clk) :
      lMMU(0,true, lMMUIndicationOutput.ifc),
      lMemServer(top.readers, &lMMU, lMemServerIndicationOutput.ifc)
   {
      lMMURequestInput.request = &lMMU.request;
      lMemServerRequestInput.request = &lMemServer.request;
   }
};
/////////////////////////////////////////////////////////

typedef FixedPoint<6> myint6;
typedef FixedPoint<4> myint4;

typedef struct {
    myint6 a;
    myint4 b;
} ValueType;

class ConnectIndication {
public:
    INDICATION(heard, (myint6 meth, myint4 v), { return true; });
    ConnectIndication() {
        EXPORTREQUEST(ConnectIndication::heard);
    }
};

class ConnectRequest {
public:
    METHOD(say, (myint6 meth, myint4 v), {return true; }){}
    ConnectRequest() {
        EXPORTREQUEST(ConnectRequest::say);
    }
};

ValueType grumpy;

class Connect : public Module, ConnectRequest {
    Fifo1<ValueType> fifo;
    FixedPoint<23>   fcounter;
    FixedPointV      counter;    // the precision of these members is set by the constructor
    FixedPointV      gcounter;
    ConnectIndication *ind;
    XsimTop          lXsimTop;
public:
    METHOD(say, (myint6 meth, myint4 v), {return true; }) {
        ValueType temp;
        temp.a = meth;
        temp.b = v;
        fifo.in.enq(temp);
    }
    Connect(ConnectIndication *ind) : ind(ind), counter(lrint(log(4))), gcounter(grumpy.a.size + grumpy.b.size),
        lXsimTop(0, 0, 0)
    {
        EXPORTREQUEST(Connect::say);
        RULE(Connect, "respond", {
            ValueType temp = this->fifo.out.first();
            this->fifo.out.deq();
            this->ind->heard(temp.a, temp.b);
            fixedSet((void *)&this->gcounter, fixedGet((void *)&this->gcounter) + 1);
            });
    };
    ~Connect() {}
};

////////////////////////////////////////////////////////////
// Test Bench
////////////////////////////////////////////////////////////

void ConnectIndication::heard(myint6 meth, myint4 v)
{
    //printf("Heard an connect: %d %d\n", meth, v);
    printf("Heard an connect: %d %d\n", 0, 0);
    stop_main_program = 1;
}

class ConnectTest {
public:
    Connect *connect;
public:
    ConnectTest(): connect(new Connect(new ConnectIndication())) {
        printf("ConnectTest: addr %p size 0x%lx csize 0x%lx\n", this, sizeof(*this), sizeof(ConnectTest));
    }
    ~ConnectTest() {}
};

ConnectTest connectTest;

int main(int argc, const char *argv[])
{
    printf("[%s:%d] starting %d\n", __FUNCTION__, __LINE__, argc);
    while (!connectTest.connect->say__RDY())
        ;
    connectTest.connect->say(2, 44);
    if (argc != 1)
        run_main_program();
    printf("[%s:%d] ending\n", __FUNCTION__, __LINE__);
    return 0;
}

