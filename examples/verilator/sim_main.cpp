
#include <verilated.h>
#include <verilated_vcd_c.h>

#include "Vtop.h"              // From Verilating "top.v"

static vluint64_t main_time = 0;      // Current simulation time (64-bit unsigned) 
double sc_time_stamp () {      // Called by $time in Verilog
    return main_time;          // Note does conversion to real, to match SystemC
} 
int main(int argc, char **argv)
{
    Vtop *top = new Vtop;      // Create instance of module 
    Verilated::commandArgs(argc, argv);
    Verilated::debug(0); 
    Verilated::traceEverOn(true);// Verilator must compute traced signals
    VerilatedVcdC* tfp = new VerilatedVcdC;
    top->trace (tfp, 99);        // Trace 99 levels of hierarchy
    tfp->open ("output.vcd");    // Open the dump file

    top->reset_l = 1;            // Set some inputs
    top->fastclk = 0;
    top->clk = 0;
    top->passed = 0; 
    while (main_time < 60 && !top->passed && !Verilated::gotFinish()) { 
        if ((main_time % 10) == 3) // Toggle clock
            top->clk = 1;
        if ((main_time % 10) == 8)
            top->clk = 0;
        if (main_time > 10)
            top->reset_l = 1;    // Deassert reset
        else if (main_time > 1)
            top->reset_l = 0;    // Assert reset
        top->eval();             // Evaluate model
        tfp->dump (main_time);   // Create waveform trace for this timestamp
        // Read outputs
        printf ("[%ld] %x %x %x %x %x_%08x_%08x\n",
            (long)main_time, top->clk, top->reset_l, top->passed,
            top->out_small, top->out_wide[2], top->out_wide[1], top->out_wide[0]);
        top->fastclk = !top->fastclk;
        main_time++;                // Time passes...
    }
    top->final();
    tfp->close();
    printf("All over %d\n", top->passed);
    return top->passed ? 0 : -1;
}
