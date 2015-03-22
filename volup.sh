amixer set Master 5%+
vol=$(amixer get Master | sed -n 'N;s/^.*\[\([0-9]\+%\).*$/\1/p' | tr -d '%')/4
for w in `seq 0 $((vol))`; do line="${line}x";done
for w in `seq $((vol)) 25`; do line="${line}%{F#FF7777dd}x"; done
sh /home/tato/bin/popitup.sh vol $line
