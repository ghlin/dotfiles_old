# if [[ $TERM == "xterm" ]] {
#   export TERM="xterm-256color"
# }

ZSH=/usr/share/oh-my-zsh/

DISABLE_AUTO_UPDATE="true"

# ZSH_THEME="ghlin"
ZSH_THEME="ghlin"

plugins=(git sudo)
source $ZSH/oh-my-zsh.sh


# enable interactive comments
setopt INTERACTIVE_COMMENTS

# zsh-syntax-highlighting
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="$PATH:$HOME/.local/bin/:$HOME/WineApp/"

alias  update-my-archlinux="yaourt -Syua"
alias  just-update-my-archlinux="yaourt -Syua --noconfirm"
alias  start-httpd="sudo systemctl start httpd"
alias  random-seq="uuidgen| cut -b 1-8"
unalias sl

alias :q="exit"

# grep updated
alias  grep="grep --exclude-dir=.cvs --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn --color=auto"
unset  GREP_OPTIONS

alias  scrot="scrot -e 'mv \$f $HOME/Pictures'"
alias  dt-stamp="date +'%F-%H-%M-%S'"

alias  enable-proxy="source ~/.local/lib/setup-proxy.sh"
alias  git-set-proxy="export GIT_PROXY_COMMAND=/home/ghlin/.local/lib/gitproxy-corkscrew.sh"

export MY_GIT_PROXY_COMMAND="/home/ghlin/.local/lib/gitproxy-corkscrew.sh"

# awesome background
# export AWESOME_BG="/home/ghlin/Workspace/Wallpapers/com.png"
export AWESOME_BG="/home/ghlin/Pictures/ArchLinux/Archlinux.png"
export AWESOME_THEME='vertex'
export AWESOME_WIBOX_POSITION='bottom'
# export AWESOME_USE_TINT2='yes'

#
export SHDIR="/media/shared/data"

# default editor
export EDITOR=vim

# Fontconfig-Infinality
export INFINALITY_FT_FILTER_PARAMS="20 20 30 20 20"
export INFINALITY_FT_CHROMEOS_STYLE_SHARPENING_STRENGTH=50

# color gcc output
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

x11grab-ranged() {
  SIZE_ARGS="$1"
  AUDIO_ARGS="-f alsa -acodec ac3 -ac 2"
  VIDEO_ARGS="-f x11grab -r 30 -s $SIZE_ARGS -i $DISPLAY -c:v libx264 -preset ultrafast -crf 0"
  PREFIX="~/Videos/"
  FILENAME="`date +'x11grab-%F-%H-%M-%S.mkv'`"
  OUTPUT="$PREFIX/$FILENAME"
  FFMPEG_CMD="ffmpeg $AUDIO_ARGS $VIDEO_ARGS $OUTPUT -stats"  # -v error"

  echo "VIDEO ARGS -> $VIDEO_ARGS"
  echo "AUDIO ARGS -> $AUDIO_ARGS"
  echo "OUTPUT     -> $OUTPUT"
  echo "FFMPEG_CMD -> $FFMPEG_CMD"

  eval "$FFMPEG_CMD"
}

x11grab() {
  case $1 in
  -pulseaudio)
    AUDIO_ARGS="-f pulse -i alsa_output.pci-0000_00_14.2.analog-stereo.monitor"
    ;;
  -alsa)
    AUDIO_ARGS="-f alsa -i pulse -acodec ac3 -ac 2"
    ;;
  esac

  VIDEO_ARGS="-f x11grab -r 30 -s 1366x768 -i $DISPLAY -c:v libx264 -preset ultrafast -crf 0"
  PREFIX="~/Videos/"
  FILENAME="`date +'x11grab-%F-%H-%M-%S.mkv'`"
  OUTPUT="$PREFIX/$FILENAME"
  FFMPEG_CMD="ffmpeg $AUDIO_ARGS $VIDEO_ARGS $OUTPUT -stats"  # -v error"

  echo "VIDEO ARGS -> $VIDEO_ARGS"
  echo "AUDIO ARGS -> $AUDIO_ARGS"
  echo "OUTPUT     -> $OUTPUT"
  echo "FFMPEG_CMD -> $FFMPEG_CMD"

  eval "$FFMPEG_CMD"
}

mount-ntfs() {
  if [[ -f /usr/bin/ntfs-3g ]]; then
    sudo ntfs-3g $1 $2
  else
    sudo mount $1 $2 -o iocharset=utf8,umask=000
  fi
}

mount-fat32() {
  sudo mount $1 $2 -o iocharset=utf8,umask=000
}

vundle-update() {
  vim -c "execute \"PluginUpdate\"|q|q"
}

vundle-install() {
  vim -c "execute \"PluginInstall\"|q|q"
}

find-process() {
  ps -aux| grep $*| grep -v grep
}

mcd() {
  mkdir "$1" && cd "$1"
}

ss-stop() {
  sudo systemctl stop   shadowsocks@$1
}

ss-start() {
  sudo systemctl start  shadowsocks@$1
}

ss-switch() {
  ss-stop   $1
  ss-start  $2
}

