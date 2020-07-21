include ../../makefile.in

#CPPFILES = testcounter.cpp
#CPPFLAGS += -emit-llvm
#CPPFLAGS += -mllvm -dtrace
#CPPFLAGS += -mllvm -rgentrace
#CPPFLAGS += -mllvm -mgentrace

all:
	mkdir -p generated
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/counter.ll counter.cpp
	$(ATOMICCDIR)/atomiccLinker Counter generated/linker
