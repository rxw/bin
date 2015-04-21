FONT="-*-lemon-medium-*-*-*-10-*-*-*-*-*-*-*"
FALLBACK="-*-stlarch-medium-*-*-*-10-*-*-*-*-*-*-*"
BGCOLOR="#FF1f1f1f"
FGCOLOR="#FFcacaca"

./bin/bar_mk.sh | lemonbar -p -g 1520x30+200+0 -u 3 -f ${FONT},${FALLBACK} -B${BGCOLOR} -F${FGCOLOR} | while read -r line; do
  $line
done

