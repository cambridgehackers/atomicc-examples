
include ../../makefile.in
#CPPFLAGS += -emit-llvm
#CPPFLAGS += -mllvm -dtrace
#CPPFLAGS += -mllvm -rgentrace
#CPPFLAGS += -fdump-record-layouts
#DEBUGCPP = -\#\#\#
#DEBUGCPP = -v

# b clang++`main
#run -cc1  -I/export/jca/git/atomicc-examples//lib/ -I/export/jca/git/atomicc-examples//xilinx -I. -std=c++11  -fno-use-cxa-atexit  -fblocks  -disable-lifetime-markers -I/usr/include/c++/4.2.1 -I/usr/include/c++/5 -I/usr/include/c++/5 -I/usr/include/x86_64-linux-gnu/c++/5 -I/usr/include/x86_64-linux-gnu/ -mllvm -pausemain -S -I/usr/include -I/usr/include/c++/4.2.1/tr1 -o generated/SCounter.ll SCounter.cpp

all:
	mkdir -p generated
	$(CPP) $(DEBUGCPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/SCounter.ll SCounter.cpp
