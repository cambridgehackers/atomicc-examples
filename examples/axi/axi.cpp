
#include <vector>

class AxiRequest {
  void ar(int addr, int burst, int cache, int id, int len);
  void aw(int addr, int burst, int cache, int id, int len);
  void w(int data, int id);
};

class AxiResponse {
  void r(int data);
  void b(int id);
};

class AxiSlave {
  AxiRequest request;
  AxiResponse *response;
};

class AxiMaster {
  AxiRequest *request;
  AxiResponse response;
};

void connect(AxiMaster m, AxiSlave s)
{
  m.response = &s.response;
  s.request = &m.request;
}

class AxiDemux {
  AxiSlave slave;
  vector<int> startAddrs;
  vector<int> endAddrs;
  vector<AxiMaster*> masters;
  FIFO<AxiRequestMsg> arfifo;

  // construct the module
  AxiDemux() {
    // connect the interface methods
    slave.request.ar = ar;
    ...
  }

  // connect downstream Axi slaves and create a demux rule
  void connectMaster(AxiMaster *master, int startAddr, int endAddr) {
    int i = masters.size();
    masters.push_back(master);
    startAddrs.push_back(startAddr);
    endAddrs.push_back(endAddr);

    rule ar_rule if (arfifo.notEmpty()) {
      AxiRequestMsg req = arfifo.first();
      if (addr >= startAddrs[i] && addr <= endAddrs[i]) {
	masters[i]->ar(req.addr, req.burst, req.cache, req.id, req.len);
	arfifo.deq();
      }
    }

  }

  // wishful thinking about inline interface syntax
  interface  AxiSlave {
    interface AxiRequest {
      void ar(int addr, int burst, int cache, int id, int len) {
	arfifo.enq(AxiRequestMsg(addr, burst, cache, id, len));
      }
    } request;
  } slave;

  // alternative interface expression wishful thinking -- this could be made to handle vectors of interfaces
  AxiSlave slave;
  AxiDemux() {
    slave = interface AxiSlave {
      interface AxiRequest {
	void ar(int addr, int burst, int cache, int id, int len) {
	  arfifo.enq(AxiRequestMsg(addr, burst, cache, id, len));
	}
      } request;
    };
  }

};
