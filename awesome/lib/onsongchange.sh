#!/bin/sh

file=$(basename "$3")

echo "require 'lib.widgets' ['mocp_on_song_change'] ([[$1]], [[$2]], [[$file]])" | awesome-client


