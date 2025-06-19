#!/bin/bash
service=$(systemctl status firewall.service | grep 'Active:')
echo $service
status=$(echo "$service" | sed 's/     Active: active.*/on/ ; s/     Active: inactive.*/off/')
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
