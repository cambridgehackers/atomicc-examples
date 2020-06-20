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
int BtestIndicationack_cb (  struct PortalInternal *p, const uint32_t v, const uint8_t seqno ) {
    (static_cast<BtestIndicationWrapper *>(p->parent))->ack ( v, seqno);
    return 0;
};
int BtestIndicationheard_cb (  struct PortalInternal *p, const uint32_t v, const uint8_t writeCount, const uint8_t readCount, const uint32_t next ) {
    (static_cast<BtestIndicationWrapper *>(p->parent))->heard ( v, writeCount, readCount, next);
    return 0;
};
BtestIndicationCb BtestIndication_cbTable = {
    BtestIndicationdisconnect_cb,
    BtestIndicationack_cb,
    BtestIndicationheard_cb,
};
#endif //NO_CPP_PORTAL_CODE
