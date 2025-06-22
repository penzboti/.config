#!/bin/bash

service=$(systemctl status firewall.service 2>&1)

# its important to note this script was made for nixos; other distros might not benefit from this script
if [[ $(echo "$service" | sed 's/Unit firewall.service could not be found\./no/') == "no" ]]; then
  echo "firewall not found"
  exit 1
fi

active=$(echo "$service" | grep 'Active:')
echo $active
status=$(echo "$active" | sed 's/     Active: active.*/on/ ; s/     Active: inactive.*/off/')
echo "$status"

if [[ $status == "on" ]] ;then
  echo stopping
  systemctl stop firewall.service
  notify-send firewall off

else
  if [[ $status == "off" ]] ;then
    echo turning on
    nixos-firewall-tool reset
    notify-send firewall on
  fi
fi
