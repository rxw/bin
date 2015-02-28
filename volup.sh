amixer set Master 5%+
vol=$(amixer get Master | sed -n 'N;s/^.*\[\([0-9]\+%\).*$/\1/p' | tr -d '%')/2
for w in `seq 0 $((vol))`; do line="${line}x";done
for w in `seq $((vol)) 50`; do line="${line}%{F#FF888888}x"; done
popitup.sh vol $line
