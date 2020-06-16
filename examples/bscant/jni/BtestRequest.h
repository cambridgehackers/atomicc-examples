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
    void say ( const uint32_t v ) { cb->say (&pint, v); };
    void say2 ( const uint16_t a, const uint16_t b ) { cb->say2 (&pint, a, b); };
    void setLeds ( const uint8_t v ) { cb->setLeds (&pint, v); };
};
#endif // _BTESTREQUEST_H_
