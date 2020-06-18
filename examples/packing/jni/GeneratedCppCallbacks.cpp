#include "GeneratedTypes.h"

#ifndef NO_CPP_PORTAL_CODE
extern const uint32_t ifcNames_PackIndicationH2S = IfcNames_PackIndicationH2S;
extern const uint32_t ifcNames_PackRequestS2H = IfcNames_PackRequestS2H;

/************** Start of PackIndicationWrapper CPP ***********/
#include "PackIndication.h"
int PackIndicationdisconnect_cb (struct PortalInternal *p) {
    (static_cast<PackIndicationWrapper *>(p->parent))->disconnect();
    return 0;
};
int PackIndicationheard_cb (  struct PortalInternal *p, const uint32_t v, const uint8_t writeCount, const uint8_t readCount, const uint8_t seqno ) {
    (static_cast<PackIndicationWrapper *>(p->parent))->heard ( v, writeCount, readCount, seqno);
    return 0;
};
PackIndicationCb PackIndication_cbTable = {
    PackIndicationdisconnect_cb,
    PackIndicationheard_cb,
};
#endif //NO_CPP_PORTAL_CODE
