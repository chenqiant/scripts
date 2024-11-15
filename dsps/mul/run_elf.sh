export PATH=/home/chenqian/Workspace/tool/build_esp_clang/llvm/bin:$PATH
clang -O2 -march=rv32imafc_zicsr_zifencei_xesppie -mabi=ilp32f -S -o dsps_mul_f32_ansi.S \
dsps_mul_f32_ansi.c \
--target=riscv32-esp-elf \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/math/mul/include/ \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include/ \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include_sim \
-I /home/chenqian/esp/esp-idf/components/esp_common/include/ \
-I /usr/include/ \
-I /home/chenqian/esp/esp-idf/components/nvs_flash/test_nvs_host/ \
-mllvm -enable-esp32-p4-optimize