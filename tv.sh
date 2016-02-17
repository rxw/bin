#! /bin/sh
#
# A script to manage my progress in tv shows.
# The shows must be in folders named after the show,
# these should be stored in your $tvdir.
# It also assumes the number of the episode
# is somewhere in the name.
# Depends on dtach and mpv.
#
# wtfpl(c) - tato

tvdir=~/usr/tv
directory=$(find $tvdir -maxdepth 1 -iname *$1*)
name=${directory##*/}
episodes=$(printf "%02d" $(ls "$directory" | wc -l))

if [[ ! -f ~/.neet ]]; then
  touch ~/.neet
fi

info=$(grep "$name" ~/.neet)

if [[ $info == "" ]]; then
  printf "%s\t01/%02d\n" "$name" $episodes >> ~/.neet
else
  watching=$(grep "$name" ~/.neet | grep -o -E "[0-9]+/" | tr -d /)
  
  if [ $((10#$watching)) -lt $episodes ]; then
    towatch=$( printf "%02d" $(( $((10#$watching))+1 )))
    sed -i "s/$name\t$watching\/[0-9]\+/$name\t$towatch\/$episodes/g" ~/.neet
  fi

fi


if [[ $name != "" ]]; then
  
  episode=$(find $tvdir -iname "*$name*$watching*")
  lines=$(echo $episode | wc -l)

  if [[ $lines -gt 1 ]]; then
    echo "Search too broad. Please try being more specific."
    exit
  fi
  
  echo "Now watching $name episode $watching"

  dtach -n tv mpv --save-position-on-quit "$episode"

fi
