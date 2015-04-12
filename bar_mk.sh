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
  echo " $hour"
}

volume() {
  vol=$(amixer get Master | sed -n 'N;s/^.*\[\([0-9]\+%\).*$/\1/p')
  echo "   $vol"
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
  next=$(($cur + 1))
  all=(   )
  all[$cur]="${grpfg}"
  if [ "$cur" = 3 ]; then
    all[0]="${grpmg}"
  else
    all[$next]="${grpmg}"
  fi

  echo "${all[*]}"
}

nowplaying() {
    cur=`mpc current`
    # this line allow to choose whether the output will scroll or not
    echo " $cur"
}

playcontrol() {
  a=$(mpc --format "" | grep -P -o "(?<=\[)[^\[]+(?=\])" )
  if [ "$a" = "playing" ]; then
    icon=""
  else
    icon=""
  fi
  prev="%{A:mpc prev:}%{A}" 
  toggle="%{A:mpc toggle:}$icon%{A}"
  next=" %{A:mpc next:}%{A}"
  echo "$prev $toggle $next"
}
battery() {
  BATC=/sys/class/power_supply/BAT0/capacity
  BATS=/sys/class/power_supply/BAT0/status
  tot=`cat $BATC`
  if [ $tot -lt 50 ]; then
    icon=""
  else
    icon=""
  fi
  # prepend percentage with a '+' if charging, '-' otherwise
  test "`cat $BATS`" = "Charging" && echo -n '' || echo -n "$icon "
  # print out the content
  sed -n p $BATC
}

# This loop will fill a buffer with our infos, and output it to stdout.
while :; do
    buf=""
    buf="%{l} $(groups) "
   # buf="${buf} network: $(network) | "
   # buf="${buf} CPU: $(cpuload)%% -"
   # buf="${buf} RAM: $(memused)%% -"
    buf="${buf} %{r} $(volume)%%  "
    buf="${buf} $(playcontrol) "
    buf="${buf}  $(nowplaying) "
    buf="${buf}  $(battery)%% "
    buf="${buf}  $(clock) "
    buf="${buf}  %{r} "

    echo $buf
    # use `nowplaying scroll` to get a scrolling output!
    sleep 0.1 # The HUD will be updated every second
done
