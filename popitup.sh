#!/bin/sh
# how long should the popup remain?
duration=3

# define geometry
barx=1100
bary=17
barw=243
barh=16

# colors
bar_bg="#ff353535"
bar_fg="#ff858585" # white is default

# font used
bar_font="-*-unifont-*-*-*-*-*-*-*-*-*-*-*"

# compute all this
baropt="-g ${barw}x${barh}+${barx}+${bary} -B${bar_bg} -F${bar_fg} -f ${bar_font}"
(echo " $@"; sleep ${duration}) | bar ${baropt}
