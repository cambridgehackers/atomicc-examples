#ifndef __GENERATED_TYPES__
#define __GENERATED_TYPES__
#include "portal.h"
#ifdef __cplusplus
extern "C" {
#endif
typedef uint32_t SpecialTypeForSendingFd;
typedef enum IfcNames { IfcNames_BscanTIndicationH2S=5, IfcNames_BscanTRequestS2H=6,  } IfcNames;


enum { CHAN_NUM_BscanTIndication_heard,CHAN_NUM_BscanTIndication_heard2,CHAN_NUM_BscanTIndication_heard3};
extern const uint32_t BscanTIndication_reqinfo;

typedef struct {
    uint32_t v;
} BscanTIndication_heardData;
typedef struct {
    uint16_t a;
    uint16_t b;
} BscanTIndication_heard2Data;
typedef struct {
    uint16_t a;
    uint32_t b;
    uint32_t c;
    uint16_t d;
} BscanTIndication_heard3Data;
typedef union {
    BscanTIndication_heardData heard;
    BscanTIndication_heard2Data heard2;
    BscanTIndication_heard3Data heard3;
} BscanTIndicationData;
int BscanTIndication_handleMessage(struct PortalInternal *p, unsigned int channel, int messageFd);
typedef struct {
    PORTAL_DISCONNECT disconnect;
    int (*heard) (  struct PortalInternal *p, const uint32_t v );
    int (*heard2) (  struct PortalInternal *p, const uint16_t a, const uint16_t b );
    int (*heard3) (  struct PortalInternal *p, const uint16_t a, const uint32_t b, const uint32_t c, const uint16_t d );
} BscanTIndicationCb;

int BscanTRequest_say ( struct PortalInternal *p, const uint32_t v );
int BscanTRequest_say2 ( struct PortalInternal *p, const uint16_t a, const uint16_t b );
int BscanTRequest_setLeds ( struct PortalInternal *p, const uint8_t v );
enum { CHAN_NUM_BscanTRequest_say,CHAN_NUM_BscanTRequest_say2,CHAN_NUM_BscanTRequest_setLeds};
extern const uint32_t BscanTRequest_reqinfo;
typedef struct {
    PORTAL_DISCONNECT disconnect;
    int (*say) (  struct PortalInternal *p, const uint32_t v );
    int (*say2) (  struct PortalInternal *p, const uint16_t a, const uint16_t b );
    int (*setLeds) (  struct PortalInternal *p, const uint8_t v );
} BscanTRequestCb;
extern BscanTRequestCb BscanTRequestProxyReq;
#ifdef __cplusplus
}
#endif
#endif //__GENERATED_TYPES__
