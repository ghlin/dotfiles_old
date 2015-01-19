sudo rmmod pcspkr 2> /dev/null

unset GREP_OPTIONS

if [ $(tty) = '/dev/tty1' ]; then
  echo 'TTY1 detected. startx'
  source ~/.zshrc
  startx
fi



