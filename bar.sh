#!/bin/bash



f=$(cat /home/$USER/.colors | grep FORE | awk '{print $2}')
b=$(cat /home/$USER/.colors | grep BACK | awk '{print $2}')
n=$(cat /home/$USER/.colors | grep NEUT | awk '{print $2}')

echo "$f"
echo "$b"

./bin/bar_mk.sh $n | lemonbar -p -g 1520x30+200+0 -u 3 \
-f 'Monaco for Powerline-11' \
-B $b -F $f | while read -r line; do
  $line
done

