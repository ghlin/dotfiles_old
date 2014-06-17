ZSH=/usr/share/oh-my-zsh/

DISABLE_AUTO_UPDATE="true"

if [ "$TERM" = "xterm" ]; then
  ZSH_THEME="xc-tama"
else
  ZSH_THEME="blinks"
fi

# CASE_SENSITIVE="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_AUTO_TITLE="true"
# DISABLE_CORRECTION="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# just source it, it`s much easyer to clone this configure than copying files
# into /oh-my-zsh/plugins and loading it
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/Projects/bin:$PATH"

alias  gfw-me-not="source ~/lib/cgfw.sh"
alias  update-my-archlinux="yaourt -Syua"
alias  yaourt-Syua="yaourt -Syua"
alias  start-httpd="sudo systemctl start httpd"
alias  random-seq="uuidgen| cut -b 1-8"

alias  scrot="scrot -e 'mv \$f $HOME/Pictures'"

# awesome background
export AWESOME_BG="$HOME/Pictures/wallpaper-719349.jpg"


# default editor (for yaourt)
export EDITOR=vim

# completion
# fpath=(~/.zsh/completion/ $fpath)
# compinit

# Fontconfig-Infinality
export INFINALITY_FT_FILTER_PARAMS="20 20 30 20 20"
export INFINALITY_FT_CONTRAST="60"

# color gcc output
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

