# https://gist.github.com/BollaBerg/7a3fc9744d5bf6eb16f8aab5928df755
# https://gist.github.com/AntonFriberg/d1d028c66082889878f1987118a2d251

wifi_device=wlp0s20f3

nmcli con add \
  type wifi \
  ifname $wifi_device \
  con-name eduroam \
  ssid eduroam \
  ipv4.method auto \
  802-1x.eap peap \
  802-1x.phase2-auth mschapv2 \
  802-1x.identity $EDUROAM_username \
  802-1x.password $EDUROAM_password \
  wifi-sec.key-mgmt wpa-eap

nmcli connection up eduroam
# this is untested with variables, it should work tho
