export PATH=/home/chenqian/Workspace/tool/build_esp_clang/llvm/bin:$PATH
clang -O3 -march=rv32imafc_zicsr_zifencei_xesppie -mabi=ilp32f -S -o test.S \
test.c \
--target=riscv32-esp-elf \
-mllvm -enable-esp32-p4-optimize