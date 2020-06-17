#include "GeneratedTypes.h"
#ifndef _BTESTINDICATION_H_
#define _BTESTINDICATION_H_
#include "portal.h"

extern BtestIndicationCb BtestIndication_cbTable;
class BtestIndicationWrapper : public Portal {
public:
    BtestIndicationWrapper(int id, int tile = DEFAULT_TILE, PORTAL_INDFUNC cba = BtestIndication_handleMessage, int bufsize = BtestIndication_reqinfo, PortalPoller *poller = 0) :
           Portal(id, tile, bufsize, cba, (void *)&BtestIndication_cbTable, this, poller) {
    };
    BtestIndicationWrapper(int id, PortalTransportFunctions *transport, void *param, PORTAL_INDFUNC cba = BtestIndication_handleMessage, int bufsize = BtestIndication_reqinfo, PortalPoller *poller=0):
           Portal(id, DEFAULT_TILE, bufsize, cba, (void *)&BtestIndication_cbTable, transport, param, this, poller) {
    };
    BtestIndicationWrapper(int id, PortalPoller *poller) :
           Portal(id, DEFAULT_TILE, BtestIndication_reqinfo, BtestIndication_handleMessage, (void *)&BtestIndication_cbTable, this, poller) {
    };
    BtestIndicationWrapper(int id, PortalTransportFunctions *transport, void *param, PortalPoller *poller):
           Portal(id, DEFAULT_TILE, BtestIndication_reqinfo, BtestIndication_handleMessage, (void *)&BtestIndication_cbTable, transport, param, this, poller) {
    };
    virtual void disconnect(void) {
        printf("BtestIndicationWrapper.disconnect called %d\n", pint.client_fd_number);
    };
    virtual void heard ( const uint32_t v, const uint8_t writeCount, const uint8_t readCount, const uint8_t seqno ) = 0;
};
#endif // _BTESTINDICATION_H_
