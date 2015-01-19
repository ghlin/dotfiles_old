#!/bin/bash

panic() {
  echo "$*"
  exit 1
}

#init
dtstamp() {
  date +'%F-%H-%M-%S'
}


backup_existed() {
  local file=$1
  local dir=$(dirname $file)

  echo "  -*** :: - backuping : $1 -> $BACKUP_DIR/$dir/$file"
  mkdir $BACKUP_DIR/$dir -p
  mv $file $BACKUP_DIR/$dir/
}

restore_config() {
  local unit=$1
  if [ -d $DF_DIR/$unit ]
  then
    echo "  - for unit $unit"

    if [ -x "$DF_DIR/$unit/restore.sh" ]
    then
      echo "  -*** found restore.sh!"
      export DF_CURRENT=$unit
      $DF_DIR/$unit/restore.sh
      unset DF_CURRENT
    else
      echo "  -*** applying $unit"
      echo "  -*** target : $TARGET_DIR"

      for f in $(ls $DF_DIR/$unit -A); do
        echo "  -*** ::restore file $f"
        link_config_file "$unit" "$f"
      done
    fi
  fi
}

link_config_file() {
  local unit=$1
  local file=$f

  if [ -e "$TARGET_DIR/$f" ]
  then
    echo "  -*** :: - found old version of $unit::$file, make backup..."
    backup_existed "$TARGET_DIR/$f"
  fi

  ln $DF_DIR/$unit/$f $TARGET_DIR -sf
}



TARGET_DIR="/home/$USER"
DF_DIR="/home/$USER/.config/dotfiles"
BACKUP_DIR="$DF_DIR.backups-$(dtstamp)"


mkdir $BACKUP_DIR -pv
cd $DF_DIR

echo "[enter] $DF_DIR"
echo "TARGET_DIR: $TARGET_DIR"
echo "DF_DIR:     $DF_DIR"
echo "BACKUP_DIR: $BACKUP_DIR"

for unit in $(ls); do
  restore_config $unit
done



