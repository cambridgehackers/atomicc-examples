#include "GeneratedTypes.h"

#ifndef NO_CPP_PORTAL_CODE
extern const uint32_t ifcNames_BtestIndicationH2S = IfcNames_BtestIndicationH2S;
extern const uint32_t ifcNames_BtestRequestS2H = IfcNames_BtestRequestS2H;

/************** Start of BtestIndicationWrapper CPP ***********/
#include "BtestIndication.h"
int BtestIndicationdisconnect_cb (struct PortalInternal *p) {
    (static_cast<BtestIndicationWrapper *>(p->parent))->disconnect();
    return 0;
};
int BtestIndicationheard_cb (  struct PortalInternal *p, const uint32_t v ) {
    (static_cast<BtestIndicationWrapper *>(p->parent))->heard ( v);
    return 0;
};
int BtestIndicationheard2_cb (  struct PortalInternal *p, const uint16_t a, const uint16_t b ) {
    (static_cast<BtestIndicationWrapper *>(p->parent))->heard2 ( a, b);
    return 0;
};
int BtestIndicationheard3_cb (  struct PortalInternal *p, const uint16_t a, const uint32_t b, const uint32_t c, const uint16_t d ) {
    (static_cast<BtestIndicationWrapper *>(p->parent))->heard3 ( a, b, c, d);
    return 0;
};
BtestIndicationCb BtestIndication_cbTable = {
    BtestIndicationdisconnect_cb,
    BtestIndicationheard_cb,
    BtestIndicationheard2_cb,
    BtestIndicationheard3_cb,
};
#endif //NO_CPP_PORTAL_CODE
