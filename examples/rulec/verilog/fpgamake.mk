

CONNECTALDIR=../../../../connectal
TCLDIR=$(CONNECTALDIR)/../fpgamake/tcl
BUILDCACHE=$(CONNECTALDIR)/../buildcache/buildcache

CACHEDIR = Cache
FLOORPLAN=
FPGAMAKE_PARTNAME=xc7z010clg400-1
FPGAMAKE_BOARDNAME=zybo
FPGAMAKE_TOPMODULE=ZynqTopNew
FPGAMAKE_FAMILY="Virtex7"
VERILOG_DEFINES=""
PRESERVE_CLOCK_GATES?=0
REPORT_NWORST_TIMING_PATHS?=
include $(TCLDIR)/Makefile.fpgamake.common

ZynqTopNew_HEADERFILES = 
ZynqTopNew_VFILES = $(wildcard ../generated/*.v ../../../lib/generated/*.v)

ZynqTopNew_VHDFILES = 
ZynqTopNew_VHDL_LIBRARIES = 
ZynqTopNew_STUBS = 
ZynqTopNew_IP = 
ZynqTopNew_SUBINST = 
ZynqTopNew_PATH = ../generated/ZynqTopNew.v
ZynqTopNew_USER_TCL_SCRIPT = $(CONNECTALDIR)/constraints/xilinx/cdc.tcl
ZynqTopNew_XDC = 

$(eval $(call SYNTH_RULE,ZynqTopNew))

TopDown_XDC = $(CONNECTALDIR)/constraints/xilinx/xc7z010clg400.xdc $(CONNECTALDIR)/constraints/xilinx/zybo.xdc
TopDown_NETLISTS = 
TopDown_RECONFIG = 
TopDown_SUBINST = 
TopDown_PRTOP = 

$(eval $(call TOP_RULE,top,ZynqTopNew,hw/mkTop.bit,hw))

everything: hw/mkTop.bit

