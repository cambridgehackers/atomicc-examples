
include ../../makefile.in
#CPPFLAGS += -emit-llvm
#CPPFLAGS += -mllvm -dtrace
#CPPFLAGS += -mllvm -rgentrace
#CPPFLAGS += -fdump-record-layouts
#DEBUGCPP = -\#\#\#
#DEBUGCPP = -v

all:
	mkdir -p generated
	$(CPP) $(DEBUGCPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/scounter.ll scounter.cpp
