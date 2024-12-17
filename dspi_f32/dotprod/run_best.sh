
export PATH=/home/chenqian/Workspace/tool/build_esp_clang/llvm/bin:$PATH
clang   -O2 -march=rv32imafc_zicsr_zifencei_xesppie -mabi=ilp32f -emit-llvm -S -o dspi_dotprod_f32_best.ll \
dspi_dotprod_f32_best.c \
--target=riscv32-esp-elf \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/dotprod/include \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include_sim \
-I/usr/include \
-I/usr/include/x86_64-linux-gnu \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include/
# llc --mcpu=esp32p4 --mtriple=riscv32-esp-unknown-elf dsps_dotprod_f32_ansi.ll -O3 -filetype=asm -o after_loopunrollandremainder.s

# clang -fassociative-math -falign-loops=16 -O3 -march=rv32imafc_zicsr_zifencei_xesppie_zcmp -mabi=ilp32f -emit-llvm -S -o dsps_dotprod_f32_best.ll \
# dsps_dotprod_f32_best.c \
# --target=riscv32-esp-elf \
# -I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/dotprod/include \
# -I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include_sim \
# -I/usr/include \
# -I/usr/include/x86_64-linux-gnu \
# -I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include/


llc --mcpu=esp32p4 --mtriple=riscv32-esp-unknown-elf dspi_dotprod_f32_best.ll -O3 -filetype=asm -o dspi_dotprod_f32_best.s

../preprocess_asm.sh dspi_dotprod_f32_best.s

cp dspi_dotprod_f32_best.s /home/chenqian/esp/esp-idf/components/esp-dsp/modules/dotprod/float/dspi_dotprod_f32_arp4.S 
