export PATH=/home/chenqian/Workspace/tool/build_esp_clang/llvm/bin:$PATH
clang -O3 -march=rv32imafc_zicsr_zifencei_xesppie -mabi=ilp32f -S -o dsps_conv_f32_ansi.S \
dsps_conv_f32_ansi.c \
--target=riscv32-esp-elf \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/conv/include \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include_sim \
-I/usr/include \
-I/usr/include/x86_64-linux-gnu \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include/ \
-mllvm -enable-esp32-p4-optimize