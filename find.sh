#!/bin/bash

# 安全处理包含空格、特殊字符的路径
find . -type l -print0 | while IFS= read -r -d $'\0' link; do
    # 获取链接文件的规范路径（相对路径）
    link_path=$(realpath --relative-to=. "$link")
    
    # 输出链接文件本身的位置（谁指向目标）
    echo "链接文件位置: $link_path"
    
    # # 可选：显示链接指向的目标
    # target=$(readlink -f "$link")
    # echo "  指向目标: $target"
done
