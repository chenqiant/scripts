export PATH=/home/chenqian/Workspace/tool/build_esp_clang/llvm/bin:$PATH
clang  -O3 -march=rv32imafc_zicsr_zifencei_xesppie -mabi=ilp32f -emit-llvm -S -o dsps_biquad_f32_ansi_split.ll \
dsps_biquad_f32_ansi.c \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/iir/include/ \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/iir/biquad/include \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include_sim \
-I/usr/include \
-I/usr/include/x86_64-linux-gnu \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include/ \


opt  dsps_biquad_f32_ansi.ll -mtriple=riscv32-esp-unknown-elf -passes=riscv-split-loop-by-length -riscv-split-loop-by-length=true -S -o after_splitloopbylength.ll
# llc --mcpu=esp32p4 --mtriple=riscv32 after_splitloopbylength.ll -O3 -filetype=asm -o after_splitloopbylength.s

opt  after_splitloopbylength.ll -passes=riscv-custom-licm  -riscv-custom-licm=true -S -o after_customlicm.ll

opt  after_customlicm.ll -mtriple=riscv32-esp-unknown-elf -passes='riscv-loop-unroll-and-remainder' -riscv-loop-unroll-and-remainder=true  -S -o after_loopunrollandremainder.ll


llc --enable-esp32-p4-optimize --mcpu=esp32p4 --mtriple=riscv32 after_loopunrollandremainder.ll -O3 -filetype=asm -o after_loopunrollandremainder.s

../preprocess_asm.sh after_loopunrollandremainder.s
cp after_loopunrollandremainder.s /home/chenqian/esp/esp-idf/components/esp-dsp/modules/iir/biquad/dsps_biquad_f32_arp4.S 

# opt -passes=dot-cfg dsps_biquad_f32_ansi_split.ll
# dot -Tpng .dsps_biquad_f32_ansi.dot -o dsps_biquad_f32_ansi_split.png


# opt -passes=dot-cfg after_splitloopbylength.ll
# dot -Tpng .dsps_biquad_f32_ansi.dot -o dsps_biquad_f32_ansi_pass.png