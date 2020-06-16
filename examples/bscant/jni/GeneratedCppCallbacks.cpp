#include "GeneratedTypes.h"

#ifndef NO_CPP_PORTAL_CODE
extern const uint32_t ifcNames_BscanTIndicationH2S = IfcNames_BscanTIndicationH2S;
extern const uint32_t ifcNames_BscanTRequestS2H = IfcNames_BscanTRequestS2H;

/************** Start of BscanTIndicationWrapper CPP ***********/
#include "BscanTIndication.h"
int BscanTIndicationdisconnect_cb (struct PortalInternal *p) {
    (static_cast<BscanTIndicationWrapper *>(p->parent))->disconnect();
    return 0;
};
int BscanTIndicationheard_cb (  struct PortalInternal *p, const uint32_t v ) {
    (static_cast<BscanTIndicationWrapper *>(p->parent))->heard ( v);
    return 0;
};
int BscanTIndicationheard2_cb (  struct PortalInternal *p, const uint16_t a, const uint16_t b ) {
    (static_cast<BscanTIndicationWrapper *>(p->parent))->heard2 ( a, b);
    return 0;
};
int BscanTIndicationheard3_cb (  struct PortalInternal *p, const uint16_t a, const uint32_t b, const uint32_t c, const uint16_t d ) {
    (static_cast<BscanTIndicationWrapper *>(p->parent))->heard3 ( a, b, c, d);
    return 0;
};
BscanTIndicationCb BscanTIndication_cbTable = {
    BscanTIndicationdisconnect_cb,
    BscanTIndicationheard_cb,
    BscanTIndicationheard2_cb,
    BscanTIndicationheard3_cb,
};
#endif //NO_CPP_PORTAL_CODE
