#!/bin/bash

# 检查输入参数
if [ $# -ne 2 ]; then
    echo "用法: $0 <输入文件> <输出文件>"
    exit 1
fi

input_file=$1
output_file=$2

# 使用sed命令处理文件
sed -E '
    # 删除 #0 标记
    s/\s+#[0-9]+//g
    
    # 删除 !tbaa !4 类型的标记
    s/,\s*!tbaa\s+![0-9]+//g
    
    # 删除 !llvm.loop !8 类型的标记
    s/,\s*!llvm\.loop\s+![0-9]+//g
' "$input_file" > "$output_file"
sed -i '1i %struct.fir_f32_s = type { ptr, ptr, i32, i32, i32, i16 }' "$output_file"

echo "处理完成！输出文件：$output_file"