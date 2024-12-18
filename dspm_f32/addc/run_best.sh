
export PATH=/home/chenqian/Workspace/tool/build_esp_clang/llvm/bin:$PATH
clang   -O2 -march=rv32imafc_zicsr_zifencei_xesppie -mabi=ilp32f -emit-llvm -S -o dspm_addc_f32_best.ll \
dspm_addc_f32_best.c \
--target=riscv32-esp-elf \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/dotprod/include \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include_sim \
-I/usr/include \
-I/usr/include/x86_64-linux-gnu \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include/ \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/matrix/add/include/ \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/matrix/addc/include/


llc --mcpu=esp32p4 --mtriple=riscv32-esp-unknown-elf dspm_addc_f32_best.ll -O3 -filetype=asm -o dspi_addc_f32_best.s

../preprocess_asm.sh dspi_addc_f32_best.s

cp dspi_addc_f32_best.s /home/chenqian/esp/esp-idf/components/esp-dsp/modules/matrix/addc/float/dspm_addc_f32_arp4.S 
