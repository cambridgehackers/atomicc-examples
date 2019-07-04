#include "GeneratedTypes.h"
#ifndef _RETURNIND_IC_WIDTH_ND_4_JC__H_
#define _RETURNIND_IC_WIDTH_ND_4_JC__H_
#include "portal.h"

extern ReturnInd_IC_width_ND_4_JC_Cb ReturnInd_IC_width_ND_4_JC__cbTable;
class ReturnInd_IC_width_ND_4_JC_Wrapper : public Portal {
public:
    ReturnInd_IC_width_ND_4_JC_Wrapper(int id, int tile = DEFAULT_TILE, PORTAL_INDFUNC cba = ReturnInd_IC_width_ND_4_JC__handleMessage, int bufsize = ReturnInd_IC_width_ND_4_JC__reqinfo, PortalPoller *poller = 0) :
           Portal(id, tile, bufsize, cba, (void *)&ReturnInd_IC_width_ND_4_JC__cbTable, this, poller) {
    };
    ReturnInd_IC_width_ND_4_JC_Wrapper(int id, PortalTransportFunctions *transport, void *param, PORTAL_INDFUNC cba = ReturnInd_IC_width_ND_4_JC__handleMessage, int bufsize = ReturnInd_IC_width_ND_4_JC__reqinfo, PortalPoller *poller=0):
           Portal(id, DEFAULT_TILE, bufsize, cba, (void *)&ReturnInd_IC_width_ND_4_JC__cbTable, transport, param, this, poller) {
    };
    ReturnInd_IC_width_ND_4_JC_Wrapper(int id, PortalPoller *poller) :
           Portal(id, DEFAULT_TILE, ReturnInd_IC_width_ND_4_JC__reqinfo, ReturnInd_IC_width_ND_4_JC__handleMessage, (void *)&ReturnInd_IC_width_ND_4_JC__cbTable, this, poller) {
    };
    ReturnInd_IC_width_ND_4_JC_Wrapper(int id, PortalTransportFunctions *transport, void *param, PortalPoller *poller):
           Portal(id, DEFAULT_TILE, ReturnInd_IC_width_ND_4_JC__reqinfo, ReturnInd_IC_width_ND_4_JC__handleMessage, (void *)&ReturnInd_IC_width_ND_4_JC__cbTable, transport, param, this, poller) {
    };
    virtual void disconnect(void) {
        printf("ReturnInd_IC_width_ND_4_JC_Wrapper.disconnect called %d\n", pint.client_fd_number);
    };
    virtual void value ( const uint8_t v ) = 0;
};
#endif // _RETURNIND_IC_WIDTH_ND_4_JC__H_
