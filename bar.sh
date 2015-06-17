FONT="Monaco for Powerline-9"
FALLBACK="FontAwesome-11"
BGCOLOR="#FF1f1f1f"
FGCOLOR="#FFcacaca"

./bin/bar_mk.sh | lemonbar -p -g 1520x22+200+0 -f 'Monaco for Powerline-9','FontAwesome-11' -B${BGCOLOR} -F${FGCOLOR} | while read -r line; do
  $line
done

