
#USE_LOCAL=1
ifeq ($(USE_LOCAL),1)
CPP = clang++
LLC = llc
else
CPP = /scratch/android-ndk-r9d/toolchains/llvm-3.3/prebuilt/linux-x86_64/bin/clang++ 
LLC = /scratch/android-ndk-r9d/toolchains/llvm-3.3/prebuilt/linux-x86_64/bin/llc
endif
CPPFLAGS = -I../../cpp/ -I. -std=c++11 -std=gnu++11 -fno-unwind-tables -fno-use-cxa-atexit
CPPFLAGS += -no-exceptions -fno-catch-undefined-behavior -O
LLVMFLAGS = -emit-llvm
# -stdlib=libc++

all:
	$(CPP) $(CPPFLAGS) $(LLVMFLAGS) -S -o counter.ll counter.cpp
	$(CPP) -c $(CPPFLAGS) -o counter.o counter.cpp
	c++filt < counter.ll  \
	  | sed -e 's/{/\n{\n/g' \
            -e 's/\" \"/\"\n\"/g' \
            -e 's/}/\n}/g' \
            -e 's/\"(/\"\n        (/g' \
            >counter.tmp

backend:
	$(LLC) counter.ll

clean:
	rm -f counter.ll counter.s counter.tmp

exe:
	$(CPP) -DEXE -c $(CPPFLAGS) $(LLVMFLAGS) -o counter.bc counter.cpp
	#LD_PRELOAD=/usr/lib/llvm-3.3/lib/LLVMgold.so:/usr/lib/llvm-3.3/lib/libLTO.so:/usr/lib/x86_64-linux-gnu/libLLVM-3.3.so.1 catchsegv $(CC) -use-gold-plugin -Wl,-plugin-opt=also-emit-llvm -o counter.exe counter.bc
	llvm-link-3.3 counter.bc >counter.exe.bc

run:
	lli-3.3 -force-interpreter=true counter.exe.bc foo
