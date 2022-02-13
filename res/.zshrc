export PATH=.:.bin:$HOME/.local/bin:/data/data/com.termux/files/usr/google-cloud-sdk/bin:$PATH
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"
plugins=(git)
source $ZSH/oh-my-zsh.sh
alias l='ls -lh'
alias ll='ls -l'
alias la='ls -lah'
alias ld='ls -lhd'
alias p='pwd'
alias u='cd /data/data/com.termux/files/usr'
alias h='cd /data/data/com.termux/files/home'
alias :q='exit'
alias grep='grep --color=auto'
alias open='termux-open'
alias lc='lolcat'
alias xx='chmod +x'
alias rel='termux-reload-settings'
source ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_THEME="agnoster"
export ROOT="${PREFIX:0:27}"
export USR=$ROOT/usr
export BIN=$ROOT/usr/bin
export ZSH_DISABLE_COMPFIX=true
source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
alias chcolor='/data/data/com.termux/files/home/.termux/colors.sh'
alias chfont='/data/data/com.termux/files/home/.termux/fonts.sh'
alias gcc='clang'
alias cls='clear'
alias gcsh="gcloud cloud-shell ssh"
alias catn="cat --number"
alias ssl=openssl
figlet "Termux"
fortune
DISPLAY=:1
