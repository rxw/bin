amixer set Master 5%-
vol=$(amixer get Master | sed -n 'N;s/^.*\[\([0-9]\+%\).*$/\1/p' | tr -d '%')/4
for w in `seq 0 $((vol))`; do line="${line}%{F#ffcc4141}━";done
line="${line}●%{F}"
for w in `seq $((vol)) 25`; do line="${line}─"; done
sh /home/tato/bin/popitup.sh $line
