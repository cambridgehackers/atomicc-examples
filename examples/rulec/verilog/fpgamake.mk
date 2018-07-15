

BSVLIB=/scratch/bluespec/Bluespec-2015.09.beta2/lib/Verilog
CONNECTALDIR=../../../../connectal
TCLDIR=$(CONNECTALDIR)/../fpgamake/tcl
BUILDCACHE=$(CONNECTALDIR)/../buildcache/buildcache

CACHEDIR = Cache
FLOORPLAN=
FPGAMAKE_PARTNAME=xc7z010clg400-1
FPGAMAKE_BOARDNAME=zybo
FPGAMAKE_TOPMODULE=mkZynqTop
FPGAMAKE_FAMILY="Virtex7"
VERILOG_DEFINES=""
PRESERVE_CLOCK_GATES?=0
REPORT_NWORST_TIMING_PATHS?=
include $(TCLDIR)/Makefile.fpgamake.common

mkZynqTop_HEADERFILES = 
mkZynqTop_VFILES = ../verilog/mkZynqTop.v ../generated/l_top.v \
    ../generated/AdapterFromBus.v ../generated/AdapterToBus.v \
    ../generated/ZynqTop.v \
    ../generated/ClockTop.v \
    ../generated/EchoIndication___M2P.v ../generated/EchoRequest___P2M.v \
    ../generated/Echo.v \
    ../generated/Fifo1.v \
    ../generated/MuxPipe.v \
    ../generated/indConnect.v ../generated/reqConnect.v \
    ../generated/UserTop.v \
    ../generated/ResetInverter.v $(BSVLIB)/FIFO2.v $(BSVLIB)/FIFO1.v

mkZynqTop_VHDFILES = 
mkZynqTop_VHDL_LIBRARIES = 
mkZynqTop_STUBS = 
mkZynqTop_IP = 
mkZynqTop_SUBINST = 
mkZynqTop_PATH = ../verilog/mkZynqTop.v
mkZynqTop_USER_TCL_SCRIPT = $(CONNECTALDIR)/constraints/xilinx/cdc.tcl
mkZynqTop_XDC = 

$(eval $(call SYNTH_RULE,mkZynqTop))

TopDown_XDC = $(CONNECTALDIR)/constraints/xilinx/xc7z010clg400.xdc $(CONNECTALDIR)/constraints/xilinx/zybo.xdc
TopDown_NETLISTS = 
TopDown_RECONFIG = 
TopDown_SUBINST = 
TopDown_PRTOP = 

$(eval $(call TOP_RULE,top,mkZynqTop,hw/mkTop.bit,hw))

everything: hw/mkTop.bit

