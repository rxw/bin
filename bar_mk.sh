#!/bin/sh
#
# z3bra - (c) wtfpl 2014
# Fetch infos on your computer, and print them to stdout every second.
### Vars
NEUTRAL=$1
### Functions

clock() {
  hour=$(date '+%I:%M')
  echo " $hour"
}

volume() {
  vol=$(amixer get Master | sed -n 'N;s/^.*\[\([0-9]\+%\).*$/\1/p' | tr -d %)
  rvol=$(( vol / 5 ))
  nvol=$(( 20 - rvol ))
  disp=""
  for((i=0; i < rvol; i++))
  do
    disp="${disp}%{F#FFffFFff}─%{F-}"
  done
  disp="${disp}»"
  for((i=0; i < nvol; i++))
  do
    disp="${disp}%{F#ff7f7f7f}─%{F-}"
  done
  echo "%{F${NEUTRAL}}vol%{F-} $disp"
}

#$cpuload() {
#$    LINE=`ps -eo pcpu |grep -vE '^\s*(0.0|%CPU)' |sed -n '1h;$!H;$g;s/\n/ +/gp'`
#$    bc <<< $LINE
#}

#memused() {
#    read t f <<< `grep -E 'Mem(Total|Free)' /proc/meminfo |awk '{print $2}'`
#    bc <<< "scale=2; 100 - $f / $t * 100" | cut -d. -f1
#}


#wifi() {
#  initial=$(iwconfig | grep -o '[0-9]\{2\}/70')
#  percentage=$(echo ${initial}*100 | bc -l)
#  strength=$( echo ${percentage}/1 | bc)
#  name=$(iwconfig | egrep -o '".*"' | tr -d \")
#  echo "%{F${NEUTRAL}}wifi%{F-} ${name} ${strength}%%"
#}

groups() {
  cur=`xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}'`
  echo "%{F${NEUTRAL}}DSKTP%{F-} $cur"
}

nowplaying() {
    cur=`mpc current`
    echo "%{F${NEUTRAL}}playing%{F-} $cur"
}

battery() {
  BATN=$(ls /sys/class/power_supply/ | grep BAT)
  test -z "$BATN" && exit 1
  BATC=/sys/class/power_supply/$BATN/capacity
  BATS=/sys/class/power_supply/$BATN/status

  # prepend percentage with a '+' if charging, '-' otherwise
  test "`cat $BATS`" = "Charging" && echo -n "%{F${NEUTRAL}}chrgng%{F-} " \
    || echo -n "%{F${NEUTRAL}}bat%{F-} "
  # print out the content
  sed -n p $BATC
}

#windows() {
#  wnd_focus=$(xdotool getwindowfocus)
#  
#  if [[ "$wnd_focus" != "" ]]; then 
#      wnd_title=$(xdotool getwindowname $wnd_focus )
#      echo "| $wnd_title |"
#  fi
#}

# This loop will fill a buffer with our infos, and output it to stdout.
while :; do
    buf=""
   # buf="%{l} $(groups) "
    buf="%{l}${buf} $(volume) "
   # buf="${buf} network: $(network) | "
   # buf="${buf} CPU: $(cpuload)%% -"
   # buf="${buf} RAM: $(memused)%% -"
   # buf="${buf} %{c}$(windows)"
   # buf="${buf} %{r} %{B#FFfafafa}%{F#FF37393d} $(volume)  "
    buf="${buf} %{r} $(nowplaying) "
    buf="${buf}  $(battery)%% "
    buf="${buf}  $(clock) "
    buf="${buf}  %{r} %{B-}%{F-}"

    echo $buf
    # use `nowplaying scroll` to get a scrolling output!
    sleep 0.1 # The HUD will be updated every second
done
