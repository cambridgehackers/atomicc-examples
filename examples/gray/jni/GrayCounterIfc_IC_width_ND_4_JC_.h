#include "GeneratedTypes.h"
#ifndef _GRAYCOUNTERIFC_IC_WIDTH_ND_4_JC__H_
#define _GRAYCOUNTERIFC_IC_WIDTH_ND_4_JC__H_
#include "portal.h"

class GrayCounterIfc_IC_width_ND_4_JC_Proxy : public Portal {
    GrayCounterIfc_IC_width_ND_4_JC_Cb *cb;
public:
    GrayCounterIfc_IC_width_ND_4_JC_Proxy(int id, int tile = DEFAULT_TILE, GrayCounterIfc_IC_width_ND_4_JC_Cb *cbarg = &GrayCounterIfc_IC_width_ND_4_JC_ProxyReq, int bufsize = GrayCounterIfc_IC_width_ND_4_JC__reqinfo, PortalPoller *poller = 0) :
        Portal(id, tile, bufsize, NULL, NULL, this, poller), cb(cbarg) {};
    GrayCounterIfc_IC_width_ND_4_JC_Proxy(int id, PortalTransportFunctions *transport, void *param, GrayCounterIfc_IC_width_ND_4_JC_Cb *cbarg = &GrayCounterIfc_IC_width_ND_4_JC_ProxyReq, int bufsize = GrayCounterIfc_IC_width_ND_4_JC__reqinfo, PortalPoller *poller = 0) :
        Portal(id, DEFAULT_TILE, bufsize, NULL, NULL, transport, param, this, poller), cb(cbarg) {};
    GrayCounterIfc_IC_width_ND_4_JC_Proxy(int id, PortalPoller *poller) :
        Portal(id, DEFAULT_TILE, GrayCounterIfc_IC_width_ND_4_JC__reqinfo, NULL, NULL, NULL, NULL, this, poller), cb(&GrayCounterIfc_IC_width_ND_4_JC_ProxyReq) {};
    void decrement (  ) { cb->decrement (&pint); };
    void increment (  ) { cb->increment (&pint); };
    uint8_t readBin (  ) { cb->readBin (&pint); return waitReturn(2, 4); };
    uint8_t readGray (  ) { cb->readGray (&pint); return waitReturn(3, 4); };
    void writeBin ( const uint8_t v ) { cb->writeBin (&pint, v); };
    void writeGray ( const uint8_t v ) { cb->writeGray (&pint, v); };
};
#endif // _GRAYCOUNTERIFC_IC_WIDTH_ND_4_JC__H_
