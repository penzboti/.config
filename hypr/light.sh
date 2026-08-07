# min is 960 (i dont know who came up with this number, but i hate him)
# we go by percentages, but cant get current percentage
# minimum and maximum is handled by brightnessctl

current=$(brightnessctl get)

if [ "$1" = "-" ]; then
  brightnessctl set 5%-
elif [ "$1" = "+" ]; then
  [ $current = "960" ] && brightnessctl set 4%+ || brightnessctl set 5%+
fi
