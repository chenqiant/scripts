#!/bin/bash

for file in *.ll; do
    /home/chenqian/Workspace/llvm-project/llvm/utils/update_test_checks.py "$file"
done