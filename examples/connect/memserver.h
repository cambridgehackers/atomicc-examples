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
    PipeIn<Dummy> pipes;
};
class MMUIndicationOutput {
public:
    MMUIndication ifc;
    PipeOut<Dummy> pipes;
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
    PipeIn<Dummy> pipes;
};
class MemServerIndicationOutput {
public:
    MemServerIndication ifc;
    PipeOut<Dummy> pipes;
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
