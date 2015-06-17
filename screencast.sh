M=2 # Slop border width

REC=$(slop -t 0 -b $M -c 1,1,1,1 -f "%w %h %x %y" --nokeyboard)
w=$(echo $REC | awk '{print $1}')
h=$(echo $REC | awk '{print $2}')
x=$(echo $REC | awk '{print $3}')
y=$(echo $REC | awk '{print $4}')

urxvt -e ffmpeg -video_size ${w}x${h} -framerate 25 -f x11grab -i :0.0+${x},${y} /tmp/screencast.mp4
