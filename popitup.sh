#!/bin/sh
# how long should the popup remain?
duration=3
f=$(cat /home/$USER/.colors | grep FORE | awk '{print $2}')
b=$(cat /home/$USER/.colors | grep BACK | awk '{print $2}')

# define geometryt
chars=$1
totw=${#chars}
w=$(echo ${totw}*9.7 | bc)
h=40
x=$(echo 1870-$w | bc)
y=40

(echo "%{l} $@"; sleep ${duration}) | lemonbar -g ${w}x${h}+${x}+${y} -B${b} -F${f} -f 'Monaco for Powerline-11'
