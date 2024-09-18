cat <<'EOF' > /etc/wsl.conf
[user]
default = root

[network]
hostname = ubuntu

[interop]
appendWindowsPath = false

[boot]
systemd = true

EOF

sed -i "s/root/$WSL_USER/g" /etc/wsl.conf
echo "-- 配置 wsl.conf"