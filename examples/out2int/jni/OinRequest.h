#include "GeneratedTypes.h"
#ifndef _OINREQUEST_H_
#define _OINREQUEST_H_
#include "portal.h"

class OinRequestProxy : public Portal {
    OinRequestCb *cb;
public:
    OinRequestProxy(int id, int tile = DEFAULT_TILE, OinRequestCb *cbarg = &OinRequestProxyReq, int bufsize = OinRequest_reqinfo, PortalPoller *poller = 0) :
        Portal(id, tile, bufsize, NULL, NULL, this, poller), cb(cbarg) {};
    OinRequestProxy(int id, PortalTransportFunctions *transport, void *param, OinRequestCb *cbarg = &OinRequestProxyReq, int bufsize = OinRequest_reqinfo, PortalPoller *poller = 0) :
        Portal(id, DEFAULT_TILE, bufsize, NULL, NULL, transport, param, this, poller), cb(cbarg) {};
    OinRequestProxy(int id, PortalPoller *poller) :
        Portal(id, DEFAULT_TILE, OinRequest_reqinfo, NULL, NULL, NULL, NULL, this, poller), cb(&OinRequestProxyReq) {};
    void say ( const uint32_t v ) { cb->say (&pint, v); };
};
#endif // _OINREQUEST_H_
