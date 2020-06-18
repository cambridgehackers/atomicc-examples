#include "GeneratedTypes.h"
#ifndef _PACKINDICATION_H_
#define _PACKINDICATION_H_
#include "portal.h"

extern PackIndicationCb PackIndication_cbTable;
class PackIndicationWrapper : public Portal {
public:
    PackIndicationWrapper(int id, int tile = DEFAULT_TILE, PORTAL_INDFUNC cba = PackIndication_handleMessage, int bufsize = PackIndication_reqinfo, PortalPoller *poller = 0) :
           Portal(id, tile, bufsize, cba, (void *)&PackIndication_cbTable, this, poller) {
    };
    PackIndicationWrapper(int id, PortalTransportFunctions *transport, void *param, PORTAL_INDFUNC cba = PackIndication_handleMessage, int bufsize = PackIndication_reqinfo, PortalPoller *poller=0):
           Portal(id, DEFAULT_TILE, bufsize, cba, (void *)&PackIndication_cbTable, transport, param, this, poller) {
    };
    PackIndicationWrapper(int id, PortalPoller *poller) :
           Portal(id, DEFAULT_TILE, PackIndication_reqinfo, PackIndication_handleMessage, (void *)&PackIndication_cbTable, this, poller) {
    };
    PackIndicationWrapper(int id, PortalTransportFunctions *transport, void *param, PortalPoller *poller):
           Portal(id, DEFAULT_TILE, PackIndication_reqinfo, PackIndication_handleMessage, (void *)&PackIndication_cbTable, transport, param, this, poller) {
    };
    virtual void disconnect(void) {
        printf("PackIndicationWrapper.disconnect called %d\n", pint.client_fd_number);
    };
    virtual void heard ( const uint32_t v, const uint8_t writeCount, const uint8_t readCount, const uint8_t seqno ) = 0;
};
#endif // _PACKINDICATION_H_
