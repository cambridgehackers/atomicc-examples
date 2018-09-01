
TOPDIR ?= ..
include ../makefile.in
#CPPFLAGS += -mllvm -dtrace
#CPPFLAGS += -mllvm -rgentrace

all:
	mkdir -p generated
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/fifo.ll fifo.cpp
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/mux.ll mux.cpp
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/adapter.ll adapter.cpp
