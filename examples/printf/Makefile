
CLANGBASE = ../../../llvm/build/bin/
CPP = $(CLANGBASE)clang++ 
LLC = $(CLANGBASE)llc
LINK = $(CLANGBASE)llvm-link
CPPFLAGS = -fblocks -I../../cpp/ -I. -std=c++11 -fno-unwind-tables -fno-use-cxa-atexit -fno-cxx-exceptions
CPPFLAGS += -fno-diagnostics-color
CPPFLAGS += -Xclang -disable-lifetime-markers
#CPPFLAGS += -emit-llvm
include ../makefile.in

all:
	mkdir -p generated
	[ -h generated/l_top.v ] || ln -s printf.generated.v generated/l_top.v
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/printf.ll printf.cpp

############################# for running verilator
#
# To compile/run a test:
#
#     make          (this generates the verilog and cppgen files from the original cpp source)
#     make build    (this compiles the generated files, both for ubuntu.exe and vlsim)
#     make run      (this runs bin/ubuntu.exe)
#     make cleanup  (this cleans out the objects/etc that were created by 'make build')
#
DTOP=$(PWD)
CONNECTALDIR=$(PWD)/../../../connectal
SIMDIR=$(PWD)/../../../atomicc/simulation

PROJECT_CPP = testecho.cpp

-include $(DTOP)/generated/printf.generated.filelist
include $(SIMDIR)/Makefile.verilator
