
include ../../makefile.in
#CPPFLAGS += -emit-llvm
#CPPFLAGS += -mllvm -dtrace
#CPPFLAGS += -mllvm -rgentrace
#CPPFLAGS += -fdump-record-layouts

all:
	mkdir -p generated
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/echo.ll echo.cpp
