

export PATH=/home/chenqian/Workspace/tool/build_esp_clang/llvm/bin:$PATH
clang  -O2 -march=rv32imafc_zicsr_zifencei_xesppie -mabi=ilp32f -emit-llvm -S -o dsps_fird_f32_ansi.ll \
dsps_fird_f32_ansi.c \
--target=riscv32-esp-elf \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/fir/include \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include_sim \
-I/usr/include \
-I/usr/include/x86_64-linux-gnu \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include/ \
-I/home/chenqian/Workspace/esp-dsp/esp_common/include/
# llc --mcpu=esp32p4 --mtriple=riscv32 dsps_fird_f32_ansi.ll -O3 -filetype=asm -o after_loopunrollandremainder.s

# clang  -O3 -march=rv32imafc_zicsr_zifencei_xesppie -mabi=ilp32f -emit-llvm -S -o dsps_fird_f32_best.ll \
# dsps_fird_f32_best.c \
# --target=riscv32-esp-elf \
# -I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/fir/include \
# -I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include_sim \
# -I/usr/include \
# -I/usr/include/x86_64-linux-gnu \
# -I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include/ \

opt  dsps_fird_f32_ansi.ll -mtriple=riscv32-esp-unknown-elf -passes=riscv-split-loop-by-length -riscv-split-loop-by-length=true -S -o after_splitloopbylength.ll

opt  after_splitloopbylength.ll -mtriple=riscv32-esp-unknown-elf -passes=riscv-custom-licm -riscv-custom-licm=true -S -o after_customlicm.ll

opt  after_customlicm.ll -mtriple=riscv32-esp-unknown-elf -passes=riscv-loop-unroll-and-remainder -riscv-loop-unroll-and-remainder=true  -S -o after_loopunrollandremainder.ll

# opt  after_loopunrollandremainder.ll -mtriple=riscv32-esp-unknown-elf -passes=instcombine -S -o after_instcombine.ll
# llc --mcpu=esp32p4 --mtriple=riscv32 manully.ll -O3 -filetype=asm -o manully.s
# llc --mcpu=esp32p4 --mtriple=riscv32 dsps_fird_f32_best.ll -O3 -filetype=asm -o dsps_fird_f32_best.s

llc --mcpu=esp32p4 --mtriple=riscv32 after_loopunrollandremainder.ll -O3 -filetype=asm -o after_loopunrollandremainder.s

../preprocess_asm.sh after_loopunrollandremainder.s
cp after_loopunrollandremainder.s /home/chenqian/esp/esp-idf/components/esp-dsp/modules/fir/float/dsps_fird_f32_arp4.S

# opt -passes=dot-cfg after_loopunrollandremainder.ll
# dot -Tpng .dsps_fird_f32_ansi.dot -o dsps_fird_f32_ansi.png


# opt -passes=dot-cfg dsps_fird_f32_best.ll
# dot -Tpng .dsps_fird_f32_ansi.dot -o dsps_fird_f32_best.png

