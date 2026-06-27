#!/bin/sh

uci -q get smp_affinity && exit 0
touch /etc/config/smp_affinity

uci -q batch << EOF
  set smp_affinity.general=smp_affinity
  set smp_affinity.general.enable='1'
  set smp_affinity.general.enable_log='1'
  set smp_affinity.netdev=netdev
  set smp_affinity.netdev.enable='1'
  set smp_affinity.netdev.rps_flow_cnt='8192'
  set smp_affinity.netdev.rps_sock_flow_entries='65535'
  commit smp_affinity
EOF

exit 0
