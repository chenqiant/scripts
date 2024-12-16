clang  -O3 -march=rv32imafc_zicsr_zifencei_xesppie -mabi=ilp32f -emit-llvm -S -o dsps_biquad_f32_ansi.ll \
dsps_biquad_f32_ansi.c \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/iir/include/ \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/iir/biquad/include \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include_sim \
-I/usr/include \
-I/usr/include/x86_64-linux-gnu \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include/ \

llc --mcpu=esp32p4 --mtriple=riscv32  dsps_biquad_f32_ansi.ll -O3 -filetype=asm -o dsps_biquad_f32_ansi.s

../preprocess_asm.sh dsps_biquad_f32_ansi.s
cp dsps_biquad_f32_ansi.s /home/chenqian/esp/esp-idf/components/esp-dsp/modules/iir/biquad/dsps_biquad_f32_arp4.S