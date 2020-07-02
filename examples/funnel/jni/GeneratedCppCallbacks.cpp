#include "GeneratedTypes.h"

#ifndef NO_CPP_PORTAL_CODE
extern const uint32_t ifcNames_FunnelIndicationH2S = IfcNames_FunnelIndicationH2S;
extern const uint32_t ifcNames_FunnelRequestS2H = IfcNames_FunnelRequestS2H;

/************** Start of FunnelIndicationWrapper CPP ***********/
#include "FunnelIndication.h"
int FunnelIndicationdisconnect_cb (struct PortalInternal *p) {
    (static_cast<FunnelIndicationWrapper *>(p->parent))->disconnect();
    return 0;
};
int FunnelIndicationheard_cb (  struct PortalInternal *p, const uint32_t v ) {
    (static_cast<FunnelIndicationWrapper *>(p->parent))->heard ( v);
    return 0;
};
FunnelIndicationCb FunnelIndication_cbTable = {
    FunnelIndicationdisconnect_cb,
    FunnelIndicationheard_cb,
};
#endif //NO_CPP_PORTAL_CODE
