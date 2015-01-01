#!/bin/bash


echo "SKIPPED"

exit 0

[ -d /etc/fonts/infinality/styles.conf.avail/another ] || sudo mkdir /etc/fonts/infinality/styles.conf.avail/another -v

sudo cp $subconf/*.conf /etc/fonts/infinality/styles.conf.avail/another/ -v

