

export DTOP=$(PWD)
CONNECTALSDIR=$(DTOP)/../../../connectal
CONNECTALDIR=$(DTOP)/../../../../connectal

BOARD=zybo
MKTOP=mkZynqTop
OS=android
DUT=mkzynqtop

XILINX=1
ZYNQ=ZYNQ
ZynqHostInterface=ZynqHostInterface
PhysAddrWidth=32
CONNECTAL_BITS_DEPENDENCES=hw/mkTop.bit
CONNECTAL_RUN_SCRIPT=$(CONNECTALSDIR)/scripts/run.android
CONNECTAL_EXENAME=android.exe
BOARD_zybo=BOARD_zybo


include $(CONNECTALSDIR)/scripts/Makefile.connectal.build

#BLUESPEC_VERILOG=/scratch/bluespec/Bluespec-2015.09.beta2/lib/Verilog
export VERILOG_PATH=verilog $(CONNECTALDIR)/verilog/xilinx $(CONNECTALDIR)/verilog $(BLUESPEC_VERILOG)
FPGAMAKE=$(DTOP)/../../../../fpgamake/fpgamake

synth.%:fpgamake.mk
	$(MAKE) -f fpgamake.mk Synth/$*/$*-synth.dcp

hw/mkTop.bit: prepare_bin_target  fpgamake.mk
	$(Q)mkdir -p hw
	$(Q)$(MAKE) -f fpgamake.mk

unneeded:
	rm -rf Cache/ Impl/ Synth/ bin/ obj libs hw vivado* .Xil syntax.timestamp obj_dir/

new: unneeded
	make all

clean:
	rm -rf Cache Impl Synth bin hw vivado* obj/ .Xil libs/
