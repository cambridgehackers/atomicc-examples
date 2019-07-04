#ifndef __GENERATED_TYPES__
#define __GENERATED_TYPES__
#include "portal.h"
#ifdef __cplusplus
extern "C" {
#endif
typedef uint32_t SpecialTypeForSendingFd;
typedef enum IfcNames { IfcNames_GrayCounterIfc_IC_width_ND_4_JC_S2H=5, IfcNames_ReturnInd_IC_width_ND_4_JC_H2S=6,  } IfcNames;


int GrayCounterIfc_IC_width_ND_4_JC__decrement ( struct PortalInternal *p );
int GrayCounterIfc_IC_width_ND_4_JC__increment ( struct PortalInternal *p );
int GrayCounterIfc_IC_width_ND_4_JC__readBin ( struct PortalInternal *p );
int GrayCounterIfc_IC_width_ND_4_JC__readGray ( struct PortalInternal *p );
int GrayCounterIfc_IC_width_ND_4_JC__writeBin ( struct PortalInternal *p, const uint8_t v );
int GrayCounterIfc_IC_width_ND_4_JC__writeGray ( struct PortalInternal *p, const uint8_t v );
enum { CHAN_NUM_GrayCounterIfc_IC_width_ND_4_JC__decrement,CHAN_NUM_GrayCounterIfc_IC_width_ND_4_JC__increment,CHAN_NUM_GrayCounterIfc_IC_width_ND_4_JC__readBin,CHAN_NUM_GrayCounterIfc_IC_width_ND_4_JC__readGray,CHAN_NUM_GrayCounterIfc_IC_width_ND_4_JC__writeBin,CHAN_NUM_GrayCounterIfc_IC_width_ND_4_JC__writeGray};
extern const uint32_t GrayCounterIfc_IC_width_ND_4_JC__reqinfo;
typedef struct {
    PORTAL_DISCONNECT disconnect;
    int (*decrement) (  struct PortalInternal *p );
    int (*increment) (  struct PortalInternal *p );
    int (*readBin) (  struct PortalInternal *p );
    int (*readGray) (  struct PortalInternal *p );
    int (*writeBin) (  struct PortalInternal *p, const uint8_t v );
    int (*writeGray) (  struct PortalInternal *p, const uint8_t v );
} GrayCounterIfc_IC_width_ND_4_JC_Cb;
extern GrayCounterIfc_IC_width_ND_4_JC_Cb GrayCounterIfc_IC_width_ND_4_JC_ProxyReq;

enum { CHAN_NUM_ReturnInd_IC_width_ND_4_JC__value};
extern const uint32_t ReturnInd_IC_width_ND_4_JC__reqinfo;

typedef struct {
    uint8_t v;
} ReturnInd_IC_width_ND_4_JC__valueData;
typedef union {
    ReturnInd_IC_width_ND_4_JC__valueData value;
} ReturnInd_IC_width_ND_4_JC_Data;
int ReturnInd_IC_width_ND_4_JC__handleMessage(struct PortalInternal *p, unsigned int channel, int messageFd);
typedef struct {
    PORTAL_DISCONNECT disconnect;
    int (*value) (  struct PortalInternal *p, const uint8_t v );
} ReturnInd_IC_width_ND_4_JC_Cb;
#ifdef __cplusplus
}
#endif
#endif //__GENERATED_TYPES__
