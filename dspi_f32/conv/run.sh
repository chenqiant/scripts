
clang  -O2 -march=rv32imafc_zicsr_zifencei_xesppie -mabi=ilp32f -emit-llvm -S -o dspi_conv_f32_ansi.ll \
dspi_conv_f32_ansi.c \
--target=riscv32-esp-elf \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/conv/include \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include_sim \
-I/usr/include \
-I/usr/include/x86_64-linux-gnu \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include/


opt  dspi_conv_f32_ansi.ll -mtriple=riscv32-esp-unknown-elf -passes=riscv-split-loop-by-length -riscv-split-loop-by-length=true -S -o after_splitloopbylength.ll

opt  after_splitloopbylength.ll -mtriple=riscv32-esp-unknown-elf -passes=riscv-custom-licm -riscv-custom-licm=true -S -o after_customlicm.ll

opt  -dspi-matrix-size=4x4 after_customlicm.ll -mtriple=riscv32-esp-unknown-elf -passes=riscv-int-loop-unroll-and-remainder -riscv-int-loop-unroll-and-remainder=true  -S -o after_loopunrollandremainder.ll


llc -enable-misched -enable-post-misched -misched-topdown --mcpu=esp32p4 --mtriple=riscv32 after_loopunrollandremainder.ll -O3 -filetype=asm -o after_loopunrollandremainder.s

../preprocess_asm.sh after_loopunrollandremainder.s

cp after_loopunrollandremainder.s /home/chenqian/esp/esp-idf/components/esp-dsp/modules/conv/float/dspi_conv_f32_arp4.S
