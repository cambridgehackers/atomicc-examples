#include "GeneratedTypes.h"
#ifndef _FUNNELREQUEST_H_
#define _FUNNELREQUEST_H_
#include "portal.h"

class FunnelRequestProxy : public Portal {
    FunnelRequestCb *cb;
public:
    FunnelRequestProxy(int id, int tile = DEFAULT_TILE, FunnelRequestCb *cbarg = &FunnelRequestProxyReq, int bufsize = FunnelRequest_reqinfo, PortalPoller *poller = 0) :
        Portal(id, tile, bufsize, NULL, NULL, this, poller), cb(cbarg) {};
    FunnelRequestProxy(int id, PortalTransportFunctions *transport, void *param, FunnelRequestCb *cbarg = &FunnelRequestProxyReq, int bufsize = FunnelRequest_reqinfo, PortalPoller *poller = 0) :
        Portal(id, DEFAULT_TILE, bufsize, NULL, NULL, transport, param, this, poller), cb(cbarg) {};
    FunnelRequestProxy(int id, PortalPoller *poller) :
        Portal(id, DEFAULT_TILE, FunnelRequest_reqinfo, NULL, NULL, NULL, NULL, this, poller), cb(&FunnelRequestProxyReq) {};
    void say ( const uint32_t v ) { cb->say (&pint, v); };
};
#endif // _FUNNELREQUEST_H_
