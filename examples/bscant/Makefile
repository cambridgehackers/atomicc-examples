#export FILEGENFLAGS = --implconstraint $(PWD)/../../xilinx/clockBscan.xdc
include ../../makefile.in

CPPFILES = testbscan.cpp
#CPPFLAGS += -emit-llvm
#CPPFLAGS += -mllvm -dtrace
#CPPFLAGS += -mllvm -rgentrace

all:
	mkdir -p generated
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/bscant.ll bscant.cpp

