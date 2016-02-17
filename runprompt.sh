fn=-*-proggycleansz-medium-*-*-13-*-*-*-*-*-*

colorea() {
  cl=$(xrdb -query colors | grep color${1})
  clfixed=$(echo ${cl} | awk '{print $2}' | tr -d '#')
  echo "#${clfixed}"
}

b='#151515' #$(colorea 1)
n=$(colorea 7)
f=$(colorea 14)

mon_width=1920
mon_height=1080

dm_x=$(($mon_width / 2 - 160))
dm_y=$(($mon_height/2))
dmenu_run -i -p "Run >" -l 5 -w 320 -lh 20 -x $dm_x -y $dm_y -nb "$b" -nf "$f" -sb "$f" -sf "$b" -fn $fn
