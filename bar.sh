FONT="xft:Monaco for Powerline:style=Regular:size=10"
FALLBACK="-*-stlarch-medium-*-*-*-10-*-*-*-*-*-*-*"
BGCOLOR="#FF1f1f1f"
FGCOLOR="#FFcacaca"

./bin/bar_mk.sh | lemonbar -p -g 1520x30+200+0 -u 3 -f 'Monaco for Powerline-10',${FALLBACK} -B${BGCOLOR} -F${FGCOLOR} | while read -r line; do
  $line
done

