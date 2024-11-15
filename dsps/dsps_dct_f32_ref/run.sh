
export PATH=/home/chenqian/Workspace/tool/build_esp_clang/llvm/bin:$PATH
#-mllvm -opt-bisect-limit=0
clang -O3 -march=rv32imafc_zicsr_zifencei_xesppie -mabi=ilp32f -emit-llvm -S -o PrecomputeCosineFactors.ll \
PrecomputeCosineFactors.c \
--target=riscv32-esp-elf \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/dct/include/ \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include_sim/ \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include/ \
-I /home/chenqian/esp/esp-idf/components/esp_common/include/ \
-I /usr/include/ \
-I /usr/include/x86_64-linux-gnu/ \
-I /home/chenqian/esp/esp-idf/components/nvs_flash/test_nvs_host/ \


opt  dsps_dct_f32_ref.ll -mtriple=riscv32-esp-unknown-elf -passes=riscv-split-loop-by-length -riscv-split-loop-by-length=true -S -o after_splitloopbylength.ll


opt  after_splitloopbylength.ll -mtriple=riscv32-esp-unknown-elf -passes=riscv-custom-licm -riscv-custom-licm=true -S -o after_customlicm.ll

opt  after_customlicm.ll -passes=precomputecosinefactors -precomputecosinefactors=true -S -o after_precomputecosinefactors.ll
opt  after_precomputecosinefactors.ll -mtriple=riscv32-esp-unknown-elf -passes=riscv-loop-unroll-and-remainder -riscv-loop-unroll-and-remainder=true  -S -o after_loopunrollandremainder.ll

# llc --mcpu=esp32p4 --mtriple=riscv32 after_loopunrollandremainder.ll -O3 -filetype=asm -o after_loopunrollandremainder.s
llc --mcpu=esp32p4 --mtriple=riscv32 after_loopunrollandremainder.ll -O3 -filetype=asm -o after_loopunrollandremainder.s

../preprocess_asm.sh after_loopunrollandremainder.s
cp after_loopunrollandremainder.s /home/chenqian/esp/esp-idf/components/esp-dsp/modules/dct/float/dsps_dct_f32_ref_arp4.S
