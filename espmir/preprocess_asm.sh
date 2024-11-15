#!/bin/bash

# 检查是否提供了文件名
if [ $# -eq 0 ]; then
    echo "请提供要处理的文件名作为参数。"
    exit 1
fi

# 指定的文件名
file="$1"

# 检查文件是否存在
if [ ! -f "$file" ]; then
    echo "文件 $file 不存在。"
    exit 1
fi

# 获取当前时间
current_time=$(date "+%Y-%m-%d %H:%M:%S")

# 在文件开头添加当前时间并加上 #
sed -i "1i# $current_time" "$file"

# 处理文件，添加 # 和替换文本
sed -i -e 's/^\(\s*\)\(\.attribute	5, \)/\1#\2/g' \
       -e 's/^\(\s*\)\(\.option	arch\)/\1#\2/g' \
       -e 's/ansi/arp4/g' "$file"

echo "处理已完成：$file"
