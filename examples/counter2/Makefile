

#CPP = clang++ 
#LLC = llc
CPP = /scratch/android-ndk-r9d/toolchains/llvm-3.3/prebuilt/linux-x86_64/bin/clang++ 
LLC = /scratch/android-ndk-r9d/toolchains/llvm-3.3/prebuilt/linux-x86_64/bin/llc
CPPFLAGS = -I../../cpp/ -I. -std=c++11 -std=gnu++11 -fno-unwind-tables
CPPFLAGS += -no-exceptions -fno-catch-undefined-behavior
LLVMFLAGS = -S -emit-llvm
# -stdlib=libc++

all:
	$(CPP) $(CPPFLAGS) $(LLVMFLAGS) -o counter.ll counter.cpp
	$(CPP) -c $(CPPFLAGS) -o counter.o counter.cpp
	sed -e 's/{/\n{\n/g' \
            -e 's/\" \"/\"\n\"/g' \
            -e 's/}/\n}/g' \
            -e 's/\"(/\"\n        (/g' \
            <counter.ll >counter.tmp

backend:
	$(LLC) counter.ll

clean:
	rm -f counter.ll counter.s
