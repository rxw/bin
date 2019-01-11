#!/bin/bash

font="*-proggycleancp-medium-*-*-*-13-*-*-*-*-*-*-*"
fbfont="*-stlarch-medium-*-*-*-10-*-*-*-*-*-*-*"

colorea() {
  cl=$(xrdb -query colors | grep color${1})
  clfixed=$(echo ${cl} | awk '{print $2}' | tr -d '#')
  echo "#ff${clfixed}"
}

sleep .3

b="#ff151515" #$(colorea 0)
n=$(colorea 7)
f=$(colorea 14)

bash ~/bin/bar_mk.sh $n | lemonbar -p -g 1920x30+0+0 -u 3 \
-f $font  \
-B $b -F $f
