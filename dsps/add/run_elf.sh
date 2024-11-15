export PATH=/home/chenqian/Workspace/tool/build_esp_clang/llvm/bin:$PATH

clang -fno-ident -O3 -march=rv32imafc_zicsr_zifencei_xesppie -mabi=ilp32f -S -o dsps_add_f32_ansi.S \
dsps_add_f32_ansi.c \
--target=riscv32-esp-elf \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/math/add/include/ \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include_sim \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include/ \
-I /home/chenqian/esp/esp-idf/components/esp_common/include/ \
-I /usr/include/ \
-I /usr/include/x86_64-linux-gnu/ \
-I /home/chenqian/esp/esp-idf/components/nvs_flash/test_nvs_host/ \
-mllvm -enable-esp32-p4-optimize \

