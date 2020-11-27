export FILEGENFLAGS = --implconstraint imageon-clocks.xdc
#export VERILOG_PATH := ./verilog;$(VERILOG_PATH)
FILEGENFLAGS += -DVERILATOR_PROJECT_ARGS="--trace"
FILEGENFLAGS += -V $(PWD)/verilog
FILEGENFLAGS += --pinout imageon-fmc.json
FILEGENFLAGS += --pinout imageon-zedboard.json
FILEGENFLAGS += --pin-binding fmc:fmc1
FILEGENFLAGS += -D USE_I2C1 -D USE_I2C0
FILEGENFLAGS += -C imageon-clocks.xdc
#FILEGENFLAGS += --tcl clock.tcl
FILEGENFLAGS += --ipdir=$(TOPDIR)/out
include ../../makefile.in

CPPFILES = testimagecapture.cpp
#CPPFLAGS += -emit-llvm
#CPPFLAGS += -mllvm -dtrace
#CPPFLAGS += -mllvm -rgentrace

all:
	mkdir -p generated
	#$(ATOMICCDIR)/atomiccImport -o generated/top_sync.h -P " " -C top_sync_vg_pattern verilog/top_sync_vg_pattern.v 
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/hdmi.ll hdmi.cpp
	#$(ATOMICCDIR)/atomiccLinker ZynqTop generated/linker
