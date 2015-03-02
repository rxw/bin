#!/bin/sh

# how long should the popup remain?
duration=3

# define geometry
barx=10
bary=10
barw=290
barh=20

# colors
bar_bg="#ff151515"
bar_fg="#ffffffff" # white is default

# font used
bar_font="-*-lemon-*-*-*-10-*-*-*-*-*-*-*"

# compute all this
baropt="-g ${barw}x${barh}+${barx}+${bary} -B${bar_bg} -f ${bar_font}"
(echo " $@"; sleep ${duration}) | bar ${baropt}
