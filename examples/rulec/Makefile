
export DTOP=$(PWD)
CONNECTALDIR=$(PWD)/../../../connectal
CONNECTALSDIR=$(DTOP)/../../connectal
SIMMAKE=$(CONNECTALDIR)/../atomicc/simulation/Makefile.verilator

include ../../makefile.in
#CPPFLAGS += -mllvm -dtrace
#CPPFLAGS += -mllvm -rgentrace

all:
	mkdir -p generated
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/vsimTop.ll vsimTop.cpp
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/rulec.ll rulec.cpp
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/zynqTop.ll zynqTop.cpp

############################# for running verilator
#
# To compile/run a test:
#
#     make          (this generates the verilog and cppgen files from the original cpp source)
#     make verilator    (this compiles the generated files, both for ubuntu.exe and vlsim)
#     make run      (this runs bin/ubuntu.exe)
#     make cleanup  (this cleans out the objects/etc that were created by 'make verilator')
#

export PROJECT_CPP = testecho.cpp

.PHONY: verilator zybo
verilator:
	#PROJECT_CPP=$(PROJECT_CPP) DTOP=$(DTOP) 
	make -f $(SIMMAKE) verilator

run:
	#PROJECT_CPP=$(PROJECT_CPP) DTOP=$(DTOP) 
	make -f $(SIMMAKE) run

zybo:
	BOARD=zybo \
	MKTOP=mkZynqTop \
	OS=android \
	XILINX=1 \
	PhysAddrWidth=32 \
	CONNECTAL_BITS_DEPENDENCES=zybo/hw/mkTop.bit \
	CONNECTAL_EXENAME=android.exe \
	VERILOG_PATH=verilog:$(VERILOG_LIB) \
	    make -f $(CONNECTALSDIR)/scripts/Makefile.connectal.build

clean:
	rm -rf *.bc *.o *.ll *.s rulec.exe.* rulec.tmp verilator zybo SWSOCK*

