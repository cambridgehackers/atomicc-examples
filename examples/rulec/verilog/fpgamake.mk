

TOPDIR := ../../..
CONNECTALDIR=$(TOPDIR)/../connectal
TCLDIR=$(CONNECTALDIR)/../fpgamake/tcl
BUILDCACHE=$(CONNECTALDIR)/../buildcache/buildcache

CACHEDIR = Cache
FLOORPLAN=
FPGAMAKE_PARTNAME=xc7z010clg400-1
FPGAMAKE_BOARDNAME=zybo
FPGAMAKE_TOPMODULE=ZynqTop
FPGAMAKE_FAMILY="Virtex7"
VERILOG_DEFINES=""
PRESERVE_CLOCK_GATES?=0
REPORT_NWORST_TIMING_PATHS?=
include $(TCLDIR)/Makefile.fpgamake.common

ZynqTop_HEADERFILES = 
ZynqTop_VFILES = $(wildcard ../generated/*.v $(TOPDIR)/lib/generated/*.v)
ZynqTop_VFILES += $(wildcard $(TOPDIR)/lib/*.sv)

ZynqTop_VHDFILES = 
ZynqTop_VHDL_LIBRARIES = 
ZynqTop_STUBS = 
ZynqTop_IP = 
ZynqTop_SUBINST = 
ZynqTop_PATH = $(TOPDIR)/lib/generated/ZynqTop.v
ZynqTop_USER_TCL_SCRIPT = $(CONNECTALDIR)/constraints/xilinx/cdc.tcl
ZynqTop_XDC = 

$(eval $(call SYNTH_RULE,ZynqTop))

TopDown_XDC = $(CONNECTALDIR)/constraints/xilinx/xc7z010clg400.xdc $(CONNECTALDIR)/constraints/xilinx/zybo.xdc
TopDown_NETLISTS = 
TopDown_RECONFIG = 
TopDown_SUBINST = 
TopDown_PRTOP = 

$(eval $(call TOP_RULE,top,ZynqTop,hw/mkTop.bit,hw))

everything: hw/mkTop.bit

