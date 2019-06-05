include ../makefile.in

CONNECTAL=$(TOPDIR)/../connectal

INCLUDES=-I .
INCLUDES+=-I generatedbsv -I $(CONNECTAL)/bsv -I $(CONNECTAL)/lib/bsv
INCLUDES+=-I $(CONNECTAL)/examples/strstr
INCLUDES+=-I $(CONNECTAL)/examples/sdcard_spi
INCLUDES+=-I $(CONNECTAL)/examples/linking

#BSVTOKAMI=JAVA_OPTS=-ea $(TOPDIR)/../bsvtokami/build/install/bsvtokami/bin/bsvtokami -I . -K generated
BSVTOKAMI=JAVA_OPTS=-ea $(TOPDIR)/../bsvtokami/build/install/bsvtokami/bin/bsvtokami $(INCLUDES) -K generated

SOURCES=\
    gcd.bsv BRAMCore.bsv BUtils.bsv BuildVector.bsv \
    ClientServer.bsv Clocks.bsv Cntrs.bsv ConfigReg.bsv \
    Connectable.bsv Counter.bsv DefaultValue.bsv \
    FIFO.bsv FIFOF.bsv FIFOLevel.bsv FShow.bsv SpecialFIFOs.bsv \
    GetPut.bsv Prelude.bsv RS232.bsv RegFile.bsv \
    Vector.bsv \
    PipelinedProc.bsv ProcDecExec.bsv ProcMemInterm.bsv ProcMemSpec.bsv

CSOURCE=\
    algo2_nandsim/Top.bsv aurora/Top.bsv bscan/Top.bsv caffe/Conv.bsv \
    echo/Echo.bsv echo2ind/Echo.bsv echohost/Echo.bsv echoinvert/Echo.bsv \
    echojson/Echo.bsv echojsonpy/Echo.bsv echomux/Echo.bsv echoproto/Echo.bsv \
    echopy/Echo.bsv echoshared/Echo.bsv echoslow/Echo.bsv echosoft/Echo.bsv \
    echotrace/Echo.bsv echowebsocket/Echo.bsv fmcomms1/Top.bsv \
    gyrospi/STest.bsv hdmidisplay/HDMI16.bsv imageon/ImageonCapture.bsv \
    leds/LedController.bsv linking/ProcessorTop.bsv memcpy/Memcpy.bsv \
    memlatency/Memlatency.bsv memread/ReadTest.bsv memread2/Memread2.bsv \
    memread_4m/ReadTest.bsv memread_simple/ReadTest.bsv memwrite/Memwrite.bsv \
    memwrite_4m/Memwrite.bsv portal-synth-boundary/Top.bsv printf/Top.bsv \
    readbw/ReadBW.bsv sdcard_spi/SPITest.bsv simple/Simple.bsv \
    simplemultibluesim/Link.bsv simplesharedhw/Simple.bsv strstr/StrstrExample.bsv \
    swmemcpy/SWmemcpy.bsv zedboard_robot/Controller.bsv zynqpcie/Top.bsv
CDIRS=$(patsubst %/, %, $(dir $(CSOURCE)))

TARGETS=$(patsubst %.bsv, generated/%.generated.IR, $(SOURCES))

$(CDIRS):
	$(BSVTOKAMI) -I $(CONNECTAL)/examples/$(dir $(filter $@/%, $(CSOURCE))) $(CONNECTAL)/examples/$(filter $@/%, $(CSOURCE))

all: outdir $(TARGETS)

call: $(CDIRS)

outdir:
	mkdir -p generated

generated/%.generated.IR: %.bsv .FORCE
	$(BSVTOKAMI) $(*).bsv

.FORCE:

