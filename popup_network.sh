#!/usr/bin/zsh
# dzen popup for network information

FG='#008cd5'
BG='#222222'
FILE=/tmp/ipinfo
EXIP=$(cat $FILE | grep '\"ip\"' | tr -d '\"' | tr -d ',' | tail -c 15)
CITY=$(cat $FILE | grep city | tr -d '\"' | tr -d ',')
STATE=$(cat $FILE | grep region | tr -d '\"' | tr -d ',')
LOC=$(cat $FILE | grep loc | tr -d '\"' | tr -d ',')
ORG=$(cat $FILE | grep '\"org\"' | tr -d '/"')
wMAC=$(cat /sys/class/net/wlp3s0/address)
eMAC=$(cat /sys/class/net/enp0s25/address)

(
 #Title
 echo "Network Information"
 #The following lines go to slave window
 echo "-------------------"
 conky -c $HOME/.conky/conkyrc-net
 echo "External IP: $EXIP"
 echo "wMAC: $wMAC"
 echo "eMAC: $eMAC"
 echo ""
 echo "$CITY"
 echo "$STATE"
 echo ""
 echo "$LOC"
 echo "$ORG"
) | dzen2 -p '5' -x "1220" -y "19" -w "385" -l "13" -sa 'c' -ta 'c' -fg $FG -bg $BG\
    -title-name 'popup_network' -e 'onstart=uncollapse;button1=exit;button3=exit'

# "onstart=uncollapse" ensures that slave window is visible from start.
