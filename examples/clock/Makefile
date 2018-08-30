
export DTOP=$(PWD)
CONNECTALDIR=$(PWD)/../../../connectal
CONNECTALSDIR=$(DTOP)/../../connectal
SIMMAKE=$(CONNECTALDIR)/../atomicc/simulation/Makefile.verilator

include ../../makefile.in

all:
	mkdir -p generated
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/clock.ll clock.cpp

