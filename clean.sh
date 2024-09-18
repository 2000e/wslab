apt autoremove -y
apt autoclean -y
apt clean -y
rm -rf /var/lib/apt/lists/*
rm -rf /var/log/*
cd ..
rm -rf /wslab