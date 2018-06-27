
set partname {xc7z010clg400-1}
set boardname {zybo}
## for compatibility with older fpgamake. will be removed.
set xbsvipdir {/home/jca/git/connectal/out}
set ipdir {/home/jca/git/connectal/out}
set connectaldir {/home/jca/git/connectal}
set need_pcie {unused}
set connectal_dut {mkZynqTop}
set TRACE_PORTAL {}
set ConnectalVersion {18.04.1}
set NumberOfMasters {1}
set PinType {Empty}
set PinTypeInclude {Misc}
set NumberOfUserTiles {1}
set SlaveDataBusWidth {32}
set SlaveControlAddrWidth {5}
set BurstLenSize {10}
set project_dir {$(DTOP)}
set MainClockPeriod {10}
set DerivedClockPeriod {5.000000}
set XILINX {1}
set ZYNQ {}
set ZynqHostInterface {}
set PhysAddrWidth {32}
set NUMBER_OF_LEDS {4}
set CONNECTAL_BITS_DEPENDENCES {hw/mkTop.bit}
set CONNECTAL_RUN_SCRIPT {$(CONNECTALDIR)/scripts/run.android}
set CONNECTAL_EXENAME {android.exe}
set CONNECTAL_EXENAME2 {android.exe2}
set BOARD_zybo {}
