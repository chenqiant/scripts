clang   -O2 -march=rv32imafc_zicsr_zifencei_xesppie -mabi=ilp32f -emit-llvm -S -o dspm_mult_ex_f32_ansi.ll \
dspm_mult_ex_f32_ansi.c \
--target=riscv32-esp-elf \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/dotprod/include \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include_sim \
-I/usr/include \
-I/usr/include/x86_64-linux-gnu \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include/ \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/matrix/mul/include/

opt -mtriple=riscv32-esp-unknown-elf -passes=riscv-custom-licm -riscv-custom-licm=true dspm_mult_ex_f32_ansi.ll  -S -o after_customlicm.ll


opt -mtriple=riscv32-esp-unknown-elf -passes=riscv-int-loop-unroll-and-remainder -riscv-int-loop-unroll-and-remainder=true after_customlicm.ll  -S -o after_loopunrollandremainder.ll


llc --mcpu=esp32p4 --mtriple=riscv32-esp-unknown-elf after_loopunrollandremainder.ll -O3 -filetype=asm -o after_loopunrollandremainder.s

../preprocess_asm.sh after_loopunrollandremainder.s

cp after_loopunrollandremainder.s /home/chenqian/esp/esp-idf/components/esp-dsp/modules/matrix/mul/float/dspm_mult_ex_f32_arp4.S 
