FONT="Consolas-11"
FALLBACK="Icons-11"
BGCOLOR="#FF37393d"
FGCOLOR="#FFfafafa"

./bin/bar_mk.sh | lemonbar -p -g 1520x32+200+0 -u 3 -f ${FONT},${FALLBACK} -B${BGCOLOR} -F${FGCOLOR} | while read -r line; do
  $line
done

