pass=$(cat bin/pass)
echo $pass | sudo -S mount -t nfs -o rw 192.168.1.10:/music /home/tato/usr/music
echo $pass | sudo -S mount -t nfs -o rw 192.168.1.10:/media /home/tato/usr/video
echo $pass | sudo -S mount -t nfs -o rw 192.168.1.10:/ebooks /home/tato/usr/books
