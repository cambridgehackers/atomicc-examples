#include "GeneratedTypes.h"
#ifndef _OININDICATION_H_
#define _OININDICATION_H_
#include "portal.h"

extern OinIndicationCb OinIndication_cbTable;
class OinIndicationWrapper : public Portal {
public:
    OinIndicationWrapper(int id, int tile = DEFAULT_TILE, PORTAL_INDFUNC cba = OinIndication_handleMessage, int bufsize = OinIndication_reqinfo, PortalPoller *poller = 0) :
           Portal(id, tile, bufsize, cba, (void *)&OinIndication_cbTable, this, poller) {
    };
    OinIndicationWrapper(int id, PortalTransportFunctions *transport, void *param, PORTAL_INDFUNC cba = OinIndication_handleMessage, int bufsize = OinIndication_reqinfo, PortalPoller *poller=0):
           Portal(id, DEFAULT_TILE, bufsize, cba, (void *)&OinIndication_cbTable, transport, param, this, poller) {
    };
    OinIndicationWrapper(int id, PortalPoller *poller) :
           Portal(id, DEFAULT_TILE, OinIndication_reqinfo, OinIndication_handleMessage, (void *)&OinIndication_cbTable, this, poller) {
    };
    OinIndicationWrapper(int id, PortalTransportFunctions *transport, void *param, PortalPoller *poller):
           Portal(id, DEFAULT_TILE, OinIndication_reqinfo, OinIndication_handleMessage, (void *)&OinIndication_cbTable, transport, param, this, poller) {
    };
    virtual void disconnect(void) {
        printf("OinIndicationWrapper.disconnect called %d\n", pint.client_fd_number);
    };
    virtual void heard ( const uint32_t v ) = 0;
};
#endif // _OININDICATION_H_
