#include "GeneratedTypes.h"

#ifndef NO_CPP_PORTAL_CODE
extern const uint32_t ifcNames_LpmIndicationH2S = IfcNames_LpmIndicationH2S;
extern const uint32_t ifcNames_LpmRequestS2H = IfcNames_LpmRequestS2H;

/************** Start of LpmIndicationWrapper CPP ***********/
#include "LpmIndication.h"
int LpmIndicationdisconnect_cb (struct PortalInternal *p) {
    (static_cast<LpmIndicationWrapper *>(p->parent))->disconnect();
    return 0;
};
int LpmIndicationout_cb (  struct PortalInternal *p, const uint32_t data ) {
    (static_cast<LpmIndicationWrapper *>(p->parent))->out ( data);
    return 0;
};
LpmIndicationCb LpmIndication_cbTable = {
    LpmIndicationdisconnect_cb,
    LpmIndicationout_cb,
};
#endif //NO_CPP_PORTAL_CODE
