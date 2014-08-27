
CPP = /scratch/android-ndk-r9d/toolchains/llvm-3.3/prebuilt/linux-x86_64/bin/clang++ 
LLC = /scratch/android-ndk-r9d/toolchains/llvm-3.3/prebuilt/linux-x86_64/bin/llc
CPPFLAGS = -I../../cpp/ -I. -std=c++11 -std=gnu++11 -fno-unwind-tables
CPPFLAGS += -no-exceptions -fno-catch-undefined-behavior -O
LLVMFLAGS = -S -emit-llvm
# -stdlib=libc++

all:
	$(CPP) $(CPPFLAGS) $(LLVMFLAGS) -o echo.ll echo.cpp
	$(CPP) -c $(CPPFLAGS) -o echo.o echo.cpp
	$(CPP) -c $(CPPFLAGS) -o atomicc.o ../../cpp/atomicc.cpp
	sed -e 's/{/\n{\n/g' \
            -e 's/\" \"/\"\n\"/g' \
            -e 's/}/\n}/g' \
            -e 's/\"(/\"\n        (/g' \
            <echo.ll >echo.tmp
	c++filt < echo.tmp > echo.tmp2

backend:
	$(LLC) echo.ll

clean:
	rm -f echo.ll echo.s
