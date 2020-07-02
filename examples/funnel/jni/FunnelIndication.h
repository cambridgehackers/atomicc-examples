#include "GeneratedTypes.h"
#ifndef _FUNNELINDICATION_H_
#define _FUNNELINDICATION_H_
#include "portal.h"

extern FunnelIndicationCb FunnelIndication_cbTable;
class FunnelIndicationWrapper : public Portal {
public:
    FunnelIndicationWrapper(int id, int tile = DEFAULT_TILE, PORTAL_INDFUNC cba = FunnelIndication_handleMessage, int bufsize = FunnelIndication_reqinfo, PortalPoller *poller = 0) :
           Portal(id, tile, bufsize, cba, (void *)&FunnelIndication_cbTable, this, poller) {
    };
    FunnelIndicationWrapper(int id, PortalTransportFunctions *transport, void *param, PORTAL_INDFUNC cba = FunnelIndication_handleMessage, int bufsize = FunnelIndication_reqinfo, PortalPoller *poller=0):
           Portal(id, DEFAULT_TILE, bufsize, cba, (void *)&FunnelIndication_cbTable, transport, param, this, poller) {
    };
    FunnelIndicationWrapper(int id, PortalPoller *poller) :
           Portal(id, DEFAULT_TILE, FunnelIndication_reqinfo, FunnelIndication_handleMessage, (void *)&FunnelIndication_cbTable, this, poller) {
    };
    FunnelIndicationWrapper(int id, PortalTransportFunctions *transport, void *param, PortalPoller *poller):
           Portal(id, DEFAULT_TILE, FunnelIndication_reqinfo, FunnelIndication_handleMessage, (void *)&FunnelIndication_cbTable, transport, param, this, poller) {
    };
    virtual void disconnect(void) {
        printf("FunnelIndicationWrapper.disconnect called %d\n", pint.client_fd_number);
    };
    virtual void heard ( const uint32_t v ) = 0;
};
#endif // _FUNNELINDICATION_H_
