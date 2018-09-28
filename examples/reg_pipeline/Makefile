
include ../../makefile.in

all:
	mkdir -p generated
	$(CPP) $(CPPFLAGS) $(LLVMFLAGS) -o generated/reg_pipeline.ll reg_pipeline.cpp
	$(CPP) -c $(CPPFLAGS) -o generated/reg_pipeline.o reg_pipeline.cpp
