
include ../../makefile.in
#CPPFLAGS += -emit-llvm
#CPPFLAGS += -mllvm -dtrace
#CPPFLAGS += -mllvm -rgentrace
#CPPFLAGS += -fdump-record-layouts

KAMIGEN=../../../atomicc/kamigen

all:
	mkdir -p generated
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/MultiCycleProc.ll MultiCycleProc.cpp
	mkdir -p kami
	$(KAMIGEN) generated/MultiCycleProc
	# coq requires the kami files to end in .v
	mv -fv generated/MultiCycleProc.generated.kami kami/MultiCycleProc.v
