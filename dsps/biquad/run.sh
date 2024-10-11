export PATH=/home/chenqian/Workspace/tool/build_esp_clang/llvm/bin:$PATH
clang -O3 -march=rv32imafc_zicsr_zifencei_xesppie -mabi=ilp32f -emit-llvm -S -o dsps_biquad_f32_ansi.ll \
dsps_biquad_f32_ansi.c \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/iir/include/ \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/iir/biquad/include \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include_sim \
-I/usr/include \
-I/usr/include/x86_64-linux-gnu \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include/ \


opt  dsps_biquad_f32_ansi.ll -passes=splitloopbylength -splitloopbylength=true -S -o after_splitloopbylength.ll
# llc --mcpu=esp32p4 --mtriple=riscv32 after_splitloopbylength.ll -O3 -filetype=asm -o after_splitloopbylength.s

opt  after_splitloopbylength.ll -passes=customlicm  -customlicm=true -S -o after_customlicm.ll

opt  after_customlicm.ll -passes=loopunrollandremainder -loopunrollandremainder=true -S -o after_loopunrollandremainder.ll

llc --mcpu=esp32p4 --mtriple=riscv32 after_loopunrollandremainder.ll -O3 -filetype=asm -o after_loopunrollandremainder.s

../preprocess_asm.sh after_loopunrollandremainder.s
cp after_loopunrollandremainder.s /home/chenqian/esp/esp-idf/components/esp-dsp/modules/iir/biquad/dsps_biquad_f32_arp4.S 
