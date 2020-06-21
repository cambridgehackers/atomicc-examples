#include "GeneratedTypes.h"

#ifndef NO_CPP_PORTAL_CODE
extern const uint32_t ifcNames_OinIndicationH2S = IfcNames_OinIndicationH2S;
extern const uint32_t ifcNames_OinRequestS2H = IfcNames_OinRequestS2H;

/************** Start of OinIndicationWrapper CPP ***********/
#include "OinIndication.h"
int OinIndicationdisconnect_cb (struct PortalInternal *p) {
    (static_cast<OinIndicationWrapper *>(p->parent))->disconnect();
    return 0;
};
int OinIndicationheard_cb (  struct PortalInternal *p, const uint32_t v ) {
    (static_cast<OinIndicationWrapper *>(p->parent))->heard ( v);
    return 0;
};
OinIndicationCb OinIndication_cbTable = {
    OinIndicationdisconnect_cb,
    OinIndicationheard_cb,
};
#endif //NO_CPP_PORTAL_CODE
