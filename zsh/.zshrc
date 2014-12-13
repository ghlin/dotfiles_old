ZSH=/usr/share/oh-my-zsh/

DISABLE_AUTO_UPDATE="true"

# ZSH_THEME="re5et"
ZSH_THEME="gotcha"
# ZSH_THEME="powerline"

plugins=(git sudo)
source $ZSH/oh-my-zsh.sh

# enable interactive comments
setopt INTERACTIVE_COMMENTS

# just source it, it`s much simple than to copy files
# into ZSH_PLUGIN_DIR and add it to plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="$PATH:$HOME/.local/bin/"

alias  gfw-me-not="source ~/.local/lib/cgfw.sh"
alias  update-my-archlinux="yaourt -Syua"
alias  just-update-my-archlinux="yaourt -Syua --noconfirm"
alias  yaourt-Syua="yaourt -Syua"
alias  start-httpd="sudo systemctl start httpd"
alias  random-seq="uuidgen| cut -b 1-8"

alias  scrot="scrot -e 'mv \$f $HOME/Pictures'"
alias  mkdtdir="mkdir $(date +'%F-%H-%M-%S')"

alias  restartgoagent="sudo systemctl restart goagent"
alias  watchgoagent="watch systemctl status goagent -l"

# awesome background
#
export AWESOME_BG="/home/ghlin/Pictures/youcannotredo-red.png"
export AWESOME_THEME='vertex'

# default editor
export EDITOR=vim

# Fontconfig-Infinality
export INFINALITY_FT_FILTER_PARAMS="20 20 30 20 20"
export INFINALITY_FT_CHROMEOS_STYLE_SHARPENING_STRENGTH=50
# export INFINALITY_FT_CONTRAST="30"

# color gcc output
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

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



