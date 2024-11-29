opt -S -mtriple=riscv32 -passes=loop-unroll -mcpu=sifive-s76 test.ll -o  optimized.ll -debug-pass-manager
opt -S -mtriple=riscv32 -passes=loop-unroll -mcpu=sifive-s76 test2.ll -o  optimized2.ll -debug-pass-manager
