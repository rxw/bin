## Variables

MONITORS=2
HEIGHT=22
WIDTH=1200
TOPSPACE=5
BGCOLOR="#FF353535"
FGCOLOR="#FFcfcfcf"
FONT="-*-lemon-*-*-*-*-10-*-*-*-*-*-*-*"
FALLBACK="-misc-stlarch-medium-r-normal--10-100-75-75-c-80-iso10646-1"
BORDER=4
BORDERCOLOR="#88dfdfdf"

## Logic

BORDERWIDTH=$(( $(( $BORDER * 2 )) + $WIDTH ))
BORDERHEIGHT=$(( $(( $BORDER * 2 )) + $HEIGHT ))
SCREEN=$(( $(xrandr | awk 'NR==1{print $8}') / $MONITORS ))
BORDERPOSX=$(( $(( $SCREEN - $BORDERWIDTH)) / 2 ))
BORDERPOSY=$TOPSPACE
BARPOSX=$(( $BORDERPOSX + $BORDER ))
BARPOSY=$(( $BORDERPOSY + $BORDER ))

## Build it!
border() {
  echo | bar -p -d -g ${BORDERWIDTH}x${BORDERHEIGHT}+${BORDERPOSX}+${BORDERPOSY} -B${BORDERCOLOR} & sleep 0.1
}

main() {
  ./bin/bar_mk.sh | bar -p -g ${WIDTH}x${HEIGHT}+${BARPOSX}+${BARPOSY} -f ${FONT},${FALLBACK} -B${BGCOLOR} -F${FGCOLOR} | while read -r line; do
    $line
  done
}
border 
main
