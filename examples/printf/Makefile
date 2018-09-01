
include ../../makefile.in
#CPPFLAGS += -emit-llvm
#CPPFLAGS += -fdump-record-layouts
#CPPFLAGS += -mllvm -dtrace
#CPPFLAGS += -mllvm -rgentrace

all:
	mkdir -p generated
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
