
CLANGBASE = ../../../llvm/build/bin/
CPP = $(CLANGBASE)clang++ 
LLC = $(CLANGBASE)llc
LINK = $(CLANGBASE)llvm-link
CPPFLAGS = -fblocks -I../../cpp/ -I. -std=c++11 -fno-unwind-tables -fno-use-cxa-atexit -fno-cxx-exceptions
CPPFLAGS += -I/usr/include/c++/4.2.1
CPPFLAGS += -I/usr/include/c++/5 -I/usr/include/x86_64-linux-gnu/c++/5
CPPFLAGS += -fno-diagnostics-color
CPPFLAGS += -Xclang -disable-lifetime-markers
#CPPFLAGS += -emit-llvm

all:
	mkdir -p generated
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/rulec.ll rulec.cpp

cleanmake:
	rm -f *.bc *.o *.ll *.s rulec.exe.* rulec.tmp

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

include $(SIMDIR)/Makefile.verilator
