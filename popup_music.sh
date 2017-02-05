#!/usr/bin/zsh
# clickable popup for dzen + conky - calendar

FG='#008cd5'
BG='#222222'
VOL="$(amixer sget Master | tail -n 1)"

(
 # Title
 echo "$VOL"
 # The following lines go to slave window
 conky -c $HOME/.conky/conkyrc-music-popup
) | dzen2 -p '5' -x "150" -y "19" -w "460" -l "6" -sa 'c' -ta 'c' -fg $FG -bg $BG\
    -title-name 'popup_cal' -e 'onstart=uncollapse;button1=exit;button3=exit' && sleep 0.1s && transset-df --name popup_music 0.5

# "onstart=uncollapse" ensures that slave window is visible from start.
