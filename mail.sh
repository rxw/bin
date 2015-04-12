pass=$(cat bin/password)
new=$(curl -u tato@uribe.com.mx:$pass --silent "https://mail.google.com/mail/feed/atom" | tr -d '\n' | awk -F '<entry>' '{for (i=2; i<=NF; i++) {print $i}}' | sed -n "s/<title>\(.*\)<\/title.*name>\(.*\)<\/name>.*/\2 - \1/p" | wc -l)
rm usr/mail
echo $new > usr/mail
sleep 60
