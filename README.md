Atomic C
==========

We're exploring the use of LLVM as an intermediate language for a hardware description language like Bluespec.

Since we do not have a full Bluespec frontend, we're using C++ as a way to generate the LLVM IR that we imagine would come out of the front end.

Atomic C compiles C++ to LLVM intermediate language, then runs the
program to perform static elaboration, then generates code.

To install clang/llvm on Ubuntu:
    sudo apt-get install clang llvm
