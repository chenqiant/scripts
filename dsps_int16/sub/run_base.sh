# rm -rf *.ll *.s
export PATH=/home/chenqian/Workspace/tool/build_esp_clang/llvm/bin:$PATH
clang  -O3 -march=rv32imafc_zicsr_zifencei_xesppie -mabi=ilp32f -emit-llvm -S -o dsps_sub_s16_ansi.ll \
dsps_sub_s16_ansi.c \
--target=riscv32-esp-elf \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/math/sub/include/ \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include/ \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include_sim \
-I /home/chenqian/esp/esp-idf/components/esp_common/include/ \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/math/add/include/ \
-I /usr/include/ \
-I /home/chenqian/esp/esp-idf/components/nvs_flash/test_nvs_host/


llc --mcpu=esp32p4 --mtriple=riscv32 dsps_sub_s16_ansi.ll -O3 -filetype=asm -o dsps_sub_s16_ansi.s

../preprocess_asm.sh dsps_sub_s16_ansi.s

cp dsps_sub_s16_ansi.s /home/chenqian/esp/esp-idf/components/esp-dsp/modules/math/sub/fixed/dsps_sub_s16_arp4.S
