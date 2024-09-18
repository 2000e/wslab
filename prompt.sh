echo "-- 准备为用户 $WSL_USER 配置 Prompt"
ZSH_HOME=/home/$WSL_USER/.zsh
sudo -u $WSL_USER mkdir $ZSH_HOME
sudo -u $WSL_USER git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions $ZSH_HOME/zsh-autosuggestions
sudo -u $WSL_USER git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_HOME/zsh-syntax-highlighting
sudo -u $WSL_USER git clone --depth 1 https://github.com/romkatv/powerlevel10k  $ZSH_HOME/powerlevel10k
sudo -u $WSL_USER touch /home/$WSL_USER/.alias
sudo -u $WSL_USER cat <<'EOF' > /home/$WSL_USER/.alias
alias s=sudo
alias ls="ls --color"
alias ll="ls -lh"
alias la="ls -a"
alias md="mkdir -p"
alias tou=touch
alias ip="ip -c"
alias cd=z
EOF