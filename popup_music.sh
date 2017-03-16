#!/usr/bin/zsh
# clickable popup for dzen + conky - calendar

FG='#008cd5'
BG='#222222'
VOL="$(amixer sget Master | tail -n 1)"
VOLL="$(cmus-remote -Q | grep vol_left | tail -c +4)"
VOLR="$(cmus-remote -Q | grep vol_right | tail -c +4)"
SHUFFLE="$(cmus-remote -Q | grep shuffle | tail -c +4)"
REPEAT="$(cmus-remote -Q | grep repeat | head -n 1 | tail -c +4)"
REPEAT_CUR="$(cmus-remote -Q | grep repeat_current | tail -c +4)"

(
 # Title
# echo "$VOL"
 echo "$VOLR | $VOLL"
 # The following lines go to slave window
echo "$SHUFFLE"
echo "$REPEAT"
echo "$REPEAT_CUR"

) | dzen2 -p '5' -x "150" -y "19" -w "460" -l "6" -sa 'c' -ta 'c' -fg $FG -bg $BG\
    -title-name 'popup_cal' -e 'onstart=uncollapse;button1=exit;button3=exit' && sleep 0.1s && transset-df --name popup_music 0.5

# "onstart=uncollapse" ensures that slave window is visible from start.
