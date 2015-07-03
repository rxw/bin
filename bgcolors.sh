#!/bin/bash

folder=$(dirname $1)
name=${1::-4}
image=$1
if [ $(echo $1 | tail -c 4)="png" ]
then
  image="${name}.png"
  convert $1 $image
fi

mv /home/$USER/.Xdefaults /home/$USER/.Xdefaults.bak
head -n 9 .Xdefaults.bak > .Xdefaults

cont=0
for i in $(colors -en 16 $image)
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

feh --bg-fill $image

cp $image "$folder/wp.png"
