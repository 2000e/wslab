echo "-- 更新 apt 源"
sed -i 's|http://archive.ubuntu.com|https://mirror.nju.edu.cn|g' /etc/apt/sources.list.d/ubuntu.sources
sed -i 's|http://security.ubuntu.com|https://mirror.nju.edu.cn|g' /etc/apt/sources.list.d/ubuntu.sources
apt update -y && apt upgrade -y
apt install -y zsh unzip htop net-tools language-pack-zh-hans