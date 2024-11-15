
rm -rf *.ll *.s
export PATH=/home/chenqian/Workspace/tool/build_esp_clang/llvm/bin:$PATH
clang  -fassociative-math -falign-loops=16 -O3 -march=rv32imafc_zicsr_zifencei_xesppie_zcmp -mabi=ilp32f -emit-llvm -S -o dsps_dotprod_f32_ansi.ll \
dsps_dotprod_f32_ansi.c \
--target=riscv32-esp-elf \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/dotprod/include \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include_sim \
-I/usr/include \
-I/usr/include/x86_64-linux-gnu \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include/
# llc --mcpu=esp32p4 --mtriple=riscv32-esp-unknown-elf dsps_dotprod_f32_ansi.ll -O3 -filetype=asm -o after_loopunrollandremainder.s

clang -fassociative-math -falign-loops=16 -O3 -march=rv32imafc_zicsr_zifencei_xesppie_zcmp -mabi=ilp32f -emit-llvm -S -o dsps_dotprod_f32_best.ll \
dsps_dotprod_f32_best.c \
--target=riscv32-esp-elf \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/dotprod/include \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include_sim \
-I/usr/include \
-I/usr/include/x86_64-linux-gnu \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include/

opt -mtriple=riscv32-esp-unknown-elf -passes=riscv-split-loop-by-length -riscv-split-loop-by-length=true dsps_dotprod_f32_ansi.ll  -S -o after_splitloopbylength.ll


opt -mtriple=riscv32-esp-unknown-elf -passes=riscv-custom-licm -riscv-custom-licm=true after_splitloopbylength.ll  -S -o after_customlicm.ll


opt -mtriple=riscv32-esp-unknown-elf -passes=riscv-loop-unroll-and-remainder -riscv-loop-unroll-and-remainder=true after_customlicm.ll  -S -o after_loopunrollandremainder.ll


llc --enable-esp32-p4-optimize --mcpu=esp32p4 --mtriple=riscv32-esp-unknown-elf --enable-esp32-p4-optimize after_loopunrollandremainder.ll -O3 -filetype=asm -o after_loopunrollandremainder.s

../preprocess_asm.sh after_loopunrollandremainder.s

cp after_loopunrollandremainder.s /home/chenqian/esp/esp-idf/components/esp-dsp/modules/dotprod/float/dsps_dotprod_f32_arp4.S 
