/* Copyright (c) 2014 Quanta Research Cambridge, Inc
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included
 * in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */
#include <ctype.h> // isprint, isascii
#include <stdio.h>
#include <semaphore.h>
#include <stdio.h>
#include "sock_utils.h"
#include "EchoIndication.h"
#include "EchoRequest.h"
#include "GeneratedTypes.h"
static void memdump(unsigned char *p, int len, const char *title)
{
int i;

    i = 0;
    while (len > 0) {
        if (!(i & 0xf)) {
            if (i > 0)
                printf("\n");
            printf("%s: ",title);
        }
        printf("%02x ", *p++);
        i++;
        len--;
    }
    printf("\n");
}
#include "i2chdmi.h"
#include "i2ccamera.h"
#include "edid.h"
#include "portal.h"

//static ImageonSerdesRequestProxy *serdesdevice;
//static HdmiGeneratorRequestProxy *hdmidevice;
//static ImageonCaptureRequestProxy *idevice;

static EchoRequestProxy *echoRequestProxy = 0;
static sem_t sem_heard2;
static int limitSay2 = 5;
uint32_t prevCounter, prevHdmiCounter, prevImageonCounter;

class EchoIndication : public EchoIndicationWrapper
{
public:
    virtual void heard(uint32_t v, uint32_t hdmiCounter, uint32_t imageonCounter) {
        printf("heard an echo: counter %ld hdmi %ld imageon %ld\n", (unsigned long)(v - prevCounter) * 0x10000, (unsigned long)(hdmiCounter - prevHdmiCounter) * 0x10000, (unsigned long)(imageonCounter - prevImageonCounter) * 0x10000);
        prevCounter = v;
        prevHdmiCounter = hdmiCounter;
        prevImageonCounter = imageonCounter;
    }
    EchoIndication(unsigned int id, PortalTransportFunctions *item, void *param) : EchoIndicationWrapper(id, item, param) {}
};

static void call_say(int v)
{
    printf("[%s:%d] %d\n", __FUNCTION__, __LINE__, v);
    echoRequestProxy->say(v);
    sem_wait(&sem_heard2);
}

static int trace_spi = 0;
static int nlines = 1080;
static int npixels = 1920;
static int fbsize = nlines*npixels*4;

#define DECL(A) \
    static sem_t sem_ ## A; \
    static uint32_t cv_ ## A;

DECL(iserdes_control)
DECL(spi_response)
#if 0
#define GETFN(A) \
    static uint32_t read_ ## A (void) \
    { \
        serdesdevice->get_ ## A(); \
        sem_wait(&sem_ ## A); \
        return cv_ ## A; \
    }

class ImageonSerdesIndication : public ImageonSerdesIndicationWrapper {
public:
    ImageonSerdesIndication(int id) : ImageonSerdesIndicationWrapper(id) {}
    void iserdes_control_value ( const uint32_t v ){
        cv_iserdes_control = v;
        sem_post(&sem_iserdes_control);
    }
    void iserdes_dma ( const uint32_t v ){
printf("[%s:%d] 0x%x ***************************************************************** \n", __FUNCTION__, __LINE__, v);
    }
};

class ImageonCaptureIndication : public ImageonCaptureIndicationWrapper {
public:
    ImageonCaptureIndication(int id) : ImageonCaptureIndicationWrapper(id) {}
    void spi_response(uint32_t v){
        //fprintf(stderr, "spi_response: %x\n", v);
        cv_spi_response = v;
        sem_post(&sem_spi_response);
    }
};

class HdmiGeneratorIndication: public HdmiGeneratorIndicationWrapper {
    HdmiGeneratorRequestProxy *hdmiRequest;
public:
    HdmiGeneratorIndication(int id, HdmiGeneratorRequestProxy *proxy) : HdmiGeneratorIndicationWrapper(id), hdmiRequest(proxy) {}
    virtual void vsync ( uint64_t v, uint32_t w ) {
        fprintf(stderr, "[%s:%d] v=%d w=%d\n", __FUNCTION__, __LINE__, (uint32_t) v, w);
        hdmiRequest->waitForVsync(v+1);
    }

};
#endif

static void init_local_semaphores(void)
{
    sem_init(&sem_iserdes_control, 0, 0);
    sem_init(&sem_spi_response, 0, 0);
}
//GETFN(iserdes_control)

//#define VITA_ISERDES_CONTROL_REG     0x10
   #define VITA_ISERDES_RESET_BIT       0x01
   #define VITA_ISERDES_AUTO_ALIGN_BIT  0x02
   #define VITA_ISERDES_ALIGN_START_BIT 0x04
   #define VITA_ISERDES_FIFO_ENABLE_BIT 0x08
//#define VITA_DECODER_CONTROL_REG           0x20
   #define VITA_DECODER_RESET_BIT            0x01
   #define VITA_DECODER_ENABLE_BIT           0x02

#define VITA_SPI_SEQ1_QTY  8
/* Table 6. enable clock management register upload - part 1 */
static uint16_t vita_spi_seq1[VITA_SPI_SEQ1_QTY][3] = {
   // Enable Clock Management - Part 1
   //    V1/SN/SE 10-bit mode with PLL
   {  2, 0xFFFF,      0}, // Monochrome Sensor
// {  2, 0xFFFF, 0x0001}, // Color Sensor
   { 32, 0xFFFF, 0x2004}, // Configure clock management
   { 20, 0xFFFF,      0}, // Configure clock management
   { 17, 0xFFFF, 0x2113}, // Configure PLL
   { 26, 0xFFFF, 0x2280}, // Configure PLL lock detector
   { 27, 0xFFFF, 0x3D2D}, // Configure PLL lock detector
   {  8, 0xFFFF,      0}, // Release PLL soft reset
   { 16, 0xFFFF, 0x0003}  // Enable PLL
};

#define VITA_SPI_SEQ3_QTY  3
/* Table 7. enable clock management register upload - part 2 */
static uint16_t vita_spi_seq3[VITA_SPI_SEQ3_QTY][3] = {
   // Enable Clock Management - Part 2
   //    V1/SN/SE 10-bit mode with PLL
   {  9, 0xFFFF,      0}, // Release clock generator soft reset
   { 32, 0xFFFF, 0x2006}, // Enable logic clock
   { 34, 0xFFFF, 0x0001}  // Enable logic blocks
};

#define VITA_SPI_SEQ4_QTY  17
/* Table 8. required register upload */
static uint16_t vita_spi_seq4[VITA_SPI_SEQ4_QTY][3] = {
   // Required Register Upload
   //    V1/SN/SE 10-bit mode with PLL
   { 41, 0xFFFF,      0}, // Configure image core
   {129, 0x2000,      0}, // [13] 10-bit mode
   { 65, 0xFFFF, 0x288B}, // Configure CP biasing
   { 66, 0xFFFF, 0x53C6}, // Configure AFE biasing
   { 67, 0xFFFF, 0x0344}, // Configure MUX biasing
   { 68, 0xFFFF, 0x0085}, // Configure LVDS biasing
   { 70, 0xFFFF, 0x4888}, // Configure reserved register
   { 81, 0xFFFF, 0x86A1}, // Configure reserved register
   {128, 0xFFFF, 0x460F}, // Configure  calibration
   {176, 0xFFFF, 0x00F5}, // Configure AEC
   {180, 0xFFFF, 0x00FD}, // Configure AEC
   {181, 0xFFFF, 0x0144}, // Configure AEC
   {194, 0xFFFF, 0x0404}, // Configure sequencer
   {218, 0xFFFF, 0x160B}, // Configure sequencer
   {224, 0xFFFF, 0x3E13}, // Configure sequencer
   {391, 0xFFFF, 0x1010}, // Configure sequencer
   {456, 0xFFFF, 0x0386}  // Configure sequencer
};

#define VITA_SPI_SEQ5_QTY  7
/* Table 9. soft power up register uploads for mode dependent registers */
static uint16_t vita_spi_seq5[VITA_SPI_SEQ5_QTY][3] = {
   // Soft Power-Up
   //    V1/SN/SE 10-bit mode with PLL
   { 32, 0xFFFF, 0x2007}, // Enable analog clock distribution
   { 10, 0xFFFF,      0}, // Release soft reset state
   { 64, 0xFFFF, 0x0001}, // Enable biasing block
   { 72, 0xFFFF, 0x0203}, // Enable charge pump
   { 40, 0xFFFF, 0x0003}, // Enable column multiplexer
   { 48, 0xFFFF, 0x0001}, // Enable AFE
   {112, 0xFFFF, 0x0007}  // Enable LVDS transmitters
};

//#define VITA_SPI_SEQ6_QTY  1
#define VITA_SPI_SEQ6_QTY  2
/* Table 10. enable sequencer register upload */
static uint16_t vita_spi_seq6[VITA_SPI_SEQ6_QTY][3] = {
// {192, 0x0001, 0x0001}  // [0] Enable Sequencer
#if defined(TRIGGERED_MASTER_MODE)
   {192, 0x0051, 0x0011}, // [0] Enable Sequencer
                          // [4] triggered_mode = on
                          // [6] xsm_delay_enable = off
   {193, 0xFF00,      0}  // [15:8] xsm_delay = 0x00
#elif defined(STRETCH_VITA_HTIMING)
   {192, 0x3841, 0x3841},
// {192, 0x0041, 0x0041}, // [0] Enable Sequencer
                          // [6] xsm_delay_enable = on
   {193, 0xFF00, 0x0400}  // [15:8] xsm_delay = 0x04
#else
   {192, 0x0001, 0x0001}, // [0] Enable Sequencer
                        // [6] xsm_delay_enable = off
   {193, 0xFF00,      0}  // [15:8] xsm_delay = 0x00
#endif
};

#define VITA_AUTOEXP_ON_QTY  1
static uint16_t vita_autoexp_on_seq[VITA_AUTOEXP_ON_QTY][3] = {
   // Auto-Exposure ON
   {160, 0x0001, 0x0001} // [4] Auto Exposure enable
   };

#define VITA_ROI0_CROP_1080P_QTY  2
static uint16_t vita_roi0_crop_1080p_seq[VITA_ROI0_CROP_1080P_QTY][3] = {
   // Crop ROI0 from 1920x1200 to 1920x1080
   //   R257[10:0] y_start = 60 (0x3C)
   //   R258[10:0] y_end   = 60+1080 = 1140 (0x474)
   {257, 0xFFFF, 0x003C},
   {258, 0xFFFF, 0x0474} };

#define VITA_MULT_TIMER_LINE_RESOLUTION_QTY  1
static uint16_t vita_mult_timer_line_resolution_seq[VITA_MULT_TIMER_LINE_RESOLUTION_QTY][3] = {
   // R199[15:0] mult_timer = (1920+88+44+148)/4 = 2200/4 = 550 (0x0226)
   //199, 0xFFFF, 0x0226
   // R199[15:0] mult_timer = (1920+88+44+132)/4 = 2184/4 = 546 (0x0222)
   {199, 0xFFFF, 0x0222} };
#if 0
static uint32_t spi_transfer (uint32_t v)
{
    if (trace_spi)
        printf("SPITRANSFER: %x\n", v);
    idevice->put_spi_request(v);
    sem_wait(&sem_spi_response);
    return cv_spi_response;
}
static uint32_t vita_spi_read_internal(uint32_t uAddr)
{
    return spi_transfer(uAddr<<17);
}
static int vita_spi_write(uint32_t uAddr, uint16_t uData)
{
    uint32_t prev = 0;
    if (trace_spi)
        prev = vita_spi_read_internal(uAddr);
    spi_transfer(uAddr<<17 | 1 <<16 | uData);
    if (trace_spi)
        printf("SPIWRITE: [%x] %x -> %x %x\n", uAddr, prev, uData, vita_spi_read_internal(uAddr));
    return 1;
}

static uint16_t vita_spi_read(uint32_t uAddr)
{
    uint32_t ret = vita_spi_read_internal(uAddr);
    if (trace_spi)
        printf("SPIREAD: [%x] %x\n", uAddr, ret);
    //printf("[%s:%d] return %x\n", __FUNCTION__, __LINE__, ret);
    return ret;
}

/******************************************************************************
* This function performs a sequence of SPI write transactions.
******************************************************************************/
static void vita_spi_write_sequence(uint16_t pConfig[][3], uint32_t uLength)
{
   uint16_t uData;
   int i;

   for ( i = 0; i < (int)uLength; i++) {
      if ( pConfig[i][1] != 0xFFFF) {
         uData = vita_spi_read(pConfig[i][0]) & ~pConfig[i][1];
         printf( "\t                    0x%04X\n", pConfig[i][1]);
     }
   }
   for ( i = 0; i < (int)uLength; i++) {
      if ( pConfig[i][1] == 0xFFFF)
         uData = pConfig[i][2];
      else {
         uData = vita_spi_read(pConfig[i][0]) & ~pConfig[i][1];
         uData |=  pConfig[i][2];
      }
      vita_spi_write(pConfig[i][0], uData); usleep(100);
   }
}

static void fmc_imageon_demo_enable_ipipe( void)
{
   // VITA-2000 Initialization
   printf( "FMC-IMAGEON VITA Initialization ...\n");
   uint16_t uData;
   uint32_t uStatus;
   int timeout;
   serdesdevice->set_serdes_training(0x03A6);
uint32_t uManualTap = 25;
   printf( "VITA ISERDES - Setting Manual Tap to 0x%08X\n", uManualTap);
   serdesdevice->set_serdes_manual_tap(uManualTap);

   printf("VITA SPI Sequence 0 - Assert RESET_N pin\n");
   serdesdevice->set_iserdes_control( VITA_ISERDES_RESET_BIT);
   serdesdevice->set_decoder_control( VITA_DECODER_RESET_BIT);

   usleep(10); // 10 usec
   serdesdevice->set_iserdes_control( 0);
   serdesdevice->set_decoder_control( 0);
   //jca sleep(1); // 1 sec (time to get clocks to lock)
   uData = vita_spi_read(0);
printf("[%s:%d] %x\n", __FUNCTION__, __LINE__, uData);
   switch ( uData) {
   case 0:
       printf( "\tVITA Sensor absent\n");
       break;
   case 0x560D:
       printf( "\tVITA-1300 Sensor detected\n");
       break;
   case 0x5614:
       printf( "\tVITA-2000 Sensor detected\n");
       break;
   case 0x5632:
       printf( "\tVITA-5000 Sensor detected\n");
       break;
   case 0x56FA:
       printf( "\tVITA-25K Sensor detected\n");
       break;
   default:
       printf( "\tERROR: Unknown CHIP_ID !!!\n");
       break;
   }
   if ( uData != 0x5614) {
      printf( "\tERROR: Absent or unsupported VITA sensor !!!\n");
      return;
   }
   printf("VITA SPI Sequence 1 - Enable Clock Management - Part 1\n");
   vita_spi_write_sequence(vita_spi_seq1, VITA_SPI_SEQ1_QTY);
   {
   uint16_t uLock = 0;
   printf("VITA SPI Sequence 2 - Verify PLL Lock Indicator\n");
   timeout = 10;
   while ( !(uLock) && --timeout) {
      usleep(100000);
      uLock = vita_spi_read(24);
   }
   if ( !timeout) {
       printf( "\tERROR: Timed Out while waiting for PLL lock to assert !!!\n");
      return;
   }
   }
   printf("VITA SPI Sequence 3 - Enable Clock Management - Part 2\n");
   vita_spi_write_sequence(vita_spi_seq3, VITA_SPI_SEQ3_QTY);
   printf("VITA SPI Sequence 4 - Required Register Upload\n");
   vita_spi_write_sequence(vita_spi_seq4, VITA_SPI_SEQ4_QTY);
   printf("VITA SPI Sequence 5 - Soft Power-Up\n");
   vita_spi_write_sequence(vita_spi_seq5, VITA_SPI_SEQ5_QTY);
   uStatus = read_iserdes_control();
   printf( "VITA ISERDES - Status = 0x%08X\n", uStatus);
   uStatus = read_iserdes_control();
   printf( "VITA ISERDES - Status = 0x%08X\n", uStatus);
   uStatus = read_iserdes_control();
   printf( "VITA ISERDES - Status = 0x%08X\n", uStatus);
   printf( "VITA ISERDES - Align Start\n");
   serdesdevice->set_iserdes_control( VITA_ISERDES_ALIGN_START_BIT);
   printf( "VITA ISERDES - Waiting for ALIGN_BUSY to assert\n");
   uStatus = read_iserdes_control();
   printf( "VITA ISERDES - Status = 0x%08X\n", uStatus);
   timeout = 9;
   while ( !(uStatus & 0x0200) && --timeout) {
       uStatus = read_iserdes_control();
       printf( "VITA ISERDES - Status = 0x%08X\n", uStatus);
       //usleep(1);
   }
   if ( !timeout) {
       printf( "\tTimed Out !!!\n");
       return;
   }
   serdesdevice->set_iserdes_control( 0);
   printf( "VITA ISERDES - Waiting for ALIGN_BUSY to de-assert\n");
   uStatus = read_iserdes_control();
   printf( "VITA ISERDES - Status = 0x%08X\n", uStatus);
   timeout = 9;
   while ( (uStatus & 0x0200) && --timeout) {
       uStatus = read_iserdes_control();
       printf( "VITA ISERDES - Status = 0x%08X\n", uStatus);
       usleep(1);
   }
   if ( !timeout)
       printf( "\tTimed Out !!!\n");
   uStatus = read_iserdes_control();
   printf( "VITA ISERDES - Status = 0x%08X\n", uStatus);
   vita_spi_write_sequence(vita_roi0_crop_1080p_seq, VITA_ROI0_CROP_1080P_QTY);
   vita_spi_write_sequence(vita_mult_timer_line_resolution_seq, VITA_MULT_TIMER_LINE_RESOLUTION_QTY);
   vita_spi_write_sequence(vita_autoexp_on_seq, VITA_AUTOEXP_ON_QTY);
   vita_spi_write_sequence(vita_spi_seq6, VITA_SPI_SEQ6_QTY);
   serdesdevice->set_iserdes_control( VITA_ISERDES_FIFO_ENABLE_BIT);
   serdesdevice->set_decoder_control(VITA_DECODER_ENABLE_BIT);
   //jca sleep(1);
   vita_spi_write(192, 0); usleep(100);
   vita_spi_write(193, 0x0400); usleep(100);
   vita_spi_write(192, 0x40); usleep(100);
   vita_spi_write(199, 1); usleep(100);
   vita_spi_write(200, 0); usleep(100);
   vita_spi_write(194, 0); usleep(100);
   vita_spi_write(257, 0x3C); usleep(100);
   vita_spi_write(258, 0x0474); usleep(100);
   vita_spi_write(160, 0x10); usleep(100);

   uint32_t trigDutyCycle    = 90; // exposure time is 90% of frame time (ie. 15msec)
   uint32_t vitaTrigGenDefaultFreq = (((1920+88+44+148)*(1080+4+5+36))>>2) - 2;
   idevice->set_trigger_cnt((vitaTrigGenDefaultFreq * (100-trigDutyCycle))/100 + 1);
   vita_spi_write(194, 0x0400);
   vita_spi_write(0x29, 0x0700);
   uint16_t vspi_data = vita_spi_read(192) | 0x71; usleep(100);
   vspi_data |= (4 << 11); // monitor0 Frame Start, monitor1 row-overhead-time (ROT)
   vita_spi_write(192, vspi_data); usleep(100);
   fprintf(stderr, "VITA SPI 192 %x\n", vspi_data);
   //jca usleep(10000);
}
#endif
#define DMA_BUFFER_SIZE 0x1240000

int main(int argc, const char **argv)
{
    init_local_semaphores();
    Portal *mcommon = new Portal(5, 0, sizeof(uint32_t), portal_mux_handler, NULL,
#ifdef SIMULATION
        &transportSocketInit,
#else
        &transportPortal,
#endif
        NULL, 0);
    PortalMuxParam param = {};
    param.pint = &mcommon->pint;
    EchoIndication echoIndication(IfcNames_EchoIndicationH2S, &transportMux, &param);
    echoRequestProxy = new EchoRequestProxy(IfcNames_EchoRequestS2H, &transportMux, &param);

printf("[%s:%d] START\n", __FUNCTION__, __LINE__);
    //DmaManager *dma = platformInit();
    //serdesdevice = new ImageonSerdesRequestProxy(IfcNames_ImageonSerdesRequestS2H);
    //hdmidevice = new HdmiGeneratorRequestProxy(IfcNames_HdmiGeneratorRequestS2H);
    //idevice = new ImageonCaptureRequestProxy(IfcNames_ImageonCaptureRequestS2H);
    
    //ImageonSerdesIndication imageonSerdesIndication(IfcNames_ImageonSerdesIndicationH2S);
    //ImageonCaptureIndication imageonCaptureIndication(IfcNames_ImageonCaptureIndicationH2S);
    //HdmiGeneratorIndication hdmiIndication(IfcNames_HdmiGeneratorIndicationH2S, hdmidevice);
    // read out monitor EDID from ADV7511
    struct edid edid;
//sleep(2);
    init_i2c_hdmi();
    int i2cfd = open("/dev/i2c-0", O_RDWR);
    int edidMem = i2c_read_reg(i2cfd, I2C_HDMI_ADDR, 0x43)/2;  // LSB is just 'W/nR', so elided on linux
printf("[%s:%d] EDIDMEM %x\n", __FUNCTION__, __LINE__, edidMem);
    int maxLoop = 1000;
    while (1) {
    int edidDone = i2c_read_reg(i2cfd, I2C_HDMI_ADDR, 0x96);
        if (edidDone & 4)
            break;
        if (maxLoop-- < 0) {
printf("[%s:%d] done [%d] = %x\n", __FUNCTION__, __LINE__, maxLoop, edidDone);
printf("[%s:%d] edid read failed\n", __FUNCTION__, __LINE__);
exit(-1);
        }
    }
    fprintf(stderr, "Monitor EDID:\n");
    for (int i = 0; i < 256; i++) {
      edid.raw[i] = i2c_read_reg(i2cfd, edidMem, i);
      fprintf(stderr, " %02x", edid.raw[i]);
      if ((i % 16) == 15) {
        fprintf(stderr, " ");
        for (int j = i-15; j <= i; j++) {
          unsigned char c = edid.raw[j];
          fprintf(stderr, "%c", (isprint(c) && isascii(c)) ? c : '.');
        }
        fprintf(stderr, "\n");
      }
    }
    close(i2cfd);
    parseEdid(edid);

    long actualFrequency = 0;
    int status;
#if 0
    status = setClockFrequency(0, 100000000, &actualFrequency);
    printf("[%s:%d] setClockFrequency 0 100000000 status=%d actualfreq=%ld\n", __FUNCTION__, __LINE__, status, actualFrequency);
    status = setClockFrequency(1, 160000000, &actualFrequency);
    printf("[%s:%d] setClockFrequency 1 160000000 status=%d actualfreq=%ld\n", __FUNCTION__, __LINE__, status, actualFrequency);
    status = setClockFrequency(3, 200000000, &actualFrequency);
    printf("[%s:%d] setClockFrequency 3 200000000 status=%d actualfreq=%ld\n", __FUNCTION__, __LINE__, status, actualFrequency);
#endif
    printf("[%s:%d] before set_i2c_mux_reset_n\n", __FUNCTION__, __LINE__);
    echoRequestProxy->muxreset(1);
    printf("[%s:%d] before setDeLine/Pixel\n", __FUNCTION__, __LINE__);
    for (int i = 0; i < 4; i++) {
        long pixclk = (long)edid.timing[i].pixclk * 10000;
        nlines = edid.timing[i].nlines;    // number of visible lines
        npixels = edid.timing[i].npixels;
        int vblank = edid.timing[i].blines; // number of blanking lines
        int hblank = edid.timing[i].bpixels;
        int vsyncoff = edid.timing[i].vsyncoff; // number of lines in FrontPorch (within blanking)
        int hsyncoff = edid.timing[i].hsyncoff;
        int vsyncwidth = edid.timing[i].vsyncwidth; // width of Sync (within blanking)
        int hsyncwidth = edid.timing[i].hsyncwidth;

        fprintf(stderr, "lines %d, pixels %d, vblank %d, hblank %d, vwidth %d, hwidth %d\n",
             nlines, npixels, vblank, hblank, vsyncwidth, hsyncwidth);
        fprintf(stderr, "Using pixclk %d calc_pixclk %ld npixels %d nlines %d\n",
                pixclk,
                60l * (long)(hblank + npixels) * (long)(vblank + nlines),
                npixels, nlines);
      if ((pixclk > 0) && (pixclk < 149000000)) {
        status = setClockFrequency(1, pixclk, 0);

hblank--; // needed on zc702
#if 0
        hdmidevice->setDeLine(vsyncoff,           // End of FrontPorch
                                vsyncoff+vsyncwidth,// End of Sync
                                vblank,             // Start of Visible (start of BackPorch)
                                vblank + nlines, vblank + nlines / 2); // End
        hdmidevice->setDePixel(hsyncoff,
                                hsyncoff+hsyncwidth, hblank,
                                hblank + npixels, hblank + npixels / 2);
#endif
#define MODE_1080p /* FORMAT 16 */
//#define MODE_720p /* FORMAT 4 */
#ifdef MODE_1080p /* FORMAT 16 */
#define v_total 1125L
#define vFront 4
#define vBack 36L
#define vSyncWidth 5
#define h_total 2200L
#define hFront 88L
#define hBack 148L
#define hSyncWidth 44L
#define PATTERN_RAMP_STEP 0x0222L
#endif
#ifdef MODE_720p /* FORMAT 4 */
#define v_total 750L
#define vFront 5L
#define vBack 20L
#define vSyncWidth 5
#define h_total 1650L
#define hFront 110L
#define hBack 220L
#define hSyncWidth 40L
#define PATTERN_RAMP_STEP 0x0333L // 20'hFFFFF / 1280 act_pixels per line = 20'h0333
#endif
#define PATTERN_TYPE 4    // RAMP
//#define PATTERN_TYPE 1 // BORDER.
// mini
//pixclk=7425 w=697mm h=392mm features=1e
//    npixels=1280 bpixels=370 hsyncoff=110 hsyncwidth=40 hbpxls=0
//    nlines=720 blines=30 vsyncoff=5 vsyncwidth=5 vbpxls=0
//pixclk=2700 w=697mm h=392mm features=18
//    npixels=720 bpixels=138 hsyncoff=16 hsyncwidth=62 hbpxls=0
// visio
//pixclk=14850 w=509mm h=286mm features=1e
//    npixels=1920 bpixels=280 hsyncoff=88 hsyncwidth=44 hbpxls=0
//    nlines=1080 blines=45 vsyncoff=4 vsyncwidth=5 vbpxls=0
//    nlines=480 blines=45 vsyncoff=9 vsyncwidth=6 vbpxls=0
    echoRequestProxy->setuph(h_total-1, h_total-1-hFront, hBack + hSyncWidth, hSyncWidth);
    echoRequestProxy->setupv(v_total-1, v_total-1-vFront, vBack + vSyncWidth, vSyncWidth);
    echoRequestProxy->setupTest(PATTERN_TYPE, PATTERN_RAMP_STEP);
    fbsize = nlines*npixels*4;
    //sleep(1);
    i2c_hdmi_start();
    echoRequestProxy->run();
        break;
      }
    }

    //int srcAlloc = portalAlloc(DMA_BUFFER_SIZE, 0);
    //unsigned int *srcBuffer = (unsigned int *)portalMmap(srcAlloc, DMA_BUFFER_SIZE);
    //printf("[%s:%d] before dma->reference\n", __FUNCTION__, __LINE__);
    //memset(srcBuffer, 0xff, 16);
    //portalCacheFlush(srcAlloc, srcBuffer, DMA_BUFFER_SIZE, 1);
    //unsigned int ref_srcAlloc = dma->reference(srcAlloc);
#if 0
    printf("[%s:%d] before setTestPattern\n", __FUNCTION__, __LINE__);
    hdmidevice->setTestPattern(1);

    //ret = fmc_iic_axi_init(uBaseAddr_IIC_FmcImageon);
    //fmc_iic_axi_GpoWrite(uBaseAddr_IIC_FmcImageon, fmc_iic_axi_GpoRead(uBaseAddr_IIC_FmcImageon) | 2);
    idevice->set_host_oe(1);

#endif
printf("[%s:%d] before i2c_camera\n", __FUNCTION__, __LINE__);
    init_i2c_camera();
    //init_vclk();
printf("[%s:%d] now displaying test pattern\n", __FUNCTION__, __LINE__);
sleep(1);
#if 0
    hdmidevice->setTestPattern(0);

    // Reset DCMs
    /* puts the DCM_0 PCORE into reset */
    //fmc_iic_axi_GpoWrite(uBaseAddr_IIC_FmcImageon, fmc_iic_axi_GpoRead(uBaseAddr_IIC_FmcImageon) | 4);
    //jca usleep(200000);
    /* releases the DCM_0 PCORE from reset */
    //fmc_iic_axi_GpoWrite(uBaseAddr_IIC_FmcImageon, fmc_iic_axi_GpoRead(uBaseAddr_IIC_FmcImageon) & ~4);

    //jca usleep(500000);
    // FMC-IMAGEON VITA Receiver Initialization
    printf( "FMC-IMAGEON VITA Receiver Initialization ...\n");
    idevice->startWrite(ref_srcAlloc, DMA_BUFFER_SIZE);
    fmc_imageon_demo_enable_ipipe();
    printf("[%s:%d] passed fmc_imageon_demo_init\n", __FUNCTION__, __LINE__);
    //usleep(200000);
    hdmidevice->waitForVsync(0);
    //jca usleep(2000000);
    printf("[%s:%d] before startWrite\n", __FUNCTION__, __LINE__);
    //idevice->startWrite(ref_srcAlloc, DMA_BUFFER_SIZE);
    int counter = 0;
    while (1/*getchar() != EOF*/) {
        printf("[%s:%d] iserdes %x\n", __FUNCTION__, __LINE__, read_iserdes_control());
        static int regids[] = {24, 97, 186, 0};
        int i;
        for (i = 0; regids[i]; i++)
            printf("[%s:%d] spi %d. %x\n", __FUNCTION__, __LINE__, regids[i], vita_spi_read(regids[i]));
        printf("counter %d\n", counter);
        if (counter == 1 && argc > 1) {
            portalCacheFlush(srcAlloc, srcBuffer, DMA_BUFFER_SIZE, 1);
            int fd = creat("tmp.outfile", 0666);
            int cnt = write(fd, srcBuffer, DMA_BUFFER_SIZE);
            printf("[%s:%d] length written %d.\n", __FUNCTION__, __LINE__, cnt);
            close(fd);
        }
        counter++;
        memdump((unsigned char *)srcBuffer, 32, "MEM");
	usleep(1000000);
    }
#endif
for (int i = 0; i < 20; i++) {
printf("[%s:%d] say %d: ", __FUNCTION__, __LINE__, i);
    echoRequestProxy->say(i);
printf("[%s:%d]sleep\n", __FUNCTION__, __LINE__);
    sleep(10);
}
    return 0;
}
