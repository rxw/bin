#dmenu_run -nb '#151515' -nf '#aaaAAA' -sb '#353535' -sf '#fffFFF' -l 10 -fn -*-lemon-*-*-*-10-*-*-*-*-*-*
mon_width=1920
mon_height=1080


f=$(cat /home/$USER/.colors | grep FORE | awk '{print $2}' | tr -d 'F')
b=$(cat /home/$USER/.colors | grep BACK | awk '{print $2}' | tr -d 'F')
n=$(cat /home/$USER/.colors | grep NEUT | awk '{print $2}' | tr -d 'F')

dm_x=$(($mon_width / 2 - 160))
dm_y=$(($mon_height/2))
dmenu_run -i -p "Run >" -l 5 -w 320 -h 20 -x $dm_x -y $dm_y -nb $b -nf $f -sb $n -sf $f -fn -*-tewi-medium-*-*-*-11-*-*-*-*-*-*-*
