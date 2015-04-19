#!/bin/sh
#
# z3bra - (c) wtfpl 2014
# Fetch infos on your computer, and print them to stdout every second.
#### Vars
RED=#FFff9595

grpfg='%{F#ffFFFCB1}%{F-}'
grpmg='%{F#ff2288cc}%{F-}'
grpbg='%{F#ffbbbbbb} '

### Functions

clock() {
  hour=$(date '+%I:%M')
  echo " $hour"
}

volume() {
  vol=$(amixer get Master | sed -n 'N;s/^.*\[\([0-9]\+%\).*$/\1/p')
  echo " $vol"
}

#$cpuload() {
#$    LINE=`ps -eo pcpu |grep -vE '^\s*(0.0|%CPU)' |sed -n '1h;$!H;$g;s/\n/ +/gp'`
#$    bc <<< $LINE
#}

#memused() {
#    read t f <<< `grep -E 'Mem(Total|Free)' /proc/meminfo |awk '{print $2}'`
#    bc <<< "scale=2; 100 - $f / $t * 100" | cut -d. -f1
#}

#network() {
#    read lo int1 int2 <<< `ip link | sed -n 's/^[0-9]: \(.*\):.*$/\1/p'`
#    if iwconfig $int1 >/dev/null 2>&1; then
#        wifi=$int1
#        eth0=$int2
#    else
#        wifi=$int2
#        eth0=$int1
#    fi
#    ip link show $eth0 | grep 'state UP' >/dev/null && int=$eth0 ||int=$wifi
#
#    #int=eth0
#
#    ping -c 1 8.8.8.8 >/dev/null 2>&1 &&
#        echo "$int  connected" || echo "$int  disconnected"
#}

groups() {
  cur=`xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}'`
  all=("" "" "" "")
  all[$cur]="%{U#FF37393d}%{+u}${all[${cur}]}%{-u}"

  echo "${all[*]}"
}

nowplaying() {
    cur=`mpc current`
    # this line allow to choose whether the output will scroll or not
    echo " $cur"
}

battery() {
  BATN=$(ls /sys/class/power_supply/ | grep BAT)
  test -z "$BATN" && exit 1
  BATC=/sys/class/power_supply/$BATN/capacity
  BATS=/sys/class/power_supply/$BATN/status
  
  tot=`cat $BATC`
  if [ $tot -lt 50 ]; then
    icon=""
  else
    icon=""
  fi

  # prepend percentage with a '+' if charging, '-' otherwise
  test "`cat $BATS`" = "Charging" && echo -n ' ' || echo -n "$icon "
  # print out the content
  sed -n p $BATC
}

windows() {
  wnd_focus=$(xdotool getwindowfocus)
  wnd_title=$(xprop -id $wnd_focus WM_NAME)
  
  lookfor='"(.*)"' 

  if [[ "$wnd_title" =~ $lookfor ]]; then 
      wnd_title=${BASH_REMATCH[1]} 
      echo $wnd_title 
  fi
}

# This loop will fill a buffer with our infos, and output it to stdout.
while :; do
    buf=""
    buf="%{l}%{B#FFfafafa}%{F#FF37393d} $(groups) "
   # buf="${buf} network: $(network) | "
   # buf="${buf} CPU: $(cpuload)%% -"
   # buf="${buf} RAM: $(memused)%% -"
    buf="${buf}%{F-}%{B-}  $(windows) "
    buf="${buf} %{r} %{B#FFfafafa}%{F#FF37393d} $(volume)  "
    buf="${buf}  $(nowplaying) "
    buf="${buf}  $(battery)% "
    buf="${buf}  $(clock) "
    buf="${buf}  %{r} %{B-}%{F-}"

    echo $buf
    # use `nowplaying scroll` to get a scrolling output!
    sleep 0.1 # The HUD will be updated every second
done
