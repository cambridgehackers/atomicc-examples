#include "GeneratedTypes.h"

#ifndef NO_CPP_PORTAL_CODE
extern const uint32_t ifcNames_EchoIndicationH2S = IfcNames_EchoIndicationH2S;
extern const uint32_t ifcNames_EchoRequestS2H = IfcNames_EchoRequestS2H;

/************** Start of EchoIndicationWrapper CPP ***********/
#include "EchoIndication.h"
int EchoIndicationdisconnect_cb (struct PortalInternal *p) {
    (static_cast<EchoIndicationWrapper *>(p->parent))->disconnect();
    return 0;
};
int EchoIndicationheard_cb (  struct PortalInternal *p, const uint32_t v ) {
    (static_cast<EchoIndicationWrapper *>(p->parent))->heard ( v);
    return 0;
};
int EchoIndicationheards_cb (  struct PortalInternal *p, const uint16_t ahEnd, const uint16_t ahFrontEnd, const uint8_t ahBackSync, const uint8_t ahSyncWidth, const uint16_t avEnd, const uint16_t avFrontEnd, const uint8_t avBackSync, const uint8_t avSyncWidth ) {
    (static_cast<EchoIndicationWrapper *>(p->parent))->heards ( ahEnd, ahFrontEnd, ahBackSync, ahSyncWidth, avEnd, avFrontEnd, avBackSync, avSyncWidth);
    return 0;
};
EchoIndicationCb EchoIndication_cbTable = {
    EchoIndicationdisconnect_cb,
    EchoIndicationheard_cb,
    EchoIndicationheards_cb,
};
#endif //NO_CPP_PORTAL_CODE
