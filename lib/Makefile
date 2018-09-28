
include ../makefile.in
#CPPFLAGS += -emit-llvm
#CPPFLAGS += -mllvm -dtrace
#CPPFLAGS += -mllvm -rgentrace

all:
	mkdir -p generated
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/iobufVec.ll iobufVec.cpp
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/fifo.ll fifo.cpp
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/mux.ll mux.cpp
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/adapter.ll adapter.cpp
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/vsimTop.ll vsimTop.cpp
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/zynqTop.ll zynqTop.cpp
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/connectNet2.ll connectNet2.cpp
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/userTop.ll userTop.cpp
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/resetInverter.ll resetInverter.cpp
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/testTop.ll testTop.cpp
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/clockTop.ll clockTop.cpp
