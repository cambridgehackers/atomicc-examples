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
    void muxreset ( const uint8_t v ) { cb->muxreset (&pint, v); };
    void run (  ) { cb->run (&pint); };
    void setuph ( const uint16_t ahEnd, const uint16_t ahFrontEnd, const uint8_t ahBackSync, const uint8_t ahSyncWidth ) { cb->setuph (&pint, ahEnd, ahFrontEnd, ahBackSync, ahSyncWidth); };
    void setupv ( const uint16_t avEnd, const uint16_t avFrontEnd, const uint8_t avBackSync, const uint8_t avSyncWidth ) { cb->setupv (&pint, avEnd, avFrontEnd, avBackSync, avSyncWidth); };
    void setupTest ( const uint8_t apattern, const uint32_t aramp ) { cb->setupTest (&pint, apattern, aramp); };
};
#endif // _ECHOREQUEST_H_
