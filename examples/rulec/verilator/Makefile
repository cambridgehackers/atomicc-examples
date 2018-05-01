
export DTOP=$(PWD)
CONNECTALDIR=$(PWD)/../../../../connectal
SIMDIR=$(PWD)/../../../simulation

VERILOG_PATH=./verilog $(SIMDIR)/verilog ../
VERILATOR_ARGS= -O3 -CFLAGS "-I$(CONNECTALDIR)/cpp -I$(DTOP)/../jni -O " -LDFLAGS "-O " \
    -Wno-fatal -exe --profile-cfuncs --output-split 20000 $(VERILOG_PATH:%=-y %) \
    -DDerivedClockPeriod=4 -DMainClockPeriod=4

SIM_CXX_COMMON = $(addprefix $(CONNECTALDIR)/cpp/, sock_utils.c portalPrintf.c poller.cpp \
    transportSocket.c transportHardware.c portal.c)
SIM_OBJECTS = $(addprefix $(DTOP)/lib/, $(addsuffix .o, $(basename $(notdir $(SIM_CXX_COMMON)))))

all: prepare_dir ubuntu.exe bin/libconnectal-sim.so vlsim

define SIM_CXX_RULE
$1/$(notdir $(basename $3)).o: $3
	$(CXX) -c $2 -o $1/$(notdir $(basename $3)).o $3
endef
SIM_CXXFLAGS= -g -fPIC -I $(CONNECTALDIR)/cpp -I $(CONNECTALDIR) -I$(DTOP)/../jni -O
$(foreach src, $(SIM_CXX_COMMON), $(eval $(call SIM_CXX_RULE, $(DTOP)/lib, $(SIM_CXXFLAGS), $(src))))

run:
	./bin/ubuntu.exe

prepare_dir:
	mkdir -p bin lib obj

bin/libconnectal-sim.so: $(SIM_OBJECTS)
	$(CXX) -O -g -shared -fpic $(SIM_CXXFLAGS) -g -o bin/libconnectal-sim.so $(SIM_OBJECTS)

vlsim:  obj_dir/vlsim

obj_dir/vlsim.mk: bin/libconnectal-sim.so verilog
	rm -fr obj_dir
	verilator -o vlsim --prefix vlsim $(VERILATOR_ARGS) -cc \
	    --top-module mkVsimTop $(DTOP)/verilog/mkVsimTop.v \
	    $(SIMDIR)/cpp/verilatortop.cpp -LDFLAGS -L$(DTOP)/bin

obj_dir/vlsim: obj_dir/vlsim.mk
	+$(MAKE) USER_LDLIBS="-lconnectal-sim -lpthread" VM_PARALLEL_BUILDS=1 -C obj_dir -f vlsim.mk
	cp obj_dir/vlsim bin/vlsim

clean:
	rm -rf obj_dir/ bin/ lib/ obj/ SWSOCK[0-9] */ubuntu.exe*

CC=$(TOOLCHAIN)gcc
CXX=$(TOOLCHAIN)g++
CFLAGS_COMMON = -O -g -I$(DTOP)/../jni -I$(CONNECTALDIR) -I$(CONNECTALDIR)/cpp
CFLAGS = $(CFLAGS_COMMON)

include $(DTOP)/../rulec.generated.filelist
PORTAL_INFRA := portal.c transportHardware.c transportSocket.c portalPrintf.c poller.cpp sock_utils.c timer.c
PORTAL_SRC_FILES := $(addprefix $(CONNECTALDIR)/cpp/, $(PORTAL_INFRA)) \
      $(addprefix $(DTOP)/../, $(GENERATED_CPP))

SOURCES = $(DTOP)/testecho.cpp $(PORTAL_SRC_FILES)
LDLIBS :=    -lpthread

ubuntu.exe: $(SOURCES)
	cd jni; $(CXX) $(CFLAGS) -o ubuntu.exe $(SOURCES) $(LDLIBS)
	cp -v jni/ubuntu.exe bin

