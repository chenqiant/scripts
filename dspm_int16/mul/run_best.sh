clang  -O2 -march=rv32imafc_zicsr_zifencei_xesppie -mabi=ilp32f -emit-llvm -S -o dspm_mult_s16_best.ll \
dspm_mult_s16_best.c \
--target=riscv32-esp-elf \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/math/mul/include/ \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include/ \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include_sim \
-I /home/chenqian/esp/esp-idf/components/esp_common/include/ \
-I /usr/include/ \
-I /home/chenqian/esp/esp-idf/components/nvs_flash/test_nvs_host/ \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/dotprod/include/ \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/matrix/mul/include/

llc --mcpu=esp32p4 --mtriple=riscv32  dspm_mult_s16_best.ll -O3 -filetype=asm -o after_loopunrollandremainder.s

../preprocess_asm.sh after_loopunrollandremainder.s

cp after_loopunrollandremainder.s /home/chenqian/esp/esp-idf/components/esp-dsp/modules/matrix/mul/fixed/dspm_mult_s16_arp4.S
