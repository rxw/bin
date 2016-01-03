BGCOLOR="#FF1f1f1f"
FGCOLOR="#FFcacaca"

./bin/bar_mk.sh | bar -p -g 1520x20+200+0 -f '-*-tewi-medium-*-*-*-11-*-*-*-*-*-*-*','-*-stlarch-medium-*-*-*-10-*-*-*-*-*-*-*' -B${BGCOLOR} -F${FGCOLOR} | while read -r line; do
  $line
done

