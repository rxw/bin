music_path="$HOME/usr/music"
path=$(mpc -f "%file%" | head -n 1 | cut -f 1-3 -d "/")

cover() {
  if [[ "$path" != "" ]]; then
    convert "$music_path/$path/cover.jpg" -scale 250x250 \( +clone -background black -shadow 60x5+10+10 \) +swap -background transparent -layers merge +repage /tmp/art.png
     convert $HOME/usr/img/bg.png /tmp/art.png -geometry +3480+50 -composite /tmp/bg.png
    nitrogen --set-auto /tmp/bg.png
    #feh --bg-tile "$music_path/$path/cover.jpg"
  fi
}

cover

while true; do
  pathnew=$(mpc -f "%file%" | head -n 1 | cut -f 1-3 -d "/")
  
  if [[ "$path" != "$pathnew" ]]; then
    path=$(mpc -f "%file%" | head -n 1 | cut -f 1-3 -d "/")
    pathnew="$path"

    cover
  fi

  sleep 0.5

done
