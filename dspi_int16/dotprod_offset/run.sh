
export PATH=/home/chenqian/Workspace/tool/build_esp_clang/llvm/bin:$PATH
clang   -O3 -march=rv32imafc_zicsr_zifencei_xesppie_zcmp -mabi=ilp32f -emit-llvm -S -o dspi_dotprod_off_s16_ansi.ll \
dspi_dotprod_off_s16_ansi.c \
--target=riscv32-esp-elf \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/dotprod/include \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include_sim \
-I/usr/include \
-I/usr/include/x86_64-linux-gnu \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include/


opt -mtriple=riscv32-esp-unknown-elf -passes=riscv-int-loop-unroll-and-remainder -riscv-int-loop-unroll-and-remainder=true dspi_dotprod_off_s16_ansi.ll  -S -o after_loopunrollandremainder.ll


llc  --mcpu=esp32p4 --mtriple=riscv32-esp-unknown-elf after_loopunrollandremainder.ll -O3 -filetype=asm -o after_loopunrollandremainder.s

../preprocess_asm.sh after_loopunrollandremainder.s

cp after_loopunrollandremainder.s /home/chenqian/esp/esp-idf/components/esp-dsp/modules/dotprod/fixed/dsps_dotprod_s16_arp4.S