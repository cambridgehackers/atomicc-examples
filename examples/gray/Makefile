include ../../makefile.in

export PROJECT_CPP = testgray.cpp
#CPPFLAGS += -emit-llvm
#CPPFLAGS += -mllvm -dtrace
#CPPFLAGS += -mllvm -rgentrace
# to trace:
#       DUMP_VCD=dump.vcd make run

all:
	mkdir -p generated
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/gray.ll gray.cpp

trace:
	make clean
	VERILATOR_TRACE=--trace make verilator
	rm -f dump.vcd
	DUMP_VCD=dump.vcd make run
