export PATH=/home/chenqian/Workspace/tool/build_esp_clang/llvm/bin:$PATH
clang  -O3 -march=rv32imafc_zicsr_zifencei_xesppie -mabi=ilp32f -emit-llvm -S -o dsps_biquad_f32_best.ll \
dsps_biquad_f32_best.c \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/iir/include/ \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/iir/biquad/include \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include_sim \
-I/usr/include \
-I/usr/include/x86_64-linux-gnu \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include/ \

opt  dsps_biquad_f32_best.ll -passes=riscv-custom-licm  -riscv-custom-licm=true -S -o after_customlicm_best.ll

llc --mcpu=esp32p4 --mtriple=riscv32 after_customlicm_best.ll -O3 -filetype=asm -o after_customlicm_best.s

../preprocess_asm.sh after_customlicm_best.s
cp after_customlicm_best.s /home/chenqian/esp/esp-idf/components/esp-dsp/modules/iir/biquad/dsps_biquad_f32_arp4.S 
