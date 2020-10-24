#include "GeneratedTypes.h"
#ifndef _SELECTOUTINDICATION_H_
#define _SELECTOUTINDICATION_H_
#include "portal.h"

extern SelectOutIndicationCb SelectOutIndication_cbTable;
class SelectOutIndicationWrapper : public Portal {
public:
    SelectOutIndicationWrapper(int id, int tile = DEFAULT_TILE, PORTAL_INDFUNC cba = SelectOutIndication_handleMessage, int bufsize = SelectOutIndication_reqinfo, PortalPoller *poller = 0) :
           Portal(id, tile, bufsize, cba, (void *)&SelectOutIndication_cbTable, this, poller) {
    };
    SelectOutIndicationWrapper(int id, PortalTransportFunctions *transport, void *param, PORTAL_INDFUNC cba = SelectOutIndication_handleMessage, int bufsize = SelectOutIndication_reqinfo, PortalPoller *poller=0):
           Portal(id, DEFAULT_TILE, bufsize, cba, (void *)&SelectOutIndication_cbTable, transport, param, this, poller) {
    };
    SelectOutIndicationWrapper(int id, PortalPoller *poller) :
           Portal(id, DEFAULT_TILE, SelectOutIndication_reqinfo, SelectOutIndication_handleMessage, (void *)&SelectOutIndication_cbTable, this, poller) {
    };
    SelectOutIndicationWrapper(int id, PortalTransportFunctions *transport, void *param, PortalPoller *poller):
           Portal(id, DEFAULT_TILE, SelectOutIndication_reqinfo, SelectOutIndication_handleMessage, (void *)&SelectOutIndication_cbTable, transport, param, this, poller) {
    };
    virtual void disconnect(void) {
        printf("SelectOutIndicationWrapper.disconnect called %d\n", pint.client_fd_number);
    };
    virtual void heard ( const uint8_t rindex, const uint32_t v ) = 0;
};
#endif // _SELECTOUTINDICATION_H_
