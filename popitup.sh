#!/bin/sh
# how long should the popup remain?
duration=3

# define geometry
barx=1168
bary=8
barw=170
barh=16

# colors
bar_bg="#fffffFFF"
bar_fg="#ff151515" # white is default

# font used
bar_font="-*-lemon-*-*-*-10-*-*-*-*-*-*-*"

# compute all this
baropt="-g ${barw}x${barh}+${barx}+${bary} -B${bar_bg} -F${bar_fg} -f ${bar_font}"
sh /home/tato/bin/killem.sh
(echo " $@"; sleep ${duration}) | bar ${baropt}
