clang  -O3 -march=rv32imafc_zicsr_zifencei_xesppie -mabi=ilp32f -emit-llvm -S -o dsps_wind_blackman_nuttall_f32_best.ll \
dsps_wind_blackman_nuttall_f32_best.c \
--target=riscv32-esp-elf \
-I /usr/include/

llc --mcpu=esp32p4 --mtriple=riscv32  dsps_wind_blackman_f32_best.ll -O3 -filetype=asm -o dsps_wind_blackman_f32_best.s

../preprocess_asm.sh dsps_wind_blackman_f32_best.s

cp dsps_wind_blackman_f32_best.s /home/chenqian/esp/esp-idf/components/esp-dsp/modules/windows/blackman/float/dsps_wind_blackman_f32_arp4.S
