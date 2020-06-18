#include "GeneratedTypes.h"
#ifndef _PACKREQUEST_H_
#define _PACKREQUEST_H_
#include "portal.h"

class PackRequestProxy : public Portal {
    PackRequestCb *cb;
public:
    PackRequestProxy(int id, int tile = DEFAULT_TILE, PackRequestCb *cbarg = &PackRequestProxyReq, int bufsize = PackRequest_reqinfo, PortalPoller *poller = 0) :
        Portal(id, tile, bufsize, NULL, NULL, this, poller), cb(cbarg) {};
    PackRequestProxy(int id, PortalTransportFunctions *transport, void *param, PackRequestCb *cbarg = &PackRequestProxyReq, int bufsize = PackRequest_reqinfo, PortalPoller *poller = 0) :
        Portal(id, DEFAULT_TILE, bufsize, NULL, NULL, transport, param, this, poller), cb(cbarg) {};
    PackRequestProxy(int id, PortalPoller *poller) :
        Portal(id, DEFAULT_TILE, PackRequest_reqinfo, NULL, NULL, NULL, NULL, this, poller), cb(&PackRequestProxyReq) {};
    void say ( const uint32_t v, const uint8_t seqno ) { cb->say (&pint, v, seqno); };
};
#endif // _PACKREQUEST_H_
