
export PATH=/home/chenqian/Workspace/tool/build_esp_clang/llvm/bin:$PATH
clang  -O3 -march=rv32imafc_zicsr_zifencei_xesppie -mabi=ilp32f -emit-llvm -S -o dsps_mul_s8_ansi.ll \
dsps_mul_s8_ansi.c \
--target=riscv32-esp-elf \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/math/mul/include/ \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include/ \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include_sim \
-I /home/chenqian/esp/esp-idf/components/esp_common/include/ \
-I /usr/include/ \
-I /home/chenqian/esp/esp-idf/components/nvs_flash/test_nvs_host/ \

llc --mcpu=esp32p4 --mtriple=riscv32  dsps_mul_s8_ansi.ll -O3 -filetype=asm -o dsps_mul_s8_ansi.s

../preprocess_asm.sh dsps_mul_s8_ansi.s

cp dsps_mul_s8_ansi.s /home/chenqian/esp/esp-idf/components/esp-dsp/modules/math/mul/fixed/dsps_mul_s8_arp4.S
