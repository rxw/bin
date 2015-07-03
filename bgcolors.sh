#!/bin/bash

#if [ $(tail -c 3 $1)="png" ]
#then
#  echo "Not a png."
#  exit
#fi

mv /home/$USER/.Xdefaults /home/$USER/.Xdefaults.bak
head -n 9 .Xdefaults.bak > .Xdefaults

cont=0
for i in $(colors -en 16 $1)
do
  cont=$(( cont + 1 ))
  case $cont in
    2)
      background=$i
      ;;
    15)
      foreground=$i
      ;;
  esac
  printf "*color%d:%s\n" $cont $i >> /home/$USER/.Xdefaults
done

printf "\n*background:%s" $background >> /home/$USER/.Xdefaults
printf "\n*foreground:%s" $foreground >> /home/$USER/.Xdefaults

folder=$(dirname $1)
feh --bg-fill $1

cp $1 "$folder/wp.png"
