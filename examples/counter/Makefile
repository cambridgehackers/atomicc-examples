
CLANGBASE = ../../../llvm/build/bin/
CPP = $(CLANGBASE)clang++ 
LLC = $(CLANGBASE)llc
LINK = $(CLANGBASE)llvm-link
CPPFLAGS = -I../../cpp/ -I. -std=c++11 -std=gnu++11 -fno-unwind-tables -fno-use-cxa-atexit
CPPFLAGS += -no-exceptions -fno-catch-undefined-behavior -O
CPPFLAGS += -I/usr/include/c++/4.2.1
CPPFLAGS += -fno-diagnostics-color
CPPFLAGS += -Xclang -disable-lifetime-markers
#CPPFLAGS += -emit-llvm
LLVMFLAGS = -emit-llvm

all:
	$(CPP) -c $(CPPFLAGS) $(LLVMFLAGS) -S -o counter.ll counter.cpp
	$(CPP) -c $(CPPFLAGS) $(LLVMFLAGS) -S -o atomicc.ll ../../cpp/atomicc.cpp
	$(CPP) -c $(CPPFLAGS) -o counter.o counter.cpp
	$(CPP) -c $(CPPFLAGS) -o atomicc.o ../../cpp/atomicc.cpp
	c++filt < counter.ll  \
	  | sed -e 's/{/\n{\n/g' \
            -e 's/\" \"/\"\n\"/g' \
            -e 's/}/\n}/g' \
            -e 's/\"(/\"\n        (/g' \
            >counter.tmp

clean:
	rm -f counter.ll counter.s counter.tmp

exe:
	$(CPP) -DEXE -c $(CPPFLAGS) $(LLVMFLAGS) -o counter.bc counter.cpp
	$(CPP) -DEXE -c $(CPPFLAGS) $(LLVMFLAGS) -o atomicc.bc ../../cpp/atomicc.cpp
	#LD_PRELOAD=/usr/lib/llvm-3.3/lib/LLVMgold.so:/usr/lib/llvm-3.3/lib/libLTO.so:/usr/lib/x86_64-linux-gnu/libLLVM-3.3.so.1 catchsegv $(CC) -use-gold-plugin -Wl,-plugin-opt=also-emit-llvm -o counter.exe counter.bc
	llvm-link-3.3 counter.bc atomicc.bc >counter.exe.bc

run:
	lli-3.3 -force-interpreter=true counter.exe.bc foo
