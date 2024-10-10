#!/bin/bash

file_path="$HOME/Download/Miniconda3-latest-Linux-x86_64.sh"
download_link="https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh"
conda_init_script="$HOME/conda/condabin/conda"
condarc_path="$HOME/.condarc"

# 判断文件是否存在，存在则删除
if [ -f "$file_path" ]; then
    rm "$file_path"
    echo "已删除旧文件 $file_path"
fi

# 下载文件
wget "$download_link" -P $HOME/Download

# 检查下载是否成功
if [ $? -eq 0 ]; then
    echo "文件下载成功"
    sh $HOME/Download/Miniconda3-latest-Linux-x86_64.sh -b -u -p $HOME/conda

    # 判断是否存在 conda init 脚本并执行
    if [ -f "$conda_init_script" ]; then
        echo "执行 conda init zsh/bash"
        $conda_init_script init zsh
	$conda_init_script init bash
        # 创建并写入.condarc文件
        cat <<EOT >> $condarc_path
channels:
  - defaults
show_channel_urls: true
default_channels:
  - https://mirror.nju.edu.cn/anaconda/pkgs/main
  - https://mirror.nju.edu.cn/anaconda/pkgs/r
  - https://mirror.nju.edu.cn/anaconda/pkgs/msys2
custom_channels:
  conda-forge: https://mirror.nju.edu.cn/anaconda/cloud
  pytorch: https://mirror.nju.edu.cn/anaconda/cloud
EOT
        echo ".condarc 文件创建成功"
    else
        echo "未找到 conda init 脚本"
    fi
else
    echo "文件下载失败，请检查网络连接或下载链接"
fi


