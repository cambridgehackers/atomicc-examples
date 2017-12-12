
CPP = /scratch/android-ndk-r9d/toolchains/llvm-3.3/prebuilt/linux-x86_64/bin/clang++ 
LLC = /scratch/android-ndk-r9d/toolchains/llvm-3.3/prebuilt/linux-x86_64/bin/llc
CPPFLAGS = -I../../cpp/ -I. -std=c++11 -std=gnu++11 -fno-unwind-tables
CPPFLAGS += -no-exceptions -fno-catch-undefined-behavior -O
CPPFLAGS += -fno-diagnostics-color
LLVMFLAGS = -S
# -stdlib=libc++

all:
	$(CPP) $(CPPFLAGS) $(LLVMFLAGS) -o reg_pipeline.ll reg_pipeline.cpp
	$(CPP) -c $(CPPFLAGS) -o reg_pipeline.o reg_pipeline.cpp
	sed -e 's/{/\n{\n/g' \
            -e 's/\" \"/\"\n\"/g' \
            -e 's/}/\n}/g' \
            -e 's/\"(/\"\n        (/g' \
            <reg_pipeline.ll >reg_pipeline.tmp
	c++filt < reg_pipeline.tmp > reg_pipeline.tmp2

backend:
	$(LLC) reg_pipeline.ll

clean:
	rm -f reg_pipeline.ll reg_pipeline.s
