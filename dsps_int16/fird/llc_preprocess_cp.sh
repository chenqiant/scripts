
export PATH=/home/chenqian/Workspace/tool/build_esp_clang/llvm/bin:$PATH


llc --mcpu=esp32p4 --mtriple=riscv32 debug-man.ll -O3 -filetype=asm -o after_loopunrollandremainder.s

../preprocess_asm.sh after_loopunrollandremainder.s

cp after_loopunrollandremainder.s /home/chenqian/esp/esp-idf/components/esp-dsp/modules/fir/fixed/dsps_fird_s16_arp4.S

