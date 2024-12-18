
export PATH=/home/chenqian/Workspace/tool/build_esp_clang/llvm/bin:$PATH
clang   -O2 -march=rv32imafc_zicsr_zifencei_xesppie -mabi=ilp32f -emit-llvm -S -o dspm_mult_f32_best.ll \
dspm_mult_f32_best.c \
--target=riscv32-esp-elf \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/dotprod/include \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include_sim \
-I/usr/include \
-I/usr/include/x86_64-linux-gnu \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include/ \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/matrix/mul/include/


llc --mcpu=esp32p4 --mtriple=riscv32-esp-unknown-elf dspm_mult_f32_best.ll -O3 -filetype=asm -o dspi_mult_f32_best.s

../preprocess_asm.sh dspi_mult_f32_best.s

cp dspi_mult_f32_best.s /home/chenqian/esp/esp-idf/components/esp-dsp/modules/matrix/mul/float/dspm_mult_f32_arp4.S 
