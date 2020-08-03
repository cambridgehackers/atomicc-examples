#include "GeneratedTypes.h"
#ifndef _ECHOREQUEST_H_
#define _ECHOREQUEST_H_
#include "portal.h"

class EchoRequestProxy : public Portal {
    EchoRequestCb *cb;
public:
    EchoRequestProxy(int id, int tile = DEFAULT_TILE, EchoRequestCb *cbarg = &EchoRequestProxyReq, int bufsize = EchoRequest_reqinfo, PortalPoller *poller = 0) :
        Portal(id, tile, bufsize, NULL, NULL, this, poller), cb(cbarg) {};
    EchoRequestProxy(int id, PortalTransportFunctions *transport, void *param, EchoRequestCb *cbarg = &EchoRequestProxyReq, int bufsize = EchoRequest_reqinfo, PortalPoller *poller = 0) :
        Portal(id, DEFAULT_TILE, bufsize, NULL, NULL, transport, param, this, poller), cb(cbarg) {};
    EchoRequestProxy(int id, PortalPoller *poller) :
        Portal(id, DEFAULT_TILE, EchoRequest_reqinfo, NULL, NULL, NULL, NULL, this, poller), cb(&EchoRequestProxyReq) {};
    void say ( const uint32_t v ) { cb->say (&pint, v); };
};
#endif // _ECHOREQUEST_H_
