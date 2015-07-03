#!/bin/bash

FONT='-*-gohufont-medium-*-*-*-11-*-*-*-*-*-*-*'
FALLBACK='-*-stlarch-*-*-*-*-10-*-*-*-*-*-*-*'

./bin/bar_mk.sh | lemonbar -p -g 1520x35+200+0 -u 3 \
-f 'Monaco for Powerline-11',${FALLBACK} \
-B${background} -F${foreground} | while read -r line; do
  $line
done

