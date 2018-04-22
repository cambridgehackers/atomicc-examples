
VERILATOR_FLAGS = --cc +librescan +libext+.v -y . +incdir+.

all:
	verilator $(DEBUG_QUIET) $(VERILATOR_FLAGS) top.v --trace
	cd obj_dir ; $(MAKE) -j 3 -f ../Makefile_obj
	obj_dir/simx

