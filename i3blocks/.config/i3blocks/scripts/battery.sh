#!/bin/bash

BAT=$(cat /sys/class/power_supply/BAT0/capacity)
STATUS=$(cat /sys/class/power_supply/BAT0/status)

STAT=""

# port from gucharmap
# :s/\ //g
# :s/0x/\\x/g

# battery_0="\xEF\x96\x8D"
# battery_urgent="\xEF\x96\x82"
battery_0="\xEF\x96\x82"
battery_1="\xEF\x95\xB9"
battery_2="\xEF\x95\xBA"
battery_3="\xEF\x95\xBB"
battery_4="\xEF\x95\xBC"
battery_5="\xEF\x95\xBD"
battery_6="\xEF\x95\xBE"
battery_7="\xEF\x95\xBF"
battery_8="\xEF\x96\x80"
battery_9="\xEF\x96\x81"
battery_10="\xEF\x95\xB8"

charge="\xEE\x80\x8A"

charge_level="$((BAT / 10))"
battery_var=$(eval "echo \$battery_$charge_level")

battery_text="<span font=\"Symbols Nerd Font\">$battery_var</span>"
charge_text="<span font=\"Symbols Nerd Font\">$charge</span>"
batterylevel_text="<span>$BAT%</span>"

full_text="$battery_text$batterylevel_text"
if test "$STATUS" = "Charging"; then
    full_text="$charge_text$full_text"
fi

echo -e "$full_text"
echo -e "$full_text"

if [ $BAT -le 10 ]; then
    echo "#FF0000"
elif [ $BAT -le 20 ]; then
    echo "#FF8000"
else
    echo "#00FF00"
fi

exit 0
