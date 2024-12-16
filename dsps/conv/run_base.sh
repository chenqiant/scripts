clang  -O3 -march=rv32imafc_zicsr_zifencei_xesppie -mabi=ilp32f -emit-llvm -S -o dsps_conv_f32_ansi.ll \
dsps_conv_f32_ansi.c \
--target=riscv32-esp-elf \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/conv/include \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include_sim \
-I/usr/include \
-I/usr/include/x86_64-linux-gnu \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include/ \

llc --mcpu=esp32p4 --mtriple=riscv32  dsps_conv_f32_ansi.ll -O3 -filetype=asm -o dsps_conv_f32_ansi.s

../preprocess_asm.sh dsps_conv_f32_ansi.s
cp dsps_conv_f32_ansi.s /home/chenqian/esp/esp-idf/components/esp-dsp/modules/conv/float/dsps_conv_f32_arp4.S
