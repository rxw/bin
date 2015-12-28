#!/bin/bash

font="*-proggycleancp-medium-*-*-*-13-*-*-*-*-*-*-*"
f=$(cat /home/$USER/.colors | grep FORE | awk '{print $2}')
b=$(cat /home/$USER/.colors | grep BACK | awk '{print $2}')
n=$(cat /home/$USER/.colors | grep NEUT | awk '{print $2}')

sh ~/bin/bar_mk.sh $n | bar -p -g 1920x30+0+0 -u 3 \
-f $font  \
-B $b -F $f
