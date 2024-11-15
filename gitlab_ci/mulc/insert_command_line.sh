#!/bin/bash

# 检查参数个数
if [ $# -ne 2 ]; then
    echo "Usage: $0 <file-name> <pass-name>"
    exit 1
fi

FILE_NAME=$1
PASS_NAME=$2

# 在文件开头插入命令行
sed -i "1i; RUN: opt -S -mtriple=riscv32-esp-unknown-elf -passes=$PASS_NAME -$PASS_NAME=true < %s | FileCheck %s" "$FILE_NAME"
