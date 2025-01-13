clang -O2 -march=rv32imafc_zicsr_zifencei_xesppie -mabi=ilp32f -emit-llvm -S -o dsps_bit_rev_fc32_ansi.ll \
dsps_bit_rev_fc32_ansi.c \
--target=riscv32-esp-elf \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/fft/include/ \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include_sim/ \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include/ \
-I /home/chenqian/esp/esp-idf/components/esp_common/include/ \
-I /usr/include/ \
-I /usr/include/x86_64-linux-gnu/ \
-I /home/chenqian/esp/esp-idf/components/nvs_flash/test_nvs_host/

opt -mtriple=riscv32-esp-unknown-elf -passes=loop-extract dsps_bit_rev_fc32_ansi.ll -S -o output.ll

opt  dsps_bit_rev_fc32_ansi.ll -mtriple=riscv32-esp-unknown-elf -passes=riscv-split-loop-by-length -riscv-split-loop-by-length=true -S -o after_splitloopbylength.ll

opt  after_splitloopbylength.ll -mtriple=riscv32-esp-unknown-elf -passes=riscv-custom-licm -riscv-custom-licm=true -S -o after_customlicm.ll


opt  after_customlicm.ll -mtriple=riscv32-esp-unknown-elf -passes=riscv-int-loop-unroll-and-remainder -riscv-int-loop-unroll-and-remainder=true  -S -o after_loopunrollandremainder.ll

# opt after_customlicm.ll -mtriple=riscv32-esp-unknown-elf -passes=loop-unroll -unroll-allow-partial -unroll-count=2   -S -o after_loopunrollandremainder.ll

llc --mcpu=esp32p4 --mtriple=riscv32 after_loopunrollandremainder.ll -O3 -filetype=asm -o after_loopunrollandremainder.s

../preprocess_asm.sh after_loopunrollandremainder.s
cp after_loopunrollandremainder.s /home/chenqian/esp/esp-idf/components/esp-dsp/modules/fft/float/dsps_bit_rev_fc32_arp4.S

# opt -passes=dot-cfg after_loopunrollandremainder.ll
# dot -Tpng .dsps_bit_rev_fc32_ansi.dot -o after_loopunrollandremainder.png


# opt -passes=dot-cfg dsps_bit_rev_fc32_best.ll
# dot -Tpng .dsps_bit_rev_fc32_ansi.dot -o dsps_bit_rev_fc32_best.png