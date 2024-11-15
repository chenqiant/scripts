clang  -O3 -march=rv32imafc_zicsr_zifencei_xesppie -mabi=ilp32f -emit-llvm -S -o dsps_dotprod_f32_best.ll \
dsps_dotprod_f32_best.c \
--target=riscv32-esp-elf \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/dotprod/include \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include_sim \
-I/usr/include \
-I/usr/include/x86_64-linux-gnu \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include/

clang -O3 -march=rv32imafc_zicsr_zifencei_xesppie -mabi=ilp32f -S -o dsps_dotprod_f32_best.S \
dsps_dotprod_f32_best.c \
--target=riscv32-esp-elf \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/dotprod/include \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include_sim \
-I/usr/include \
-I/usr/include/x86_64-linux-gnu \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include/ \

./preprocess_asm.sh ./dsps_dotprod_f32_best.S

cp dsps_dotprod_f32_best.S /home/chenqian/esp/esp-idf/components/esp-dsp/modules/dotprod/float/dsps_dotprod_f32_arp4.S