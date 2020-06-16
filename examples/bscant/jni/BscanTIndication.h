#include "GeneratedTypes.h"
#ifndef _BSCANTINDICATION_H_
#define _BSCANTINDICATION_H_
#include "portal.h"

extern BscanTIndicationCb BscanTIndication_cbTable;
class BscanTIndicationWrapper : public Portal {
public:
    BscanTIndicationWrapper(int id, int tile = DEFAULT_TILE, PORTAL_INDFUNC cba = BscanTIndication_handleMessage, int bufsize = BscanTIndication_reqinfo, PortalPoller *poller = 0) :
           Portal(id, tile, bufsize, cba, (void *)&BscanTIndication_cbTable, this, poller) {
    };
    BscanTIndicationWrapper(int id, PortalTransportFunctions *transport, void *param, PORTAL_INDFUNC cba = BscanTIndication_handleMessage, int bufsize = BscanTIndication_reqinfo, PortalPoller *poller=0):
           Portal(id, DEFAULT_TILE, bufsize, cba, (void *)&BscanTIndication_cbTable, transport, param, this, poller) {
    };
    BscanTIndicationWrapper(int id, PortalPoller *poller) :
           Portal(id, DEFAULT_TILE, BscanTIndication_reqinfo, BscanTIndication_handleMessage, (void *)&BscanTIndication_cbTable, this, poller) {
    };
    BscanTIndicationWrapper(int id, PortalTransportFunctions *transport, void *param, PortalPoller *poller):
           Portal(id, DEFAULT_TILE, BscanTIndication_reqinfo, BscanTIndication_handleMessage, (void *)&BscanTIndication_cbTable, transport, param, this, poller) {
    };
    virtual void disconnect(void) {
        printf("BscanTIndicationWrapper.disconnect called %d\n", pint.client_fd_number);
    };
    virtual void heard ( const uint32_t v ) = 0;
    virtual void heard2 ( const uint16_t a, const uint16_t b ) = 0;
    virtual void heard3 ( const uint16_t a, const uint32_t b, const uint32_t c, const uint16_t d ) = 0;
};
#endif // _BSCANTINDICATION_H_
