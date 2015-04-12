#!/bin/sh
# how long should the popup remain?
duration=3

# define geometry
barx=1650
bary=10
barw=233
barh=20

# colors
bar_bg="#ff353535"
bar_fg="#ff858585" # white is default

# font used
bar_font="-*-stlarch-*-*-*-*-*-*-*-*-*-*-*"

# compute all this
baropt="-g ${barw}x${barh}+${barx}+${bary} -B${bar_bg} -F${bar_fg} -f ${bar_font}"
(echo "%{c} $@"; sleep ${duration}) | bar ${baropt}
