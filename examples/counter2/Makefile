

#CPP = clang++ 
#LLC = llc
CPP = /scratch/android-ndk-r9d/toolchains/llvm-3.3/prebuilt/linux-x86_64/bin/clang++ 
LLC = /scratch/android-ndk-r9d/toolchains/llvm-3.3/prebuilt/linux-x86_64/bin/llc
CPPFLAGS = -I../../cpp/ -I. -S -emit-llvm -std=c++11 -std=gnu++11
# -stdlib=libc++

all:
	$(CPP) $(CPPFLAGS) -o counter.ll counter.cpp

backend:
	$(LLC) counter.ll

clean:
	rm -f counter.ll counter.s
