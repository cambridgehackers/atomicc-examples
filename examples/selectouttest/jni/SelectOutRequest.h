#include "GeneratedTypes.h"
#ifndef _SELECTOUTREQUEST_H_
#define _SELECTOUTREQUEST_H_
#include "portal.h"

class SelectOutRequestProxy : public Portal {
    SelectOutRequestCb *cb;
public:
    SelectOutRequestProxy(int id, int tile = DEFAULT_TILE, SelectOutRequestCb *cbarg = &SelectOutRequestProxyReq, int bufsize = SelectOutRequest_reqinfo, PortalPoller *poller = 0) :
        Portal(id, tile, bufsize, NULL, NULL, this, poller), cb(cbarg) {};
    SelectOutRequestProxy(int id, PortalTransportFunctions *transport, void *param, SelectOutRequestCb *cbarg = &SelectOutRequestProxyReq, int bufsize = SelectOutRequest_reqinfo, PortalPoller *poller = 0) :
        Portal(id, DEFAULT_TILE, bufsize, NULL, NULL, transport, param, this, poller), cb(cbarg) {};
    SelectOutRequestProxy(int id, PortalPoller *poller) :
        Portal(id, DEFAULT_TILE, SelectOutRequest_reqinfo, NULL, NULL, NULL, NULL, this, poller), cb(&SelectOutRequestProxyReq) {};
    void say ( const uint32_t v ) { cb->say (&pint, v); };
};
#endif // _SELECTOUTREQUEST_H_
