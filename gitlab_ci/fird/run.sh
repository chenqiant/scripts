

export PATH=/home/chenqian/Workspace/tool/build_esp_clang/llvm/bin:$PATH
clang  -O2 -march=rv32imafc_zicsr_zifencei_xesppie -mabi=ilp32f -emit-llvm -S -o dsps_fird_f32_ansi.ll \
dsps_fird_f32_ansi.c \
--target=riscv32-esp-elf \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/fir/include \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include_sim \
-I/usr/include \
-I/usr/include/x86_64-linux-gnu \
-I/home/chenqian/esp/esp-idf/components/esp-dsp/modules/common/include/

# 提取函数
opt -S -filter-print-funcs=dsps_fird_f32_ansi dsps_fird_f32_ansi.ll -o extracted_function.ll

chmod +x clean_metadata_funcattr.sh
./clean_metadata_funcattr.sh extracted_function.ll after_clean_metadata_funcattr.ll
sed -i '1i %struct.fir_f32_s = type { ptr, ptr, i32, i32, i32, i16 }'  after_clean_metadata_funcattr.ll

chmod +x insert_command_line.sh
./insert_command_line.sh after_clean_metadata_funcattr.ll riscv-split-loop-by-length
/home/chenqian/Workspace/llvm-project/llvm/utils/update_test_checks.py after_clean_metadata_funcattr.ll
opt -filter-print-funcs=dsps_fird_f32_ansi -mtriple=riscv32-esp-unknown-elf -passes=riscv-split-loop-by-length -riscv-split-loop-by-length=true after_clean_metadata_funcattr.ll  -S -o after_splitloopbylength.ll
sed -i '1i %struct.fir_f32_s = type { ptr, ptr, i32, i32, i32, i16 }'  after_splitloopbylength.ll


./insert_command_line.sh after_splitloopbylength.ll riscv-custom-licm
/home/chenqian/Workspace/llvm-project/llvm/utils/update_test_checks.py after_splitloopbylength.ll
opt -filter-print-funcs=dsps_fird_f32_ansi -mtriple=riscv32-esp-unknown-elf -passes=riscv-custom-licm -riscv-custom-licm=true after_splitloopbylength.ll  -S -o after_customlicm.ll
sed -i '1i %struct.fir_f32_s = type { ptr, ptr, i32, i32, i32, i16 }'  after_customlicm.ll


./insert_command_line.sh after_customlicm.ll riscv-loop-unroll-and-remainder
/home/chenqian/Workspace/llvm-project/llvm/utils/update_test_checks.py after_customlicm.ll
opt -mtriple=riscv32-esp-unknown-elf -passes=riscv-loop-unroll-and-remainder -riscv-loop-unroll-and-remainder=true after_customlicm.ll  -S -o after_loopunrollandremainder.ll

llc --mcpu=esp32p4 --mtriple=riscv32-esp-unknown-elf after_loopunrollandremainder.ll -O3 -filetype=asm -o after_loopunrollandremainder.s


