ps aux | grep 'bar -g' | awk '{print $2}' | while read line ; do
kill $line
done
