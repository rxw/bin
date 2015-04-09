## Make changes to the size of the bar depending on the resolution of your display
./bin/bar_mk.sh | bar -p -g 1920x20+1920+0 -f -*-lemon-*-*-*-*-10-*-*-*-*-*-*-*,-misc-stlarch-medium-r-normal--10-100-75-75-c-80-iso10646-1 -B#FF353535 -F#FFcfcfcf | while read -r line; do
  if [ "$line" = "mpc next" ] || [ "$line" = "mpc toggle" ] || [ "$line" = "mpc prev" ]; then
    $line
  fi
done
