<<<<<<< HEAD
FONT='-*-gohufont-medium-*-*-*-11-*-*-*-*-*-*-*'
FALLBACK='-*-stlarch-medium-*-*-*-10-*-*-*-*-*-*-*'
BGCOLOR="#FF1f1f1f"
FGCOLOR="#FFcacaca"

./bin/bar_mk.sh | bar -p -g 1520x25+200+0 -u 3 \
-f ${FONT},${FALLBACK} \
-B${BGCOLOR} -F${FGCOLOR} | while read -r line; do
=======
FONT="Monaco for Powerline-9"
FALLBACK="FontAwesome-11"
BGCOLOR="#FF1f1f1f"
FGCOLOR="#FFcacaca"

./bin/bar_mk.sh | lemonbar -p -g 1520x22+200+0 -f 'Monaco for Powerline-9','FontAwesome-11' -B${BGCOLOR} -F${FGCOLOR} | while read -r line; do
>>>>>>> 5fcad8631dc28222ea4afdd4b624b35531d9519e
  $line
done

