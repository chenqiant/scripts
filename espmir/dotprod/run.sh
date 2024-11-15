export PATH=/home/chenqian/Workspace/tool/build_esp_clang/llvm/bin:$PATH
clang  -O3 -march=rv32imafc_zicsr_zifencei_xesppie -mabi=ilp32f -emit-llvm -S -o dsps_dotprod_f32_ansi.ll \
dsps_dotprod_f32_ansi.c \
--target=riscv32-esp-elf \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/dotprod/include \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include_sim \
-I/usr/include \
-I/usr/include/x86_64-linux-gnu \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include/ \

opt -mtriple=riscv32-esp-unknown-elf -passes=riscv-split-loop-by-length -riscv-split-loop-by-length=true dsps_dotprod_f32_ansi.ll  -S -o after_splitloopbylength.ll


opt -mtriple=riscv32-esp-unknown-elf -passes=riscv-custom-licm -riscv-custom-licm=true after_splitloopbylength.ll  -S -o after_customlicm.ll


opt -mtriple=riscv32-esp-unknown-elf -passes=riscv-loop-unroll-and-remainder -riscv-loop-unroll-and-remainder=true after_customlicm.ll  -S -o after_loopunrollandremainder.ll

llc --mcpu=esp32p4 --mtriple=riscv32 -O3 --enable-esp32-p4-optimize after_loopunrollandremainder.ll -o after_loopunrollandremainder.S

../preprocess_asm.sh after_loopunrollandremainder.S

cp after_loopunrollandremainder.S /home/chenqian/esp/esp-idf/components/esp-dsp/modules/dotprod/float/dsps_dotprod_f32_arp4.S 
