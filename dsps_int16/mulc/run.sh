
export PATH=/home/chenqian/Workspace/tool/build_esp_clang/llvm/bin:$PATH
clang  -O3 -march=rv32imafc_zicsr_zifencei_xesppie -mabi=ilp32f -emit-llvm -S -o dsps_mulc_s16_ansi.ll \
dsps_mulc_s16_ansi.c \
--target=riscv32-esp-elf \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/math/mulc/include/ \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include/ \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include_sim \
-I /home/chenqian/esp/esp-idf/components/esp_common/include/ \
-I /usr/include/ \
-I /home/chenqian/esp/esp-idf/components/nvs_flash/test_nvs_host/


opt  dsps_mulc_s16_ansi.ll -mtriple=riscv32-esp-unknown-elf -passes=riscv-custom-licm -riscv-custom-licm=true  -S -o after_customlicm.ll

opt  after_customlicm.ll -mtriple=riscv32-esp-unknown-elf -passes=riscv-int-loop-unroll-and-remainder -riscv-int-loop-unroll-and-remainder=true  -S -o after_loopunrollandremainder.ll

llc --mcpu=esp32p4 --mtriple=riscv32  after_loopunrollandremainder.ll -O3 -filetype=asm -o after_loopunrollandremainder.s

../preprocess_asm.sh after_loopunrollandremainder.s

cp after_loopunrollandremainder.s /home/chenqian/esp/esp-idf/components/esp-dsp/modules/math/mulc/fixed/dsps_mulc_s16_arp4.S
