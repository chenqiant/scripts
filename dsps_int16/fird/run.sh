# rm -rf *.ll *.s
export PATH=/home/chenqian/Workspace/tool/build_esp_clang/llvm/bin:$PATH
clang  -O3 -march=rv32imafc_zicsr_zifencei_xesppie -mabi=ilp32f -emit-llvm -S -o dsps_fird_s16_ansi.ll \
dsps_fird_s16_ansi.c \
--target=riscv32-esp-elf \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/fir/include \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include_sim \
-I /usr/include \
-I /usr/include/x86_64-linux-gnu \
-I /home/chenqian/esp/esp-idf/components/esp_common/include/ \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include/

# clang  -O3 -march=rv32imafc_zicsr_zifencei_xesppie -mabi=ilp32f -emit-llvm -S -o dsps_fird_s16_ansi-licm.ll \
# dsps_fird_s16_ansi-licm.c \
# --target=riscv32-esp-elf \
# -I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/fir/include \
# -I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include_sim \
# -I /usr/include \
# -I /usr/include/x86_64-linux-gnu \
# -I /home/chenqian/esp/esp-idf/components/esp_common/include/ \
# -I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include/

opt  dsps_fird_s16_ansi.ll -mtriple=riscv32-esp-unknown-elf -passes=riscv-custom-licm -riscv-custom-licm=true -S -o after_customlicm.ll


opt  after_customlicm.ll -mtriple=riscv32-esp-unknown-elf -passes=riscv-int-loop-unroll-and-remainder -riscv-int-loop-unroll-and-remainder=true  -S -o after_loopunrollandremainder.ll


# opt -O3 after_loopunrollandremainder.ll -S -o after_o3.ll
llc --mcpu=esp32p4 --mtriple=riscv32 after_loopunrollandremainder.ll -O3 -filetype=asm -o after_loopunrollandremainder.s

../preprocess_asm.sh after_loopunrollandremainder.s

cp after_loopunrollandremainder.s /home/chenqian/esp/esp-idf/components/esp-dsp/modules/fir/fixed/dsps_fird_s16_arp4.S

# opt -passes=dot-cfg debug-man.ll
# dot -Tpng .dsps_fird_s16_ansi.dot -o debug-man.png


# opt -passes=dot-cfg after_loopunrollandremainder.ll
# dot -Tpng .dsps_fird_s16_ansi.dot -o after_loopunrollandremainder.png
