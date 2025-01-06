clang  -O2 -march=rv32imafc_zicsr_zifencei_xesppie -mabi=ilp32f -emit-llvm -S -o dspi_conv_f32_best.ll \
dspi_conv_f32_best.c \
--target=riscv32-esp-elf \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/conv/include \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include_sim \
-I/usr/include \
-I/usr/include/x86_64-linux-gnu \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include/

llc --mcpu=esp32p4 --mtriple=riscv32 dspi_conv_f32_best.ll -O3 -filetype=asm -o dspi_conv_f32_best.s

../preprocess_asm.sh dspi_conv_f32_best.s

cp dspi_conv_f32_best.s /home/chenqian/esp/esp-idf/components/esp-dsp/modules/conv/float/dspi_conv_f32_arp4.S
