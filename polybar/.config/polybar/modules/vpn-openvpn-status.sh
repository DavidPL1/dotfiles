#!/bin/sh


printf "VPN: " && (echo $(/opt/cisco/anyconnect/bin/vpn status | awk '{print $4}') | awk '{print $3}' | cut -d '.' -f 1 && echo down) | head -n 1
#printf "VPN: " && (pgrep -a vpnagentd$ | head -n 1 | awk '{print $NF }' | cut -d '.' -f 1 && echo down) | head -n 1
