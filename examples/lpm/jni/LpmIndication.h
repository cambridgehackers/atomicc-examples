#include "GeneratedTypes.h"
#ifndef _LPMINDICATION_H_
#define _LPMINDICATION_H_
#include "portal.h"

extern LpmIndicationCb LpmIndication_cbTable;
class LpmIndicationWrapper : public Portal {
public:
    LpmIndicationWrapper(int id, int tile = DEFAULT_TILE, PORTAL_INDFUNC cba = LpmIndication_handleMessage, int bufsize = LpmIndication_reqinfo, PortalPoller *poller = 0) :
           Portal(id, tile, bufsize, cba, (void *)&LpmIndication_cbTable, this, poller) {
    };
    LpmIndicationWrapper(int id, PortalTransportFunctions *transport, void *param, PORTAL_INDFUNC cba = LpmIndication_handleMessage, int bufsize = LpmIndication_reqinfo, PortalPoller *poller=0):
           Portal(id, DEFAULT_TILE, bufsize, cba, (void *)&LpmIndication_cbTable, transport, param, this, poller) {
    };
    LpmIndicationWrapper(int id, PortalPoller *poller) :
           Portal(id, DEFAULT_TILE, LpmIndication_reqinfo, LpmIndication_handleMessage, (void *)&LpmIndication_cbTable, this, poller) {
    };
    LpmIndicationWrapper(int id, PortalTransportFunctions *transport, void *param, PortalPoller *poller):
           Portal(id, DEFAULT_TILE, LpmIndication_reqinfo, LpmIndication_handleMessage, (void *)&LpmIndication_cbTable, transport, param, this, poller) {
    };
    virtual void disconnect(void) {
        printf("LpmIndicationWrapper.disconnect called %d\n", pint.client_fd_number);
    };
    virtual void out ( const uint32_t data ) = 0;
};
#endif // _LPMINDICATION_H_
