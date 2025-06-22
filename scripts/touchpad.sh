#!/bin/bash
# INFO: https://www.reddit.com/r/hyprland/comments/1bqohmd/dynamically_enabledisable_device/

alldevices=$(hyprctl devices 2>&1)
# hyprland check
if [[ $(echo "$alldevices" | sed 's/.*command not found/no/') == "no" ]] ;then
  echo "hyprland is not installed"
  exit 1
fi

device="$(echo "$alldevices" | grep touchpad | sed '/2-synaptics-touchpad/d; s/.*	//')"
variable="device[${device}]:enabled"

statusfile="/home/penzboti/.cache/touchpad.status"
error=false

if [ -f "$statusfile" ] ;then
  ret=$(hyprctl -r -- keyword "$variable" true)
  echo $ret
  if [[ $ret != "ok" ]] ;then error=true
  else
    rm "$statusfile"
    notify-send touchpad enabled 
  fi

else
  ret=$(hyprctl -r -- keyword "$variable" false)
  echo $ret
  if [[ $ret != "ok" ]] ;then error=true
  else
    touch "$statusfile"
    notify-send touchpad disabled 
    fi
fi

if [[ $error == true ]] ;then notify-send "error occured while toggling touchpad; run the script to check the logs."; fi

# in case it breaks; uncomment this
# hyprctl keyword device:a true > /dev/null 2>&1
