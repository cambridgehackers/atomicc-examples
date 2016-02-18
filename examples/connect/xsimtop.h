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
