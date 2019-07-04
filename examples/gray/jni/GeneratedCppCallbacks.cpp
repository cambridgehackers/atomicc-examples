#include "GeneratedTypes.h"

#ifndef NO_CPP_PORTAL_CODE
extern const uint32_t ifcNames_GrayCounterIfc_IC_width_ND_4_JC_S2H = IfcNames_GrayCounterIfc_IC_width_ND_4_JC_S2H;
extern const uint32_t ifcNames_ReturnInd_IC_width_ND_4_JC_H2S = IfcNames_ReturnInd_IC_width_ND_4_JC_H2S;

/************** Start of ReturnInd_IC_width_ND_4_JC_Wrapper CPP ***********/
#include "ReturnInd_IC_width_ND_4_JC_.h"
int ReturnInd_IC_width_ND_4_JC_disconnect_cb (struct PortalInternal *p) {
    (static_cast<ReturnInd_IC_width_ND_4_JC_Wrapper *>(p->parent))->disconnect();
    return 0;
};
int ReturnInd_IC_width_ND_4_JC_value_cb (  struct PortalInternal *p, const uint8_t v ) {
    (static_cast<ReturnInd_IC_width_ND_4_JC_Wrapper *>(p->parent))->value ( v);
    return 0;
};
ReturnInd_IC_width_ND_4_JC_Cb ReturnInd_IC_width_ND_4_JC__cbTable = {
    ReturnInd_IC_width_ND_4_JC_disconnect_cb,
    ReturnInd_IC_width_ND_4_JC_value_cb,
};
#endif //NO_CPP_PORTAL_CODE
