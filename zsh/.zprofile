
#TODO use blacklist
sudo rmmod pcspkr 2> /dev/null

# auto startx on tty1
if [ $(tty) = '/dev/tty1' ]; then
  # ~/.zshrc contains env settings, source it before startx
  source ~/.zshrc
  startx
fi



