FONT="-*-lemon-*-*-*-*-10-*-*-*-*-*-*-*"
FALLBACK="-*-stlarch-*-*-*-*-10-*-*-*-*-*-*-*"
BGCOLOR="#FF37393d"
FGCOLOR="#FFfafafa"

./bin/bar_mk.sh | bar -p -g 1520x32+200+0 -u 3 -f ${FONT},${FALLBACK} -B${BGCOLOR} -F${FGCOLOR} | while read -r line; do
  $line
done

