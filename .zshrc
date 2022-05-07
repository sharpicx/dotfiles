# If you come from bash you might have to change your $PATH.

# default path
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:/bin:/opt/google/chrome:$HOME/.local/share/gem/ruby/3.0.0/bin:/usr/lib/jvm/java-17-openjdk:/usr/lib/jvm/java-17-openjdk/bin:$HOME/random-stuff/pribadi:/var/lib/snapd/snap/bin:/home/via/.cargo/bin:$PATH

# Java path
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk/bin

# ENVIRONMENT
# custom variable sets.
LOCAL_HOST=$(ip add show wlan0 | tail +3 | head -1 | cut -f6 -d " " | awk '{print substr( $0, 1, length($0)-3)}')
HTB_HOST=$(ip add show tun0 2>&1 | tail +3 | head -1 | cut -f6 -d " " | awk '{print substr( $0, 1, length($0)-3)}') # htb ip address
CUSTOM_HOST=$(ip add show vboxnet0 2>&1 | tail +3 | head -1 | cut -f6 -d " " | awk '{print substr( $0, 1, length($0)-3)}') # biar ga repot aja sih while playing custom virtual machines.
LPORT=4999

# Path to your oh-my-zsh installation.
export ZSH="/home/via/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="mira"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git archlinux)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Example aliases
alias ls="colorls"
alias zshrc="nvim ~/.zshrc"
alias vimrc="nvim ~/.vimrc"
alias nvimrc="vim ~/.config/nvim/init.lua"
alias edit="nvim"

# system
alias sys-search="pacman -Ss"
alias sys-installed="pacman -Ss $1 | grep installed | sort"
alias search-group="pacman -Sgg"

# custom
alias hotkeys="$HOME/hotkeys" # suckly this command created when i didnt know about linux at all.
alias cboard="xclip -sel clipboard"
# customization
alias dmp3="youtube-dl --extract-audio --audio-format mp3 -o '%(title)s.%(ext)s' -i $1 --add-header 'Accept-Encoding: identity;q=1, *;q=0'"
alias dplist="youtube-dl --extract-audio --audio-format mp3 -o '%(title)s.%(ext)s' -i"

alias htbIp="ip address | grep tun0 | grep inet | cut -f 6 -d ' '"

alias tmux="tmux -f ~/.tmux.conf"

# translation, because i'm not a native speaker.
alias translate-en="translate -s en -t id $1"
alias translate-id="translate -s id -t en $1"
alias trans-en="trans en:id $1"
alias trans-id="trans id:en $1" 

# alias osint-lists=""
# alias ohmyzsh="mate ~/.oh-my-zsh"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(dirname $(gem which colorls))/tab_complete.sh
