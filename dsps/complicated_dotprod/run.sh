export PATH=/home/chenqian/Workspace/tool/build_esp_clang/llvm/bin:$PATH
clang  -O3 -march=rv32imafc_zicsr_zifencei_xesppie -mabi=ilp32f -emit-llvm -S -o test.ll test.c

opt  test.ll -passes=splitloopbylength -splitloopbylength=true -S -o after_splitloopbylength.ll

opt  after_splitloopbylength.ll -passes=customlicm  -customlicm=true -S -o after_customlicm.ll

opt  after_customlicm.ll -passes=loopunrollandremainder -loopunrollandremainder=true -S -o after_loopunrollandremainder.ll

llc --mcpu=esp32p4 --mtriple=riscv32 after_loopunrollandremainder.ll -O3 -filetype=asm -o after_loopunrollandremainder.s
