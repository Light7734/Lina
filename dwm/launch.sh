while true; do
    killall picom -w
    killall dwm -w
    killall dwmbar.sh -w

    feh --bg-fill ~/pictures/wallpapers/1.jpg
    picom -b --config="/home/light/.config/picom/picom.confg"

    /home/light/dev/dwm/dwmbar.sh &

    dwm 2> ~/.dwm.log
done
