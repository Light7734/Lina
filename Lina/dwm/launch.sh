while true; do
    killall picom -w
    killall dwm -w
    killall dwmbar.sh -w

    nitrogen --restore &

    picom --experimental-backends -b --config="/home/light/.config/picom/picom.conf" &

    /home/light/dev/dwm/dwmbar.sh &

    dwm 2> ~/.dwm.log
done
