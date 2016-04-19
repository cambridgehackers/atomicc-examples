
CPP = /scratch/android-ndk-r9d/toolchains/llvm-3.3/prebuilt/linux-x86_64/bin/clang++ 
LLC = /scratch/android-ndk-r9d/toolchains/llvm-3.3/prebuilt/linux-x86_64/bin/llc
CPPFLAGS = -I../../cpp/ -I. -std=c++11 -std=gnu++11 -fno-unwind-tables -fno-use-cxa-atexit
#CPPFLAGS += -no-exceptions -fno-catch-undefined-behavior -O
LLVMFLAGS = -S -emit-llvm

all:
	$(CPP) $(CPPFLAGS) $(LLVMFLAGS) -o echoN.ll echoN.cpp
	$(CPP) $(CPPFLAGS) $(LLVMFLAGS) -o atomicc.ll ../../cpp/atomicc.cpp
	c++filt < echoN.ll  \
	  | sed -e 's/{/\n{\n/g' \
            -e 's/\" \"/\"\n\"/g' \
            -e 's/}/\n}/g' \
            -e 's/\"(/\"\n        (/g' \
            >echoN.tmp

backend:
	$(LLC) echoN.ll

clean:
	rm -f *.bc *.o *.ll *.s echoN.exe.* echoN.tmp

run:
	$(CPP) -c $(CPPFLAGS) $(LLVMFLAGS) -o echoN.bc echoN.cpp
	$(CPP) -c $(CPPFLAGS) $(LLVMFLAGS) -o atomicc.bc ../../cpp/atomicc.cpp
	llvm-link-3.3 -v echoN.bc atomicc.bc >echoN.exe.bc
#	../../../llvm/build/Debug+Asserts/bin/lli -force-interpreter=true echoN.exe.bc foo
	lli-3.3 -force-interpreter=true echoN.exe.bc foo
