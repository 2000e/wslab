apt purge -y cloud-init vim-tiny thunderbird snapd x11-apps libx11-6 libdrm2
apt autoremove --purge -y
apt autoclean -y
apt clean -y
rm -rf /var/lib/apt/lists/*
rm -rf /var/log/*
cd ..
rm -rf /wslab