#!/bin/bash

prompt="system: $(uptime -p)"
i3_reload="  Reload i3"
i3_restart="  Restart i3"
i3_exit="  Exit i3"
system_shutdown="  Shutdown system"
system_restart="  Restart system"

options="$i3_reload\n$i3_restart\n$i3_exit\n$system_restart\n$system_shutdown\nreturn"

menu() {
    echo -e "$1" | rofi -dmenu -p "$2" -no-click-to-exit -hover-select -me-select-entry '' -me-accept-entry MousePrimary -theme ~/.config/rofi/themes/power_menu.rasi
}

confirm() {
	local c=$(menu "no\nyes" "are you sure?")
	[[ "$c" = "no" ||  "$c" = "" ]] && return 1
	return 0
}

res=$(menu "$options" "$prompt")

case $res in
    $i3_reload)
		confirm && i3-msg reload > /dev/null;;
    $i3_restart)
		confirm && i3-msg restart > /dev/null;;
    $i3_exit)
		confirm && i3-msg exit > /dev/null;;
    $system_shutdown)
		confirm && shutdown now;;
    $system_restart)
		confirm && reboot;;
    *);;
esac
