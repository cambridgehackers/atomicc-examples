/////////////////////////////////////////////////////////

class CnocTop {
    MemreadIndicationOutput lMemreadIndicationOutput;
    MemreadRequestInput lMemreadRequestInput;
    Memread lMemread;
public:
    /*NumberOfRequests,NumberOfIndications,PhysAddrWidth,DataBusWidth,`PinType,NumberOfMasters*/
    //MemReadClient *readers;
    CnocTop() :
        lMemreadRequestInput(&lMemread.request),
        lMemread(&lMemreadIndicationOutput.indication)
        {
        //readers = lMemread.readers;
    //let lMemreadIndicationOutputNoc <- mkPortalMsgIndication(extend(pack(IfcNames_MemreadIndicationH2S)), lMemreadIndicationOutput.portalIfc.indications, lMemreadIndicationOutput.portalIfc.messageSize);
    //let lMemreadRequestInputNoc <- mkPortalMsgRequest(extend(pack(IfcNames_MemreadRequestS2H)), lMemreadRequestInput.portalIfc.requests);
    //Vector#(NumReadClients,MemReadClient#(DataBusWidth)) nullReaders = replicate(null_mem_read_client());
    //interface requests = cons(lMemreadRequestInputNoc,nil);
    //interface indications = cons(lMemreadIndicationOutputNoc,nil);
    //interface readers = take((nullReaders));
    }
};

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
