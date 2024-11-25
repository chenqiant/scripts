
export PATH=/home/chenqian/Workspace/tool/build_esp_clang/llvm/bin:$PATH
clang   -O3 -march=rv32imafc_zicsr_zifencei_xesppie_zcmp -mabi=ilp32f -emit-llvm -S -o dsps_dotprod_s16_ansi.ll \
dsps_dotprod_s16_ansi.c \
--target=riscv32-esp-elf \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/dotprod/include \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include_sim \
-I/usr/include \
-I/usr/include/x86_64-linux-gnu \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include/


# clang   -O3 -march=rv32imafc_zicsr_zifencei_xesppie_zcmp -mabi=ilp32f -emit-llvm -S -o dsps_dotprod_s16_best.ll \
# dsps_dotprod_s16_best.c \
# --target=riscv32-esp-elf \
# -I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/dotprod/include \
# -I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include_sim \
# -I/usr/include \
# -I/usr/include/x86_64-linux-gnu \
# -I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include/

# llc  --mcpu=esp32p4 --mtriple=riscv32-esp-unknown-elf dsps_dotprod_s16_best.ll -O3 -filetype=asm -o dsps_dotprod_s16_best.s

# opt -mtriple=riscv32-esp-unknown-elf -passes=riscv-split-loop-by-length -riscv-split-loop-by-length=true dsps_dotprod_s16_ansi.ll  -S -o after_splitloopbylength.ll


# opt -mtriple=riscv32-esp-unknown-elf -passes=riscv-custom-licm -riscv-custom-licm=true after_splitloopbylength.ll  -S -o after_customlicm.ll


opt -mtriple=riscv32-esp-unknown-elf -passes=riscv-int-loop-unroll-and-remainder -riscv-int-loop-unroll-and-remainder=true dsps_dotprod_s16_ansi.ll  -S -o after_loopunrollandremainder.ll


llc  --mcpu=esp32p4 --mtriple=riscv32-esp-unknown-elf after_loopunrollandremainder.ll -O3 -filetype=asm -o after_loopunrollandremainder.s

../preprocess_asm.sh after_loopunrollandremainder.s

cp after_loopunrollandremainder.s /home/chenqian/esp/esp-idf/components/esp-dsp/modules/dotprod/fixed/dsps_dotprod_s16_arp4.S
