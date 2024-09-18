#!/bin/sh
WSL_USER=wsl
WSL_PASSWD=123


export DEBIAN_FRONTEND=noninteractive

# Proxy
export http_proxy=http://`/bin/ip route | head -n1 | cut -d' ' -f3`:7890
export https_proxy=$http_proxy
echo "-- Proxy Info: $http_proxy"
echo "-- 执行 wsl init.sh"

. ./apt.sh
. ./wsl.conf.sh
. ./user.sh
. ./prompt.sh
. ./tools.sh
. ./clean.sh

echo "-- 构建结束"
exit