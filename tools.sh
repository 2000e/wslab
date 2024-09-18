echo "-- fastfetch 安装"
wget -O fastfetch.deb https://github.com/fastfetch-cli/fastfetch/releases/download/2.24.0/fastfetch-linux-amd64.deb
apt install  -y ./fastfetch.deb

fastfetch

echo "-- zoxide 安装"
wget -O zoxide.deb https://github.com/ajeetdsouza/zoxide/releases/download/v0.9.5/zoxide_0.9.5-1_amd64.deb
apt install -y ./zoxide.deb