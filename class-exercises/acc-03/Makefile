include ../../makefile.in

#CPPFLAGS += -emit-llvm
#CPPFLAGS += -mllvm -dtrace
#CPPFLAGS += -mllvm -rgentrace
#CPPFLAGS += -mllvm -mgentrace

all:
	mkdir -p generated
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/busyctr.ll busyctr.cpp
	$(ATOMICCDIR)/atomiccLinker BusyCtr generated/linker
