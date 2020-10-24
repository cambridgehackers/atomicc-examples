#include "GeneratedTypes.h"

#ifndef NO_CPP_PORTAL_CODE
extern const uint32_t ifcNames_SelectOutIndicationH2S = IfcNames_SelectOutIndicationH2S;
extern const uint32_t ifcNames_SelectOutRequestS2H = IfcNames_SelectOutRequestS2H;

/************** Start of SelectOutIndicationWrapper CPP ***********/
#include "SelectOutIndication.h"
int SelectOutIndicationdisconnect_cb (struct PortalInternal *p) {
    (static_cast<SelectOutIndicationWrapper *>(p->parent))->disconnect();
    return 0;
};
int SelectOutIndicationheard_cb (  struct PortalInternal *p, const uint8_t rindex, const uint32_t v ) {
    (static_cast<SelectOutIndicationWrapper *>(p->parent))->heard ( rindex, v);
    return 0;
};
SelectOutIndicationCb SelectOutIndication_cbTable = {
    SelectOutIndicationdisconnect_cb,
    SelectOutIndicationheard_cb,
};
#endif //NO_CPP_PORTAL_CODE
