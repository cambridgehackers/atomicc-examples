#include "GeneratedTypes.h"
#ifndef _BSCANTREQUEST_H_
#define _BSCANTREQUEST_H_
#include "portal.h"

class BscanTRequestProxy : public Portal {
    BscanTRequestCb *cb;
public:
    BscanTRequestProxy(int id, int tile = DEFAULT_TILE, BscanTRequestCb *cbarg = &BscanTRequestProxyReq, int bufsize = BscanTRequest_reqinfo, PortalPoller *poller = 0) :
        Portal(id, tile, bufsize, NULL, NULL, this, poller), cb(cbarg) {};
    BscanTRequestProxy(int id, PortalTransportFunctions *transport, void *param, BscanTRequestCb *cbarg = &BscanTRequestProxyReq, int bufsize = BscanTRequest_reqinfo, PortalPoller *poller = 0) :
        Portal(id, DEFAULT_TILE, bufsize, NULL, NULL, transport, param, this, poller), cb(cbarg) {};
    BscanTRequestProxy(int id, PortalPoller *poller) :
        Portal(id, DEFAULT_TILE, BscanTRequest_reqinfo, NULL, NULL, NULL, NULL, this, poller), cb(&BscanTRequestProxyReq) {};
    void say ( const uint32_t v ) { cb->say (&pint, v); };
    void say2 ( const uint16_t a, const uint16_t b ) { cb->say2 (&pint, a, b); };
    void setLeds ( const uint8_t v ) { cb->setLeds (&pint, v); };
};
#endif // _BSCANTREQUEST_H_
