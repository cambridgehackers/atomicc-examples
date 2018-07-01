
CLANGBASE = ../../../llvm/build/bin/
CPP = $(CLANGBASE)clang++ 
LLC = $(CLANGBASE)llc
LINK = $(CLANGBASE)llvm-link
CPPFLAGS = -I../../cpp/ -I. -std=c++11 -std=gnu++11 -fno-unwind-tables -fno-use-cxa-atexit
CPPFLAGS += -no-exceptions -fno-catch-undefined-behavior -O
CPPFLAGS += -fno-diagnostics-color
CPPFLAGS += -Xclang -disable-lifetime-markers
#CPPFLAGS += -emit-llvm
LLVMFLAGS = -emit-llvm
include ../makefile.in

all:
	mkdir -p generated
	$(CPP) -c $(CPPFLAGS) $(LLVMFLAGS) -S -o generated/counter.ll counter.cpp
	$(CPP) -c $(CPPFLAGS) $(LLVMFLAGS) -S -o generated/atomicc.ll ../../cpp/atomicc.cpp
	$(CPP) -c $(CPPFLAGS) -o generated/counter.o counter.cpp
	$(CPP) -c $(CPPFLAGS) -o generated/atomicc.o ../../cpp/atomicc.cpp
	c++filt < counter.ll  \
	  | sed -e 's/{/\n{\n/g' \
            -e 's/\" \"/\"\n\"/g' \
            -e 's/}/\n}/g' \
            -e 's/\"(/\"\n        (/g' \
            >counter.tmp

clean:
	rm -f counter.ll counter.s counter.tmp

exe:
	$(CPP) -DEXE -c $(CPPFLAGS) $(LLVMFLAGS) -o generated/counter.bc counter.cpp
	$(CPP) -DEXE -c $(CPPFLAGS) $(LLVMFLAGS) -o generated/atomicc.bc ../../cpp/atomicc.cpp
	#LD_PRELOAD=/usr/lib/llvm-3.3/lib/LLVMgold.so:/usr/lib/llvm-3.3/lib/libLTO.so:/usr/lib/x86_64-linux-gnu/libLLVM-3.3.so.1 catchsegv $(CC) -use-gold-plugin -Wl,-plugin-opt=also-emit-llvm -o counter.exe counter.bc
	llvm-link-3.3 counter.bc atomicc.bc >counter.exe.bc

run:
	lli-3.3 -force-interpreter=true counter.exe.bc foo
