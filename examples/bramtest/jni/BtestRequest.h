#include "GeneratedTypes.h"
#ifndef _BTESTREQUEST_H_
#define _BTESTREQUEST_H_
#include "portal.h"

class BtestRequestProxy : public Portal {
    BtestRequestCb *cb;
public:
    BtestRequestProxy(int id, int tile = DEFAULT_TILE, BtestRequestCb *cbarg = &BtestRequestProxyReq, int bufsize = BtestRequest_reqinfo, PortalPoller *poller = 0) :
        Portal(id, tile, bufsize, NULL, NULL, this, poller), cb(cbarg) {};
    BtestRequestProxy(int id, PortalTransportFunctions *transport, void *param, BtestRequestCb *cbarg = &BtestRequestProxyReq, int bufsize = BtestRequest_reqinfo, PortalPoller *poller = 0) :
        Portal(id, DEFAULT_TILE, bufsize, NULL, NULL, transport, param, this, poller), cb(cbarg) {};
    BtestRequestProxy(int id, PortalPoller *poller) :
        Portal(id, DEFAULT_TILE, BtestRequest_reqinfo, NULL, NULL, NULL, NULL, this, poller), cb(&BtestRequestProxyReq) {};
    void read ( const uint32_t addr ) { cb->read (&pint, addr); };
    void write ( const uint32_t addr, const uint32_t data ) { cb->write (&pint, addr, data); };
};
#endif // _BTESTREQUEST_H_
