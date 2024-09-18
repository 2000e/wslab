useradd -m -s /bin/zsh -G sudo -p $(openssl passwd -1 $WSL_PASSWD) $WSL_USER
sudo -u $WSL_USER touch /home/$WSL_USER/.zshrc
sudo -u $WSL_USER cat <<'EOF' > /home/$WSL_USER/.zshrc
# Keep 1000 lines of history within the shell and save it to ~/.zsh_history
setopt histignorealldups sharehistory
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

# ZSH Import
if [ -d "$HOME/.zsh" ] ; then
    source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
    source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme
    source ~/.zsh/powerlevel10l/config/p10k-robbyrussell.zsh
fi

# Prompt Optimize
eval "$(zoxide init zsh)"

# Win Host
WIN_HOST=`/bin/ip r|head -n1|cut -d' ' -f3`

# Proxy Switch
# 添加防火墙规则，管理员打开Powershell执行
# New-NetFirewallRule -DisplayName "WSL" -Direction Inbound  -InterfaceAlias "vEthernet (WSL)"  -Action Allow
# 有可能接口名为 "vEthernet (WSL (Hyper-V firewall))"
export no_proxy=localhost,172.0.0.0,192.168.0.0,
function setproxy() {
    local  port=${1:-7890}   # 更改端口为您的代理软件监听端口，Clash For Windows默认7890
    export http_proxy=http://$WIN_HOST:$port && export https_proxy=$http_proxy
    echo   "You've set the proxy success! Info: $http_proxy"
}
function unsetproxy() {
    unset  http_proxy && unset  https_proxy
    echo   "You've unset the proxy success!"
}
# GUI for GWSL
if [[ -z $DISPLAY ]] ; then
    export DISPLAY=$WIN_HOST:0.0
    export PULSE_SERVER=$WIN_HOST:4713
fi

# Alias
if [ -f "$HOME/.alias" ] ; then
    source $HOME/.alias
fi
alias open="/mnt/c/Windows/explorer.exe"

EOF