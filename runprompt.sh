#dmenu_run -nb '#151515' -nf '#aaaAAA' -sb '#353535' -sf '#fffFFF' -l 10 -fn -*-lemon-*-*-*-10-*-*-*-*-*-*
mon_width=1920
mon_height=1080
 
sel_bg=$orange
sel_fg=$BASE_01
nor_bg=$BASE_01
nor_fg=$BASE_05
dim_bg=$BASE_00
 
font="-*-lemon-medium-*-*-*-10-*-*-*-*-*-*-*"
 
dm_x=$(($mon_width / 2 - 160))
dm_y=$(($mon_height/2))
dmenu_run -i -p "Run >" -l 5 -w 320 -h 20 -x $dm_x -y $dm_y -nb "#252525" -nf "#fafafa" -sb "#fafafa" -sf "#252525" -fn 'Monaco for Powerline-10'
