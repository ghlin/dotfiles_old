#!/bin/bash

panic() {
  echo "$*"
  exit 1
}

user_dir="$HOME"

dotfile_dir="$user_dir/.config/dotfiles-`uuidgen`"
echo "use dotfiledir -> $dotfile_dir"

[ -d $user_dir/.config ] || mkdir $user_dir/.config -pv
[ -d $dotfile_dir      ] && panic "WTF! $dotfile_dir already existed!"

cp . $dotfile_dir -rf

cd $dotfile_dir
echo "Entering $dotfile_dir"

for prog in `ls`; do
  if [ -d $prog ]
  then
    echo " +- at $prog"
    if [ -f "$prog/install.sh" ]
    then
      echo "  - found install script"
      export subconf=$prog
      $prog/install.sh
      unset $subconf
    else
      echo "  - applying for $prog"

      for f in `ls $prog`; do
        echo "  - ln $f -> $user_dir/.$f"
        ln `realpath $prog/$f` $user_dir/.$f -s || panic "  * error occured when ln $prog/$f into $user_dir/.$f";
      done
    fi
  fi
done


