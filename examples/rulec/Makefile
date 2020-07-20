include ../../makefile.in

CPPFILES = testecho.cpp
#CPPFLAGS += -emit-llvm
#CPPFLAGS += -mllvm -dtrace
#CPPFLAGS += -mllvm -rgentrace

all:
	mkdir -p generated
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/rulec.ll rulec.cpp
	$(ATOMICCDIR)/atomiccLinker AxiTop generated/linker

dump:
	vivado -mode batch -source shownets.sh 
	$(ATOMICCDIR)/../verilog-rewrite/verilogRewrite zedboard/layoutnet.v

ytest:
	sby -f generated/yosys.sby

