# rm -rf *.ll *.s
export PATH=/home/chenqian/Workspace/tool/build_esp_clang/llvm/bin:$PATH
clang  -O2 -march=rv32imafc_zicsr_zifencei_xesppie -mabi=ilp32f -emit-llvm -S -o dspm_mult_s16_ansi.ll \
dspm_mult_s16_ansi.c \
--target=riscv32-esp-elf \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/math/mul/include/ \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include/ \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include_sim \
-I /home/chenqian/esp/esp-idf/components/esp_common/include/ \
-I /usr/include/ \
-I /home/chenqian/esp/esp-idf/components/nvs_flash/test_nvs_host/ \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/dotprod/include/ \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/matrix/mul/include/


opt  dspm_mult_s16_ansi.ll -mtriple=riscv32-esp-unknown-elf -passes=riscv-custom-licm -riscv-custom-licm=true -S -o after_customlicm.ll

opt  after_customlicm.ll -mtriple=riscv32-esp-unknown-elf -passes=riscv-int-loop-unroll-and-remainder -riscv-int-loop-unroll-and-remainder=true  -S -o after_loopunrollandremainder.ll


llc --mcpu=esp32p4 --mtriple=riscv32 --enable-esp32-p4-optimize after_loopunrollandremainder.ll -O3 -filetype=asm -o after_loopunrollandremainder.s

../preprocess_asm.sh after_loopunrollandremainder.s

cp after_loopunrollandremainder.s /home/chenqian/esp/esp-idf/components/esp-dsp/modules/math/mul/fixed/dspm_mult_s16_arp4.S
