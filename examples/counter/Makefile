

CPP = /scratch/android-ndk-r9d/toolchains/llvm-3.3/prebuilt/linux-x86_64/bin/clang++ 
LLC = /scratch/android-ndk-r9d/toolchains/llvm-3.3/prebuilt/linux-x86_64/bin/llc
CPPFLAGS = -I../../cpp/ -S -emit-llvm

all:
	$(CPP) $(CPPFLAGS) -o counter.ll counter.cpp

backend:
	$(LLC) counter.ll

