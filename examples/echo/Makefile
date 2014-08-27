
CPP = /scratch/android-ndk-r9d/toolchains/llvm-3.3/prebuilt/linux-x86_64/bin/clang++ 
LLC = /scratch/android-ndk-r9d/toolchains/llvm-3.3/prebuilt/linux-x86_64/bin/llc
CPPFLAGS = -I../../cpp/ -I. -std=c++11 -std=gnu++11 -fno-unwind-tables -fno-use-cxa-atexit
CPPFLAGS += -no-exceptions -fno-catch-undefined-behavior -O
LLVMFLAGS = -S -emit-llvm

all:
	$(CPP) $(CPPFLAGS) $(LLVMFLAGS) -o echo.ll echo.cpp
	$(CPP) -c $(CPPFLAGS) -o echo.o echo.cpp
	$(CPP) -c $(CPPFLAGS) -o atomicc.o ../../cpp/atomicc.cpp
	c++filt < echo.ll  \
	  | sed -e 's/{/\n{\n/g' \
            -e 's/\" \"/\"\n\"/g' \
            -e 's/}/\n}/g' \
            -e 's/\"(/\"\n        (/g' \
            >echo.tmp

backend:
	$(LLC) echo.ll

clean:
	rm -f echo.ll echo.s

exe:
	$(CPP) -DEXE -c $(CPPFLAGS) $(LLVMFLAGS) -o echo.bc echo.cpp
	$(CPP) -DEXE -c $(CPPFLAGS) $(LLVMFLAGS) -o atomicc.bc ../../cpp/atomicc.cpp
	llvm-link-3.3 echo.bc atomicc.bc >echo.exe.bc

run:
	lli-3.3 -force-interpreter=true echo.exe.bc foo
