include ../makefile.in

BSVTOKAMI=JAVA_OPTS=-ea $(TOPDIR)/../bsvtokami/build/install/bsvtokami/bin/bsvtokami -I . -K generated

SOURCES=gcd.bsv \
    Assert.bsv BRAMCore.bsv BUtils.bsv BuildVector.bsv \
    ClientServer.bsv Clocks.bsv Cntrs.bsv ConfigReg.bsv \
    Connectable.bsv Counter.bsv DefaultValue.bsv \
    FIFO.bsv FIFOF.bsv FIFOLevel.bsv FShow.bsv SpecialFIFOs.bsv \
    GetPut.bsv Prelude.bsv RS232.bsv RegFile.bsv \
    RevertingVirtualReg.bsv StmtFSM.bsv Vector.bsv \
    PipelinedProc.bsv ProcDecExec.bsv ProcMemInterm.bsv ProcMemSpec.bsv

TARGETS=$(patsubst %.bsv, generated/%.generated.IR, $(SOURCES))

all: outdir $(TARGETS)

generated/%.generated.IR: %.bsv
	$(BSVTOKAMI) $(*).bsv

outdir:
	mkdir -p generated

#JAVA_OPTS=-ea ../build/install/bsvtokami/bin/bsvtokami -I . -I ../lib -K out ../lib/FIFO.bsv
#JAVA_OPTS=-ea ../build/install/bsvtokami/bin/bsvtokami -I . -I ../lib -K out ProcMemInterm.bsv
#JAVA_OPTS=-ea ../build/install/bsvtokami/bin/bsvtokami -I . -I ../lib -K out PipelinedProc.bsv
#JAVA_OPTS=-ea ../build/install/bsvtokami/bin/bsvtokami -I . -I ../lib -K out ProcDecExec.bsv
#JAVA_OPTS=-ea ../build/install/bsvtokami/bin/bsvtokami -I . -I ../lib -K out ProcMemSpec.bsv
#JAVA_OPTS=-ea ../build/install/bsvtokami/bin/bsvtokami -I . -I ../lib -K out ../lib/RegFile.bsv
#JAVA_OPTS=-ea ../build/install/bsvtokami/bin/bsvtokami -I . -I ../lib -K out ProcMemInterm.bsv
