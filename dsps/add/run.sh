# rm -rf *.ll *.s
export PATH=/home/chenqian/Workspace/tool/build_esp_clang/llvm/bin:$PATH
#-mllvm -opt-bisect-limit=0
clang  -O3 -march=rv32imafc_zicsr_zifencei_xesppie -mabi=ilp32f -emit-llvm -S -o dsps_add_f32_ansi.ll \
dsps_add_f32_ansi.c \
--target=riscv32-esp-elf \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/math/add/include/ \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include_sim \
-I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include/ \
-I /home/chenqian/esp/esp-idf/components/esp_common/include/ \
-I /usr/include/ \
-I /usr/include/x86_64-linux-gnu/ \
-I /home/chenqian/esp/esp-idf/components/nvs_flash/test_nvs_host/ \

# clang -O3 -march=rv32imafc_zicsr_zifencei_xesppie -mabi=ilp32f -emit-llvm -S -o dsps_add_f32_best.ll \
# dsps_add_f32_best.c \
# --target=riscv32-esp-elf \
# -I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/math/add/include/ \
# -I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include_sim \
# -I /home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include/ \
# -I /home/chenqian/esp/esp-idf/components/esp_common/include/ \
# -I /usr/include/ \
# -I /usr/include/x86_64-linux-gnu/ \
# -I /home/chenqian/esp/esp-idf/components/nvs_flash/test_nvs_host/ \

# llc --mcpu=esp32p4 --mtriple=riscv32 dsps_add_f32_best.ll -O3 -filetype=asm -o dsps_add_f32_best.s
# ../preprocess_asm.sh dsps_add_f32_best.s
# cp dsps_add_f32_best.s /home/chenqian/esp/esp-idf/components/esp-dsp/modules/math/add/float/dsps_add_f32_arp4.S


# opt -S -strip-named-metadata -filter-print-funcs=dsps_add_f32_ansi dsps_add_f32_ansi.ll -o extracted_function.ll
# opt -O3 -enable-esp32-p4-optimize dsps_add_f32_ansi.ll -S -o after_esp32_p4_optimize.ll

opt  -passes=riscv-split-loop-by-length -riscv-split-loop-by-length=true dsps_add_f32_ansi.ll  -S -o after_splitloopbylength.ll


opt  after_splitloopbylength.ll -mtriple=riscv32-esp-unknown-elf -passes=riscv-custom-licm -riscv-custom-licm=true -S -o after_customlicm.ll

opt  after_customlicm.ll -mtriple=riscv32-esp-unknown-elf -passes=riscv-loop-unroll-and-remainder -riscv-loop-unroll-and-remainder=true  -S -o after_loopunrollandremainder.ll

llc --enable-esp32-p4-optimize --mcpu=esp32p4 --mtriple=riscv32  after_loopunrollandremainder.ll -O3 -filetype=asm -o after_loopunrollandremainder.s

llc --mcpu=esp32p4 --mtriple=riscv32 --enable-esp32-p4-optimize after_loopunrollandremainder.ll \
    -O3 -stop-before=riscv-enable-esp-opt -o before_esp_accel.mir

# llc --mcpu=esp32p4 --mtriple=riscv32 --enable-esp32-p4-optimize before_esp_accel.mir -O3 -filetype=asm -o before_esp_accel.s
../preprocess_asm.sh after_loopunrollandremainder.s
cp after_loopunrollandremainder.s /home/chenqian/esp/esp-idf/components/esp-dsp/modules/math/add/float/dsps_add_f32_arp4.S
