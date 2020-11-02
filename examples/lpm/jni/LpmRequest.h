#include "GeneratedTypes.h"
#ifndef _LPMREQUEST_H_
#define _LPMREQUEST_H_
#include "portal.h"

class LpmRequestProxy : public Portal {
    LpmRequestCb *cb;
public:
    LpmRequestProxy(int id, int tile = DEFAULT_TILE, LpmRequestCb *cbarg = &LpmRequestProxyReq, int bufsize = LpmRequest_reqinfo, PortalPoller *poller = 0) :
        Portal(id, tile, bufsize, NULL, NULL, this, poller), cb(cbarg) {};
    LpmRequestProxy(int id, PortalTransportFunctions *transport, void *param, LpmRequestCb *cbarg = &LpmRequestProxyReq, int bufsize = LpmRequest_reqinfo, PortalPoller *poller = 0) :
        Portal(id, DEFAULT_TILE, bufsize, NULL, NULL, transport, param, this, poller), cb(cbarg) {};
    LpmRequestProxy(int id, PortalPoller *poller) :
        Portal(id, DEFAULT_TILE, LpmRequest_reqinfo, NULL, NULL, NULL, NULL, this, poller), cb(&LpmRequestProxyReq) {};
    void enter ( const uint32_t data ) { cb->enter (&pint, data); };
    void write ( const uint32_t addr, const uint32_t data ) { cb->write (&pint, addr, data); };
};
#endif // _LPMREQUEST_H_
