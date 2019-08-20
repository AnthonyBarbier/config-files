#!/bin/bash

i3status | while read line; do
  stats=`network_stats.sh`
  echo "$stats $line"
done
