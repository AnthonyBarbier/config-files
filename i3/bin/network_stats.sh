#!/bin/bash

#ip -h -j -s link

ip -h -j -s link | jq -c '.[] | select(.ifname != "lo") | select(.stats64.tx.bytes != 0) | select(.stats64.rx.bytes != 0) |  [.ifname,  .stats64
.rx.bytes, .stats64.tx.bytes]'| tr '[]' ',,' | while read line; do
  interface=`echo $line | cut -d"," -f2 | tr -d '"'`
  received=`echo $line | cut -d"," -f3`
  sent=`echo $line | cut -d"," -f4`
  received=`numfmt --to=iec-i --suffix=B $received`
  sent=`numfmt --to=iec-i --suffix=B $sent`
  printf "| $interface ↓$received/↑$sent "
done
printf "|"
