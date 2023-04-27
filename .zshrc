# written by sharpicx
export TERM='xterm-256color'
export HISTFILE=~/.zsh_history
export EDITOR='nvim'
export TERMINAL='kitty'
export BROWSER='google-chrome-stable'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# default path
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:/bin:/opt/google/chrome:$HOME/.local/share/gem/ruby/3.0.0/bin:/usr/lib/jvm/java-17-openjdk:/usr/lib/jvm/java-17-openjdk/bin:$HOME/random-stuff/pribadi:/var/lib/snapd/snap/bin:/home/via/.cargo/bin:$PATH:/home/via/go/bin
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk/bin
export _JAVA_AWT_WM_NONREPARENTING=1

# ENVIRONMENT
LOCAL_HOST=$(ip add show wlan0 | tail +3 | head -1 | cut -f6 -d " " | awk '{print substr( $0, 1, length($0)-3)}')
HTB_HOST=$(ip add show tun0 2>&1 | tail +3 | head -1 | cut -f6 -d " " | awk '{print substr( $0, 1, length($0)-3)}') # htb ip address
CUSTOM_HOST=$(ip add show vboxnet0 2>&1 | tail +3 | head -1 | cut -f6 -d " " | awk '{print substr( $0, 1, length($0)-3)}') # biar ga repot aja sih while playing custom virtual machines.
LOGIN=$(nmcli device show wlan0 | grep IP4.GATEWAY | awk -F: '{ print $2 }' | sed -E 's/[[:blank:]]//g')
LPORT=4444

export ZSH="/home/via/.oh-my-zsh"
ZSH_THEME="mira"
ENABLE_CORRECTION="true"
plugins=(git archlinux)
source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8

# custom functions
alias liatin="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
help() {
  "$1" --help 2>&1 | bat -plhelp
}
cheat() {
  if [ $# -lt 1 ]; then 
    echo 'error, a argument is missing.'
  else 
    curl -s "cheat.sh/$1" | bat
  fi
}
cari-format() {
  find $1 -type f -name "*.$2" | liatin
}
cari-file() {
  find $1 -type f -name "*$2*" | liatin
}
mulai() {
  if ! tmux ls | cut -d ':' -f1 | grep SHARPICX-0 1>/dev/null; then 
    echo "starting..." 
    tmux new-session -t SHARPICX
  else 
    echo "starting the previous one"
    tmux attach-session
  fi
}
fixit() {
  mv ~/.zsh_history ~/.zsh_history_bad 
  strings -eS ~/.zsh_history_bad > ~/.zsh_history 
  fc -R ~/.zsh_history
  rm ~/.zsh_history_bad
}

# general aliases
alias nf="neofetch --color_blocks on"
alias cari="fzf"
alias hotkey="kitty +kitten show_key"
alias pac="sudo pacman"
alias cat="bat --plain"
alias ls="exa"
alias zshrc="nvim ~/.zshrc"
alias vimrc="nvim ~/.vimrc"
alias nvimrc="vim ~/.config/nvim/init.lua"
alias vpn1="sudo hide.me connect free-unlimited.hideservers.net -t '/etc/hide.me/accessToken.txt'"


# system
alias sys-search="pacman -Ss $1"
alias list-paket="LC_ALL=C pacman -Qi | awk '/^Name/{name=\$3} /^Installed Size/{print \$4\$5, name}' | sort -h | bat"
alias search-group="pacman -Sgg $1"

# custom
alias cboard="xclip -sel clipboard"

alias reload="tmux -f ~/.tmux.conf"

# translation, because i'm not a native speaker.
alias ento="trans en:id"
alias idto="trans id:en" 

# alias osint-lists=""
# alias ohmyzsh="mate ~/.oh-my-zsh"
export _JAVA_AWT_WM_NONREPARENTING=1

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source "$HOME/.cargo/env"
