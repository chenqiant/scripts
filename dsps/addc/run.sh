rm -rf *.ll *.s
export PATH=/home/chenqian/Workspace/tool/build_esp_clang/llvm/bin:$PATH
clang  -O3 -march=rv32imafc_zicsr_zifencei_xesppie -mabi=ilp32f -emit-llvm -S -o dsps_addc_f32_ansi.ll \
dsps_addc_f32_ansi.c \
--target=riscv32-esp-elf \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/math/addc/include/ \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include/ \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include_sim \
-I /home/chenqian/esp/esp-idf/components/esp_common/include/ \
-I /usr/include/ \
-I /usr/include/x86_64-linux-gnu/ \
-I /home/chenqian/esp/esp-idf/components/nvs_flash/test_nvs_host/ \

opt -S -strip-named-metadata -filter-print-funcs=dsps_addc_f32_ansi dsps_addc_f32_ansi.ll -o extracted_function.ll


opt  dsps_addc_f32_ansi.ll -mtriple=riscv32-esp-unknown-elf -passes=riscv-split-loop-by-length -riscv-split-loop-by-length=true -S -o after_splitloopbylength.ll

opt  after_splitloopbylength.ll -mtriple=riscv32-esp-unknown-elf -passes=riscv-custom-licm -riscv-custom-licm=true -S -o after_customlicm.ll

opt  after_customlicm.ll -mtriple=riscv32-esp-unknown-elf -passes=riscv-loop-unroll-and-remainder -riscv-loop-unroll-and-remainder=true  -S -o after_loopunrollandremainder.ll


llc --enable-esp32-p4-optimize --mcpu=esp32p4 --mtriple=riscv32 after_loopunrollandremainder.ll -O3 -filetype=asm -o after_loopunrollandremainder.s

../preprocess_asm.sh after_loopunrollandremainder.s

cp after_loopunrollandremainder.s /home/chenqian/esp/esp-idf/components/esp-dsp/modules/math/addc/float/dsps_addc_f32_arp4.S
