export DTOP=$(PWD)
CONNECTALDIR=$(PWD)/..

VERILATOR_ARGS?= -O3 -CFLAGS "-I$(CONNECTALDIR)/cpp -I$(DTOP)/jni -O " -LDFLAGS "-O " --profile-cfuncs --output-split 20000

export VERILOG_PATH=./verilog ../verilog ../bsvverilog

export SIM_CFLAGS= $(CFLAGS_PROJECT) -fPIC -Ijni -I $(CONNECTALDIR)/cpp -I $(CONNECTALDIR) -O 
export SIM_CXXFLAGS= $(CXXFLAGS_PROJECT) -fPIC -Ijni -I $(CONNECTALDIR)/cpp -I $(CONNECTALDIR) -O

SIM_CXX_COMMON = $(addprefix $(CONNECTALDIR)/cpp/, sock_utils.c portalPrintf.c XsimTop.cpp poller.cpp transportSocket.c transportHardware.c transportXsim.c portal.c)

SIM_CXX_LOCAL = $(SIM_CXX_COMMON) $(DTOP)/jni/XsimMsgRequest.c $(DTOP)/jni/XsimMsgIndication.c $(DTOP)/jni/GeneratedCppCallbacks.cpp

all: ubuntu.exe bin/libconnectal-sim.so vlsim

ubuntu.exe:
	@echo "ubuntu.exe"
	cd jni; $(MAKE) --no-print-directory -f Ubuntu.mk ubuntu.exe
	@cp -v jni/ubuntu.exe bin
	@echo "ubuntu.exe done"
run:
	./bin/ubuntu.exe
define SIM_C_RULE
$1/$(notdir $(basename $3)).o: $3
	mkdir -p $1
	$(CC) -c $2 -o $1/$(notdir $(basename $3)).o $3
endef
define SIM_CXX_RULE
$1/$(notdir $(basename $3)).o: $3
	mkdir -p $1
	$(CXX) -c $2 -o $1/$(notdir $(basename $3)).o $3
endef
$(foreach src, $(filter %.c, $(SIM_CXX_LOCAL) $(SIM_CXX_PROJECT)), $(eval $(call SIM_C_RULE, $(DTOP)/lib, $(SIM_CFLAGS), $(src))))
$(foreach src, $(filter %.cpp, $(SIM_CXX_LOCAL) $(SIM_CXX_PROJECT)), $(eval $(call SIM_CXX_RULE, $(DTOP)/lib, $(SIM_CXXFLAGS), $(src))))
SIM_OBJECTS = $(addprefix $(DTOP)/lib/, $(addsuffix .o, $(basename $(notdir $(SIM_CXX_LOCAL) $(SIM_CXX_PROJECT)))))
vlsim:  obj_dir/vlsim

obj_dir/vlsim.mk: bin/libconnectal-sim.so verilog
	rm -fr obj_dir
	verilator -o vlsim --prefix vlsim $(VERILATOR_ARGS) -cc -exe $(DTOP)/verilog/mkXsimTop.v -DMainClockPeriod=4 -DDerivedClockPeriod=4 --top-module mkXsimTop $(VERILOG_PATH:%=-y %) -Wno-fatal $(CONNECTALDIR)/cpp/verilatortop.cpp -LDFLAGS -L$(DTOP)/bin

obj_dir/vlsim: obj_dir/vlsim.mk
	+$(MAKE) USER_LDLIBS="-lconnectal-sim -lpthread" VM_PARALLEL_BUILDS=1 -C obj_dir -f vlsim.mk
	cp obj_dir/vlsim bin/vlsim

bin/libconnectal-sim.so: $(SIM_OBJECTS)
	$(CXX) -O -g -Ijni -shared -fpic $(SIM_CXXFLAGS) -g -o bin/libconnectal-sim.so $(SIM_OBJECTS)
